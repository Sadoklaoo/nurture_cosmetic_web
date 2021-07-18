
import { Component, Inject, OnInit } from '@angular/core';
import { FormBuilder, FormControl, Validators } from '@angular/forms';
import { FormGroup } from '@angular/forms';
import { getDeepFromObject, NB_AUTH_OPTIONS } from '@nebular/auth';
import { CategoryService } from '../../../services/category.service';
import { mimeType } from '../../../validators/mime-type.validator';

@Component({
  selector: 'ngx-add-category',
  templateUrl: './add-category.component.html',
  styleUrls: ['./add-category.component.scss']
})
export class AddCategoryComponent implements OnInit {
  file:File;
  selectedFile: ImageSnippet;
  imagePreview: string;
  category: any = {};
  submitted: boolean = false;
  registerForm: FormGroup;
  redirectDelay: number = 0;
  showMessages: any = {};
  strategy: string = 'phone';
  constructor(
    @Inject(NB_AUTH_OPTIONS) protected options = {},
    private categoryService : CategoryService,
    private formBuilder: FormBuilder,) {
    this.redirectDelay = this.getConfigValue('forms.login.redirectDelay');
      this.showMessages = this.getConfigValue('forms.login.showMessages');
      this.strategy = this.getConfigValue('forms.login.strategy');
  
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
  }
  getConfigValue(key: string): any {
    return getDeepFromObject(this.options, key, null);
  }

  addCategory() {
    const CategoryName = this.category.CategoryName;
    

    this.categoryService.addCategory(
      CategoryName,
      this.file.name
    );

    console.log("Category Inside component.Ts");
    console.log(this.category);
  }

  processFile(imageInput: any) {
    this.file = imageInput.files[0];
   const reader = new FileReader();
   this.file = (event.target as HTMLInputElement).files[0];
   console.log(this.file)
   this.registerForm.patchValue({ image: this.file });
   this.registerForm.get('image').updateValueAndValidity();

 reader.onload = () => {
   this.imagePreview = reader.result as string;
 };
   reader.addEventListener('load', (event: any) => {

     this.selectedFile = new ImageSnippet(event.target.result, this.file);

     this.selectedFile.pending = true;
     this.categoryService.uploadImage(this.selectedFile.file).subscribe(
       (res) => {
         this.onSuccess();
       },
       (err) => {
         this.onError();
       })
   });

   reader.readAsDataURL(this.file);
   console.log(this.file.name)
 }

 private onSuccess() {
  this.selectedFile.pending = false;
  this.selectedFile.status = 'ok';
}

private onError() {
  this.selectedFile.pending = false;
  this.selectedFile.status = 'fail';
  this.selectedFile.src = '';
}

}


class ImageSnippet {
  pending: boolean = false;
  status: string = 'init';

  constructor(public src: string, public file: File) {}
}
