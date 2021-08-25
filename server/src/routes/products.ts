import { Router } from "express";
import ProductController from "../controller/ProductController";

import { checkJwt } from "../middlewares/checkJwt";
import { checkRole } from "../middlewares/checkRole";

const router = Router();
//insert product
router.post("/add",[checkJwt, checkRole(["ADMIN"])], ProductController.newProduct );

//delete product
router.delete("/delete/:id([0-9]+)",[checkJwt, checkRole(["ADMIN"])], ProductController.deleteProduct);

//edit product
router.post("/edit",[checkJwt, checkRole(["ADMIN"])], ProductController.editProduct );


//get all products
router.get("/getAll",[checkJwt, checkRole(["ADMIN","CLIENT"])], ProductController.listAllProducts );

//get all favoris
router.post("/getAllFavoris",[checkJwt, checkRole(["CLIENT"])], ProductController.listAllFavoris );

//is In favoris
router.post("/isFavoris",[checkJwt, checkRole(["CLIENT"])], ProductController.isProductInFavoris );

//add to favoris
router.post("/addToFavoris",[checkJwt, checkRole(["CLIENT"])], ProductController.addProductToFavoris );

//remove from favoris
router.post("/removeFromFavoris",[checkJwt, checkRole(["CLIENT"])], ProductController.removeProductFromFavoris );

//get all products
router.get("/getAllTypes",[checkJwt, checkRole(["ADMIN","CLIENT"])], ProductController.listAllProductType );

//get all product by category
router.post("/getAllProductsByType",[checkJwt, checkRole(["ADMIN","CLIENT"])],ProductController.listAllProductsByTypeId  );

//get product
router.get("/getProductDetail/:id([0-9]+)",[checkJwt, checkRole(["ADMIN","CLIENT"])], ProductController.productDetail );

//get product allergies
router.get("/getProductAllergy/:id([0-9]+)",[checkJwt, checkRole(["ADMIN","CLIENT"])], ProductController.productAllergies );

//get other Ingr Product
router.post("/getOther",[checkJwt, checkRole(["ADMIN"])],ProductController.getOtherIngredients );

//Add Ingr Product
router.post("/addIngredient",[checkJwt, checkRole(["ADMIN"])],ProductController.addIngredients );

//Remove Ingr Product
router.post("/deleteIngredient",[checkJwt, checkRole(["ADMIN"])],ProductController.deleteIngredients );

export default router;