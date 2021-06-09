import { Router } from "express";

import { checkJwt } from "../middlewares/checkJwt";
import { checkRole } from "../middlewares/checkRole";

const router = Router();
//insert allergie
router.post("/add",[checkJwt, checkRole(["ADMIN"])] );

//delete allergie
router.delete("/delete/:id([0-9]+)",[checkJwt, checkRole(["ADMIN"])]  );

//edit allergie
router.post("/edit",[checkJwt, checkRole(["ADMIN"])]  );

//get allergie
router.get("/get",[checkJwt, checkRole(["ADMIN","CLIENT"])]);


//get all allergie
router.get("/getAll",[checkJwt, checkRole(["ADMIN","CLIENT"])] );




export default router;