import { isNullOrUndefined } from "util";
import { HttpErrorResponse, HttpHeaders } from "@angular/common/http";
import { Component, Inject, OnInit, ViewChild } from "@angular/core";
import {
  FormBuilder,
  FormControl,
  FormGroup,
  Validators,
} from "@angular/forms";
import { DomSanitizer } from "@angular/platform-browser";
import { getDeepFromObject, NB_AUTH_OPTIONS } from "@nebular/auth";
import {
  NbComponentStatus,
  NbDialogService,
  NbStepperComponent,
  NbToastrService,
} from "@nebular/theme";
import { CategoryService } from "../../../services/category.service";
import { ProductService } from "../../../services/product.service";
import { mimeType } from "../../../validators/mime-type.validator";
import { ShowcaseDialogComponent } from "../../modal-overlays/dialog/showcase-dialog/showcase-dialog.component";
import { Product } from "../../../entities/Product";

@Component({
  selector: "ngx-add-produit",
  templateUrl: "./add-produit.component.html",
  styleUrls: ["./add-produit.component.scss"],
})
export class AddProduitComponent implements OnInit {
  @ViewChild("stepper") stepper: NbStepperComponent;
  file: File;
  selectedFile: ImageSnippet;
  imagePreview: string;
  submitted: boolean = false;
  registerForm: FormGroup;
  redirectDelay: number = 0;
  showMessages: any = {};
  strategy: string = "phone";
  checked = false;
  token: string;
  httpOptions: { headers: HttpHeaders };
  product: any = {};
  currentProduct: any;

  productAllergies: any;
  finalTypes: any = [];
  finalCategories: any = [];
  finalSkins: any = [];

  categories: any;
  skintypes: any;
  selectedTypes: [];
  loading = false;
  selectedProduct = 0;
  selectedCategory = [];

  selectedSkin = [];
  BaseLink;
  linearMode = true;
  productTypes: any;
  productCategories: any;
  searchStringOthers: string;
  searchString: string;
 

