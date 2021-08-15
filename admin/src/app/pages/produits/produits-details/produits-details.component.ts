import { HttpHeaders } from "@angular/common/http";
import { isNull } from "@angular/compiler/src/output/output_ast";
import { Component, Inject, OnInit } from "@angular/core";
import { CategoryService } from "../../../services/category.service";
import { ProductService } from "../../../services/product.service";
import { DomSanitizer } from "@angular/platform-browser";
import {
  FormBuilder,
  FormControl,
  FormGroup,
  Validators,
} from "@angular/forms";
import { getDeepFromObject, NB_AUTH_OPTIONS } from "@nebular/auth";
import { mimeType } from "../../../validators/mime-type.validator";
import { NbDialogService } from "@nebular/theme";
import { ShowcaseDialogComponent } from "../../modal-overlays/dialog/showcase-dialog/showcase-dialog.component";
@Component({
  selector: "ngx-produits-details",
  templateUrl: "./produits-details.component.html",
  styleUrls: ["./produits-details.component.scss"],
})
export class ProduitsDetailsComponent implements OnInit {
  file: File;
  selectedFile: ImageSnippet;
  imagePreview: string;
  submitted: boolean = false;
  registerForm: FormGroup;
  redirectDelay: number = 0;
  showMessages: any = {};
  strategy: string = "phone";

  token: string;
  httpOptions: { headers: HttpHeaders };
  product: any;
  currentProduct: any;
  productIngredients: any;
  productAllergies: any;
  categories: any;
  skintypes: any;
  selectedTypes: any = [];
  loading = false;
  selectedProduct = 0;
  selectedCategory = 0;
  selectedSkin = 0;
  BaseLink;
  finalTypes: any = [];
  productTypes: any;

  constructor(
    private service: ProductService,
    private categoryService: CategoryService,
    private sanitizer: DomSanitizer,
    private formBuilder: FormBuilder,
    private dialogService: NbDialogService,
    @Inject(NB_AUTH_OPTIONS) protected options = {}
  ) {
    this.redirectDelay = this.getConfigValue("forms.login.redirectDelay");
    this.showMessages = this.getConfigValue("forms.login.showMessages");
    this.strategy = this.getConfigValue("forms.login.strategy");
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

  open(title, message) {
    this.dialogService.open(ShowcaseDialogComponent, {
      context: {
        title: title,
        message: message,
      },
    });
  }

  editProduct() {
    if (this.selectedProduct == 0) {
      this.open(
        "Product Error",
        "Veuillez selectionner un produit pour modifier"
      );
    } else {
      let imageName;
      if (this.file == null && this.file == undefined) {
        imageName = this.currentProduct.Image;
      } else {
        imageName = this.file.name;
      }
      let typees: any = [];
      this.selectedTypes.forEach((item) => {
        this.productTypes.forEach((i) => {
          if (i.id == item) {
            typees.push(i);
          }
        });
      });
      this.finalTypes = typees;
      let category;
      this.categories.forEach((cat) => {
        if (cat.id == this.selectedCategory) {
          category = cat;
        }
      });

      if (
        this.currentProduct.ProductName != null &&
        this.currentProduct.ProductName != undefined &&
        this.currentProduct.Price != 0 &&
        this.currentProduct.Price != undefined &&
        this.currentProduct.ProductDescription != "" &&
        this.currentProduct.ProductDescription != undefined &&
        this.currentProduct.ProductSecondDescription != "" &&
        this.currentProduct.ProductSecondDescription != undefined &&
        this.currentProduct.ProductDimensions != null &&
        this.currentProduct.ProductDimensions != undefined
      ) {
        const product = {
          ProductName: this.currentProduct.ProductName,
          id: this.currentProduct.id,
          Reference: this.currentProduct.Reference,
          Category: category,
          ProductDescription: this.currentProduct.ProductDescription,
          ProductSecondDescription:
            this.currentProduct.ProductSecondDescription,
          ProductDimensions: this.currentProduct.ProductDimensions,
          PreferedSkinType: this.skintypes[this.selectedSkin].name,
          Type: this.finalTypes,
          Price: this.currentProduct.Price,
          Image: imageName,
        };
        this.service.editProduct(product);
      } else {
        this.open("Field Error", "Veuillez completer tout les champs");
      }
    }
  }

  getConfigValue(key: string): any {
    return getDeepFromObject(this.options, key, null);
  }

  compareById(v1, v2): boolean {
    return v1.id === v2.id;
  }

  toggleLoadingAnimation() {
    this.file = null;
    this.imagePreview = null;
    this.selectedFile = null;
    this.loading = true;
    this.service.getCurrentProduct(this.selectedProduct).subscribe((res) => {
      this.currentProduct = res;
      this.productIngredients = this.currentProduct.ProductIngredients;
      this.setSelectedCategory(this.currentProduct.Category.CategoryName);
      this.setSelectedSkin(this.currentProduct.PreferedSkinType);
      let ty = [];
      this.currentProduct.Type.forEach((element) => {
        //  this.selectedTypes[this.selectedTypes.length] = element.id;
        ty.push(element.id);
      });
      this.selectedTypes = ty;
      console.log(this.selectedTypes);
      this.BaseLink =
        "http://localhost:3000/images/" + this.currentProduct.Image;
    });

    this.service.listProductAllergy(this.selectedProduct).subscribe((res) => {
      this.productAllergies = res;
    });

    setTimeout(() => (this.loading = false), 2000);
  }
  checkValue(u) {
    let value = false;
    if (this.currentProduct != null) {
      this.currentProduct.Type.forEach((item) => {
        if (item.id == u.id) {
          value = true;
        }
      });
    }
    return value;
  }

  setSelectedCategory(categoryName) {
    if (categoryName != null) {
      this.categories.forEach((category, index) => {
        if (category.CategoryName == categoryName) {
          this.selectedCategory = index + 1;
        }
      });
    }
  }
  setSelectedSkin(skinName) {
    if (skinName != null) {
      this.skintypes.forEach((skin, index) => {
        if (skin.name == skinName) {
          this.selectedSkin = index;
          console.log("found" + this.selectedSkin);
        }
      });
    }
  }
  sanitize(url: string) {
    return this.sanitizer.bypassSecurityTrustUrl(url);
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

    this.service.listProducts().subscribe((response) => {
      this.product = response;
      console.log(response);
    });

    this.service.listProductType().subscribe((response) => {
      this.productTypes = response;
    });

    this.categoryService.listCategories().subscribe((res) => {
      this.categories = res;
    });
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
  status: string = "init";

  constructor(public src: string, public file: File) {}
}
