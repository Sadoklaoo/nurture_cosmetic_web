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
router.post("/edit",[checkJwt, checkRole(["ADMIN"])] );


//get all products
router.get("/getAll",[checkJwt, checkRole(["ADMIN","CLIENT"])], ProductController.listAllProducts );

//get all products
router.get("/getAllTypes",[checkJwt, checkRole(["ADMIN","CLIENT"])], ProductController.listAllProductType );

//get product
router.get("/getProductDetail/:id([0-9]+)",[checkJwt, checkRole(["ADMIN","CLIENT"])], ProductController.productDetail );




export default router;