  Others: any;
  constructor(
    @Inject(NB_AUTH_OPTIONS) protected options = {},
    private service: ProductService,
    private categoryService: CategoryService,
    private formBuilder: FormBuilder,
    private dialogService: NbDialogService,
    private toastrService: NbToastrService
  ) {
    this.redirectDelay = this.getConfigValue("forms.login.redirectDelay");
    this.showMessages = this.getConfigValue("forms.login.showMessages");
    this.strategy = this.getConfigValue("forms.login.strategy");

    this.skintypes = [
      {
        id: 1,
        SkinTypeName: "NORMAL",
      },
      {
        id: 2,
        SkinTypeName: "OILED",
      },
      {
        id: 3,
        SkinTypeName: "MIXED",
      },
      {
        id: 4,
        SkinTypeName: "SEC",
      },
      {
        id: 5,
        SkinTypeName: "SENSITIVE",
      },
    ];
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
  getConfigValue(key: string): any {
    return getDeepFromObject(this.options, key, null);
  }

  open(title, message) {
    this.dialogService.open(ShowcaseDialogComponent, {
      context: {
        title: title,
        message: message,
      },
    });
  }
  /*Get Category,type & skintypes values*/
  onFirstSubmit() {
    this.finalCategories = [];
    this.finalTypes = [];
    this.finalSkins = [];
    this.product.isShown = this.checked;
    this.selectedCategory.forEach((item) => {
      this.finalCategories.push(this.categories.find((cat) => cat.id == item));
    });
    this.selectedTypes.forEach((item) => {
      this.finalTypes.push(this.productTypes.find((cat) => cat.id == item));
    });
    this.selectedSkin.forEach((item) => {
      this.finalSkins.push(this.skintypes.find((cat) => cat.id == item));
    });
    this.product.Categories = this.finalCategories;
    this.product.Type = this.finalTypes;
    this.product.SkinTypes = this.finalSkins;
  }
  /*Reset Stepper */
  onReset() {
    this.selectedCategory = [];
    this.selectedTypes = [];
    this.selectedSkin = [];
    this.file = null;
    this.selectedFile = null;
    this.imagePreview = null;
    this.stepper.reset();
  }
  /*Validate Category,type & skintypes */
  categoriesValidation() {
    if (
      this.selectedCategory.length != 0 &&
      this.selectedTypes.length != 0 &&
      this.selectedSkin.length != 0
    ) {
      this.stepper.next();
    }
  }

  /* Filter Others ingredients */
  Search(search:string) {
    console.log(search);
    if (search != "" ) {
      this.Others = this.Others.filter((res) => {
        return res.IngredientName.toLowerCase().startsWith(
          search.toLowerCase()
        );
      });
    } 
    else {
      this.service.getOther(this.product.id).subscribe((response) => {
        this.Others = response;
       
      });
    }
  }
  /* Filter Products ingredients */
  SearchIngredient(search:string) {
    if (search != "") {
      this.product.ProductIngredients = this.product.ProductIngredients.filter((res) => {
        return res.IngredientName.toLowerCase().startsWith(
          search.toLowerCase()
        );
      });
    } else {
      this.getCurrentProduct();
    }
  }
  /* Insert Product*/
  async addProduct() {
    (
      await this.service.addProduct(
        this.product.ProductName,
        this.product.Reference,
        this.product.Price,
        this.product.Categories,
        this.product.ProductShortDescription,
        this.product.usingAdvice,
        this.product.isShown,
        this.product.Type,
        this.product.SkinTypes,
        this.file.name
      )
    ).subscribe(
      (response) => {
        //    console.log(this.getAuthData().token)
        console.log(response);
      },
      async (error: HttpErrorResponse) => {
        // tslint:disable-next-line: triple-equals
        if (error.status == 404) {
          console.log("Please Verify storeID");
          return "Not Found";
          // tslint:disable-next-line: triple-equals
        } else if (error.status == 409) {
          this.showToastReference("danger");
          return "Reference";
          // tslint:disable-next-line: triple-equals
        } else if (error.status == 400) {
          this.showToastData("danger");
          return "Missing Data";

          // tslint:disable-next-line: triple-equals
        } else if (error.status == 201) {
          this.showToast("success");
          this.stepper.next();
          this.getCurrentProduct();
        }
      }
    );
  }
  /* Get Product By reference after successful insert */
  async getCurrentProduct() {
    await this.service
      .getProductByReference(this.product.Reference)
      .subscribe((res) => {
        this.product = res;
        console.log(res);
        this.getOtherIngredients();
      });
  }
  /* Toast Success */
  showToast(status: NbComponentStatus) {
    this.toastrService.show(status, `PRODUCT ADDED SUCCESSFULLY`, { status });
  }
  /* Toast In case Reference exist  */
  showToastReference(status: NbComponentStatus) {
    this.toastrService.show(status, `REFERENCE EXIST`, { status });
  }

  /* Toast In case Data is missing */
  showToastData(status: NbComponentStatus) {
    this.toastrService.show(status, `MISSING DATA`, { status });
  }
  /* get All ingredients */
  getOtherIngredients() {
    this.service.getOther(this.product.id).subscribe((response) => {
      this.Others = response;
    });
  }

  /* add ingredients */
  onAdd(id: number) {
    //console.log(id)
    this.service.addIngredientProduct(this.product.id, id);
    this.Others.forEach((element, index) => {
      if (element.id == id) {
        this.Others.splice(index, 1);
        this.product.ProductIngredients.push(element);
      }
    });
  }
  /* delete ingredients */
  onDelete(id: number) {
    //console.log(id)
    this.service.deleteIngredientProduct(this.product.id, id);
    this.product.ProductIngredients.forEach((element, index) => {
      if (element.id == id) {
        this.product.ProductIngredients.splice(index, 1);
        this.Others.push(element);
      }
    });
  }

  /* Process & Upload File */
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

  /* File Success*/
  private onSuccess() {
    this.selectedFile.pending = false;
    this.selectedFile.status = "ok";
  }

  /* File Error */
  private onError() {
    this.selectedFile.pending = false;
    this.selectedFile.status = "fail";
    this.selectedFile.src = "";
  }
}
class ImageSnippet {
  pending: boolean = false;
  status: string = "init";

  constructor(public src: string, public file: File) {}
}
