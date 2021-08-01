/**
 * @license
 * Copyright Akveo. All Rights Reserved.
 * Licensed under the MIT License. See License.txt in the project root for license information.
 */
// The file contents for the current environment will overwrite these during build.
// The build system defaults to the dev environment which uses `environment.ts`, but if you do
// `ng build --env=prod` then `environment.prod.ts` will be used instead.
// The list of which env maps to which file can be found in `.angular-cli.json`.
const baseUrl ='http://localhost:3000';
export const environment = {
  production: false,
  base : 'http://localhost:3000',
  login : '/auth/loginweb',
  me : baseUrl + '/users/admin/me',
  upload: baseUrl+'/uploads/',

  // Users
  getAllUsers: baseUrl+'/users/clients/getAll',

  // Category
  getAllCategory: baseUrl+'/category/getAll',
  editCategory: baseUrl+'/category/edit',
  deleteCategory: baseUrl+'/category/delete/',
  addCategory: baseUrl+'/category/add',
  productsByCategory: baseUrl+'/category/getAllProductsByCategory',
  productsWithoutCategory: baseUrl+'/category/getAllProductsWithoutCategory',
  updateProductCategory: baseUrl+'/category/updateProductCategory',

  // Allergy
  getAllAllergy: baseUrl+'/allergy/getAll',
  editAll: baseUrl+'/allergy/edit',
  addAllergy: baseUrl+'/allergy/addAdmin',
  deleteAllergy: baseUrl+'/allergy/deleteAdmin/',
  getOtherIngredientByAllergy: baseUrl+'/allergy/getOther',
  addIngredientAllergy: baseUrl+'/allergy/addIngredient',
  deleteIngredientAllergy: baseUrl+'/allergy/deleteIngredient',

   // Ingredients
   getAllIngredient: baseUrl+'/ingredients/getAll',
   editIngredient: baseUrl+'/ingredients/edit',
   addIngredient: baseUrl+'/ingredients/add',
   deleteIngredient: baseUrl+'/ingredients/delete/',
  
};
