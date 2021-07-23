import { Router } from "express";
import CategoryController from "../controller/CategoryController";
import ProductController from "../controller/ProductController";

import { checkJwt } from "../middlewares/checkJwt";
import { checkRole } from "../middlewares/checkRole";

const router = Router();
//insert categorie
router.post("/add",[checkJwt, checkRole(["ADMIN"])] ,CategoryController.add);

//delete categorie
router.delete("/delete/:id([0-9]+)",[checkJwt, checkRole(["ADMIN"])]  , CategoryController.delete);

//edit categorie
router.post("/edit",[checkJwt, checkRole(["ADMIN"])],CategoryController.edit  );

//get all categories
router.get("/getAll",[checkJwt, checkRole(["ADMIN","CLIENT"])],CategoryController.getAll  );


//get all product by category
router.post("/getAllProductsByCategory",[checkJwt, checkRole(["ADMIN","CLIENT"])],ProductController.listAllProductsByCategoryId  );
//get all product without category
router.get("/getAllProductsWithoutCategory",[checkJwt, checkRole(["ADMIN"])],ProductController.listAllProductsWithoutCategory  );
//update product category
router.post("/updateProductCategory",[checkJwt, checkRole(["ADMIN"])],ProductController.setProductCategory  );



export default router;