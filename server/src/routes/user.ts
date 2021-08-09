import { Router } from "express";
import AdminController from "../controller/AdminController";
import AllergyController from "../controller/AllergyController";
import ContactController from "../controller/ContactController";
import HistoryController from "../controller/HistoryController";
import SkinController from "../controller/SkinController";
import UserController from "../controller/UserController";

import { checkJwt } from "../middlewares/checkJwt";
import { checkRole } from "../middlewares/checkRole";

const router = Router();

//*************************** ADMIN **********************//

//Get Current  Admin  Details with TOKEN
router.get("/admin/me",[checkJwt, checkRole(["ADMIN"])],AdminController.me );
//Get all admins
router.get("/admins",[checkJwt, checkRole(["ADMIN"])],AdminController.listAll);
//New Admin
router.post("/admins/new", [checkJwt, checkRole(["ADMIN"])],AdminController.newAdmin);
//Edit Admin
router.post("/admins/edit",[checkJwt, checkRole(["ADMIN"])],  AdminController.editAdmin );
//Delete Admin
router.delete("/admins/:id([0-9]+)",[checkJwt, checkRole(["ADMIN"])],AdminController.deleteAdmin);
//get All Contact
router.get("/admin/contact",[checkJwt, checkRole(["ADMIN"])],ContactController.getAll);
//get update Contact
router.post("/admin/contact/update",[checkJwt, checkRole(["ADMIN"])],ContactController.editAdmin);

//*************************** CLIENT **********************//
//delete client
router.delete("/clients/delete/:id([0-9]+)",[checkJwt, checkRole(["ADMIN"])],UserController.deleteuser  );

//get client with ID
router.get("/clients/getwithid/:id([0-9]+)",[checkJwt, checkRole(["ADMIN","CLIENT"])],UserController.getOneById);

//get client with email
router.get("/clients/getwithemail",[checkJwt, checkRole(["ADMIN","CLIENT"])],UserController.getOneByEmail);

//get all clients
router.get("/clients/getAll",[checkJwt, checkRole(["ADMIN"])],UserController.listAll );

//Get Current  Client  Details with TOKEN
router.get("/me",[checkJwt, checkRole(["CLIENT"])],UserController.me );

//Get Current  Client  history
router.get("/me/history",[checkJwt, checkRole(["CLIENT"])], HistoryController.getAll);

//Get Current  Client  allergies
router.get("/me/allergies",[checkJwt, checkRole(["CLIENT"])], AllergyController.getMyAllergies );

//Get Current  Client  skintype
router.get("/me/skintype",[checkJwt, checkRole(["CLIENT"])], SkinController.getmyAll  );

//Contact us
router.post("/me/contact",[checkJwt, checkRole(["CLIENT"])],UserController.clientContact  );

//get All Contact
router.get("/me/myContact",[checkJwt, checkRole(["CLIENT"])],ContactController.getAllUser);

//update tokenApp for a client
router.post("/me/updateToken",[checkJwt, checkRole(["CLIENT"])], UserController.updateClientTokenApp );

//update client Data
router.put("/clients/edit",[checkJwt, checkRole(["ADMIN","CLIENT"])], UserController.editClient );


export default router;