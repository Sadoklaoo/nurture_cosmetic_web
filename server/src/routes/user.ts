import { Router } from "express";
import AdminController from "../controller/AdminController";

import { checkJwt } from "../middlewares/checkJwt";
import { checkRole } from "../middlewares/checkRole";

const router = Router();

//*************************** ADMIN **********************//

//Get Current  Admin  Details with TOKEN
router.post("/admin/me",[checkJwt, checkRole(["ADMIN"])],AdminController.me );
//Get all admins
router.get("/admins",[checkJwt, checkRole(["ADMIN"])],AdminController.listAll);
//New Admin
router.post("/admins/new", [checkJwt, checkRole(["ADMIN"])],AdminController.newAdmin);
//Edit Admin
router.post("/admins/edit",[checkJwt, checkRole(["ADMIN"])],  AdminController.editAdmin );
//Delete Admin
router.delete("/admins/:id([0-9]+)",[checkJwt, checkRole(["ADMIN"])],AdminController.deleteAdmin);



//*************************** CLIENT **********************//
//delete client
router.delete("/clients/delete/:id([0-9]+)",[checkJwt, checkRole(["ADMIN"])]  );

//get client with ID
router.get("/clients/getwithid",[checkJwt, checkRole(["ADMIN","CLIENT"])]);

//get client with email
router.get("/clients/getwithemail",[checkJwt, checkRole(["ADMIN","CLIENT"])]);

//get all clients
router.get("/clients/getAll",[checkJwt, checkRole(["ADMIN","CLIENT"])] );

//Get Current  Client  Details with TOKEN
router.post("/clients/me",[checkJwt, checkRole(["ADMIN","CLIENT"])] );

//Get Current  Client  history
router.post("/clients/me/history",[checkJwt, checkRole(["ADMIN","CLIENT"])] );

//Get Current  Client  allergies
router.post("/clients/me/allergies",[checkJwt, checkRole(["ADMIN","CLIENT"])] );

//Get Current  Client  skintype
router.post("/clients/me/skintype",[checkJwt, checkRole(["ADMIN","CLIENT"])] );

//Contact us
router.post("/clients/me/contact",[checkJwt, checkRole(["ADMIN","CLIENT"])] );

//update tokenApp for a client
router.post("/clients/me/updateToken",[checkJwt, checkRole(["ADMIN","CLIENT"])] );


export default router;