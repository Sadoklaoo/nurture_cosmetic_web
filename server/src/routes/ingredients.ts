import { Router } from "express";

import { checkJwt } from "../middlewares/checkJwt";
import { checkRole } from "../middlewares/checkRole";
import IngredientController from "../controller/IngredientController";
const router = Router();
//insert ingredient
router.post("/add",[checkJwt, checkRole(["ADMIN"])], IngredientController.add );

//delete ingredient
router.delete("/delete/:id([0-9]+)",[checkJwt, checkRole(["ADMIN"])]  );

//edit ingredient
router.post("/edit",[checkJwt, checkRole(["ADMIN"])]  );

//get ingredient
router.get("/get",[checkJwt, checkRole(["ADMIN","CLIENT"])]);


//get all ingredients
router.get("/getAll",[checkJwt, checkRole(["ADMIN","CLIENT"])] );




export default router;