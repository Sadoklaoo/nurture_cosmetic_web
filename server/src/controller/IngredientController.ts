import { Request, Response } from "express";
import { getRepository } from "typeorm";
import { validate } from "class-validator";

import { isNullOrUndefined } from "util";
import { Ingredient } from "../entities/Ingredient";

class IngredientController {
  static add = async (req: Request, res: Response) => {
    let { IngredientName, IngredientType } = req.body;

    const IngredientRepository = getRepository(Ingredient);
    let ingredient = new Ingredient();
    try {
      ingredient = await IngredientRepository.findOne({
        where: { IngredientName: IngredientName },
      });
    } catch (error) {
      res.status(404).send("Ingredient Error");
      return;
    }

    if (!ingredient) {
      ingredient = new Ingredient();
      ingredient.IngredientName = IngredientName;
      ingredient.IngredientType = IngredientType;

      const errors = await validate(ingredient);
      if (errors.length > 0) {
        res.status(400).send(errors);
        return;
      }

      try {
        await IngredientRepository.save(ingredient);
      } catch (e) {
        res.status(409).send("Ingredient insert error");
        return;
      }
      //If all ok, send 201 response
      res.status(201).send("Ingredient inserted.");
    } else {
      res.status(410).send("Ingredient Found");
    }
  };

  static edit = async (req: Request, res: Response) => {
    let { IngredientName, NewIngredientName,IngredientType } = req.body;

    const IngredientRepository = getRepository(Ingredient);
    let ingredient = new Ingredient();
    try {
      ingredient = await IngredientRepository.findOneOrFail({
        where: { IngredientName: IngredientName },
      });

      ingredient.IngredientName = NewIngredientName;
      ingredient.IngredientType = IngredientType;
      
      res.status(200).send("Ingredient Updated.");
    } catch (error) {
      res.status(404).send("Not found");
      return;
    }
  };

 

  /*static delete = async (req: Request, res: Response) => {
    let { AllergyName, clientId } = req.body;

    const AllergyRepository = getRepository(Allergy);
    const ClientRepository = getRepository(Client);

    let client: Client;
    let allergy = new Allergy();
    var found = false;

    try {
      client = await ClientRepository.findOneOrFail({
        where: { id: clientId },
      });
    } catch (error) {
      res.status(404).send("Client not found");
      return;
    }

    try {
      const myallergies = await AllergyRepository.find({
        where: { client: clientId },
      });
      myallergies.forEach(async (element) => {
        if (element.AllergyName === AllergyName) {
          found = true;
          allergy = element;
        }
      });
    } catch (error) {
      res.status(404).send("Allergie repo error.");
      return;
    }

    if (found) {
      try {
        AllergyRepository.delete(allergy);
      } catch (e) {
        res.status(409).send("Allergy delete error");
        return;
      }
      //If all ok, send 201 response
      res.status(201).send("Allergy deleted.");
    } else {
      res.status(410).send("Allergy Not Found");
    }
  };

  static deleteAdmin = async (req: Request, res: Response) => {
    let id = req.params.id;

    const AllergyRepository = getRepository(Allergy);

    try {
      const allergy = await AllergyRepository.findOneOrFail({
        where: { id: id },
      });
      const myallergies = await AllergyRepository.find({
        where: { AllergyName: allergy.AllergyName },
      });
      myallergies.forEach(async (element) => {
        AllergyRepository.delete(element);
      });
    } catch (error) {
      res.status(409).send("Allergie repo error.");
      return;
    }
    res.status(201).send("Allergies deleted.");
  };

  static getAll = async (req: Request, res: Response) => {
    //Get allergies from database
    const AllergyRepository = getRepository(Ing);
    const allergies = await AllergyRepository.find({ relations: ["client"] });

    let adminallergies: Array<Allergy> = [];

    allergies.forEach((element) => {
      if (element.client == null) {
        adminallergies.push(element);
      }
    });

    //Send the allergies object
    res.send(adminallergies);
  };*/
}
export default IngredientController;
