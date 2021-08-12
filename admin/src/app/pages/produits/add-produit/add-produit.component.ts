import { HttpHeaders } from "@angular/common/http";
import { Component, Inject, OnInit } from "@angular/core";
import { FormBuilder, FormControl, FormGroup, Validators } from "@angular/forms";
import { DomSanitizer } from "@angular/platform-browser";
import { getDeepFromObject, NB_AUTH_OPTIONS } from "@nebular/auth";
import { NbDialogService } from "@nebular/theme";
import { CategoryService } from "../../../services/category.service";
import { ProductService } from "../../../services/product.service";
import { mimeType } from "../../../validators/mime-type.validator";

@Component({
  selector: "ngx-add-produit",
  templateUrl: "./add-produit.component.html",
  styleUrls: ["./add-produit.component.scss"],
})
export class AddProduitComponent implements OnInit {
  file:File;
  selectedFile: ImageSnippet;
  imagePreview: string;
  submitted: boolean = false;
  registerForm: FormGroup;
  redirectDelay: number = 0;
  showMessages: any = {};
  strategy: string = 'phone';

  token: string;
  httpOptions: { headers: HttpHeaders };
  product: any = {};
  currentProduct: any;
  productIngredients: any;
  productAllergies: any;
  finalTypes: any  = [];
  categories: any;
  skintypes: any;
  selectedTypes: any;
  loading = false;
  selectedProduct = 0;
  selectedCategory = 0;
  selectedSkin = 0;
  BaseLink;

  productTypes: any;
  constructor(
    @Inject(NB_AUTH_OPTIONS) protected options = {},
    private service: ProductService,
    private categoryService: CategoryService,
    private formBuilder: FormBuilder,
    
  ) {
    this.redirectDelay = this.getConfigValue('forms.login.redirectDelay');
    this.showMessages = this.getConfigValue('forms.login.showMessages');
    this.strategy = this.getConfigValue('forms.login.strategy');

    this.skintypes = [
      {
        id: 0,
        name: "NORMAL",
      },
      {
        id: 1,
        name: "OILED",
      },
      {
        id: 2,
        name: "MIXED",
      },
      {
        id: 3,
        name: "SEC",
      },
    ];
  }

  getConfigValue(key: string): any {
    return getDeepFromObject(this.options, key, null);
  }

  

  ngOnInit(): void {

    this.registerForm = this.formBuilder.group(
      {
        image: new FormControl(null, {
          validators: [Validators.required],
          asyncValidators: [mimeType],
        }),
        acceptTerms: [false, Validators.requiredTrue],
      },
      {}
    );

    this.service.listProductType().subscribe((response) => {
      this.productTypes = response;
    });
    this.categoryService.listCategories().subscribe((res) => {
      this.categories = res;
    });
  }
  toggle(checked,item) {
   if(this.finalTypes.indexOf(item)==-1){
     this.finalTypes.push(item);
   }else{
     this.finalTypes.splice(this.finalTypes.indexOf(item),1)
   }
  
    
  }

  addProduct() {
   // const AllergyName = this.allergy.AllergyName;

   // this.allergyService.addAllergy(AllergyName, this.file.name);
    
   this.service.addProduct(this.product.ProductName,
    this.product.Reference,
    this.product.Price,
    this.categories[this.selectedCategory],
    this.product.ProductDescription,
    this.product.ProductSecondDescription,
    this.product.ProductDimensions,
    this.finalTypes,
    this.skintypes[this.selectedSkin].name,
    this.file.name)
    console.log("Product Inside component.Ts");
   // console.log(this.skintypes[this.selectedSkin]);
   //console.log(this.categories[this.selectedCategory]);

  }

  processFile(imageInput: any) {
    this.file = imageInput.files[0];
    const reader = new FileReader();
    this.file = (event.target as HTMLInputElement).files[0];
    console.log(this.file);
    this.registerForm.patchValue({ image: this.file });
    this.registerForm.get("image").updateValueAndValidity();

    reader.onload = () => {
      this.imagePreview = reader.result as string;
    };
    reader.addEventListener("load", (event: any) => {
      this.selectedFile = new ImageSnippet(event.target.result, this.file);

      this.selectedFile.pending = true;
      this.service.uploadImage(this.selectedFile.file).subscribe(
        (res) => {
          this.onSuccess();
        },
        (err) => {
          this.onError();
        }
      );
    });

    reader.readAsDataURL(this.file);
    console.log(this.file.name);
  }

  private onSuccess() {
    this.selectedFile.pending = false;
    this.selectedFile.status = "ok";
  }

  private onError() {
    this.selectedFile.pending = false;
    this.selectedFile.status = "fail";
    this.selectedFile.src = "";
  }
}
class ImageSnippet {
  pending: boolean = false;
  status: string = 'init';

  constructor(public src: string, public file: File) {}
}