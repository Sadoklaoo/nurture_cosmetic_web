import { Component, Inject, OnInit } from '@angular/core';
import { FormBuilder, FormControl, FormGroup, Validators } from '@angular/forms';
import { NB_AUTH_OPTIONS, getDeepFromObject } from '@nebular/auth';
import { AllergyService } from '../../../services/allergy.service';
import { CategoryService } from '../../../services/category.service';
import { mimeType } from '../../../validators/mime-type.validator';

@Component({
  selector: 'ngx-add-allergy',
  templateUrl: './add-allergy.component.html',
  styleUrls: ['./add-allergy.component.scss']
})
export class AddAllergyComponent implements OnInit {
  file:File;
  selectedFile: ImageSnippet;
  imagePreview: string;
  allergy: any = {};
  submitted: boolean = false;
  registerForm: FormGroup;
  redirectDelay: number = 0;
  showMessages: any = {};
  strategy: string = 'phone';
  constructor(
    @Inject(NB_AUTH_OPTIONS) protected options = {},
    private allergyService : AllergyService,
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

  addAllergy() {
    const AllergyName = this.allergy.AllergyName;
    

    this.allergyService.addAllergy(
      AllergyName,
      this.file.name
    );

    console.log("Allergy Inside component.Ts");
    console.log(this.allergy);
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
     this.allergyService.uploadImage(this.selectedFile.file).subscribe(
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