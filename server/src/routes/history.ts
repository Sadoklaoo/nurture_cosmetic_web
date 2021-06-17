import { Router } from "express";
import HistoryController from "../controller/HistoryController";

import { checkJwt } from "../middlewares/checkJwt";
import { checkRole } from "../middlewares/checkRole";

const router = Router();
//insert categorie
router.post("/add",[checkJwt, checkRole(["CLIENT"])], HistoryController.add );

//delete categorie
router.delete("/delete/:id([0-9]+)",[checkJwt, checkRole(["ADMIN"])]  );

//edit categorie
router.post("/edit",[checkJwt, checkRole(["ADMIN"])]  );

//get categorie
router.get("/get",[checkJwt, checkRole(["ADMIN","CLIENT"])]);


//get all categories
router.get("/getAll",[checkJwt, checkRole(["ADMIN","CLIENT"])] );




export default router;