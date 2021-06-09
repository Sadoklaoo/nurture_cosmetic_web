import { Router } from "express";

import { checkJwt } from "../middlewares/checkJwt";
import { checkRole } from "../middlewares/checkRole";

const router = Router();
//insert ingredient
router.post("/add",[checkJwt, checkRole(["ADMIN","CLIENT"])] );

//delete ingredient
router.delete("/delete/:id([0-9]+)",[checkJwt, checkRole(["ADMIN","CLIENT"])]  );

//edit ingredient
router.post("/edit",[checkJwt, checkRole(["ADMIN","CLIENT"])]  );

//get ingredient
router.get("/get",[checkJwt, checkRole(["ADMIN","CLIENT"])]);


//get all ingredients
router.get("/getAll",[checkJwt, checkRole(["ADMIN"])] );




export default router;