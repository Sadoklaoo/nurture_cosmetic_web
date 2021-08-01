
import { Request, Response } from "express";
import { getRepository, In, Not } from "typeorm";
import { validate } from "class-validator";

import { Client } from "../entities/Client";
import { Allergy } from "../entities/Allergy";
import { isNullOrUndefined, print } from "util";
import { Ingredient } from "../entities/Ingredient";

class AllergyController {
  static add = async (req: Request, res: Response) => {
    let { AllergyName, clientId, Image } = req.body;

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
        }
      });
    } catch (error) {
      res.status(404).send("Client Doesn't have allergies");
      return;
    }

    if (!found) {
      allergy.AllergyName = AllergyName;
      allergy.client = client;
      allergy.Image = Image;
      const errors = await validate(allergy);
      if (errors.length > 0) {
        res.status(400).send(errors);
        return;
      }

      try {
        await AllergyRepository.save(allergy);
      } catch (e) {
        res.status(409).send("Allergy insert error");
        return;
      }
      //If all ok, send 201 response
      res.status(201).send("Allergy inserted.");
    } else {
      res.status(410).send("Allergy Found");
    }
  };

  static addAdmin = async (req: Request, res: Response) => {
    let { AllergyName, Image } = req.body;

    const AllergyRepository = getRepository(Allergy);

    let allergy = new Allergy();
    var found = false;

    try {
      const allallergies = await AllergyRepository.find({
        where: { client: null },
      });
      allallergies.forEach(async (element) => {
        if (element.AllergyName === AllergyName) {
          found = true;
        }
      });
    } catch (error) {
      res.status(403).send("Error Allergy Search");
      return;
    }

    if (!found) {
      allergy.AllergyName = AllergyName;
      allergy.Image = Image;
      const errors = await validate(allergy);
      if (errors.length > 0) {
        res.status(400).send(errors);
        return;
      }

      try {
        await AllergyRepository.save(allergy);
      } catch (e) {
        res.status(409).send("Allergy insert error");
        return;
      }
      //If all ok, send 201 response
      res.status(201).send("Allergy inserted.");
    } else {
      res.status(410).send("Allergy Found");
    }
  };

  static editAdmin = async (req: Request, res: Response) => {
    let { AllergyName, NewAllergyName } = req.body;

    const AllergyRepository = getRepository(Allergy);

    try {
      const allallergies = await AllergyRepository.find({
        where: { AllergyName: AllergyName },
      });
      allallergies.forEach(async (element) => {
        element.AllergyName = NewAllergyName;
        await AllergyRepository.save(element);
      });
      res.status(200).send("Allergy Updated.");
    } catch (error) {
      res.status(404).send("Client Doesn't have allergies");
      return;
    }
  };

  static getMyAllergies = async (req: Request, res: Response) => {
    let { clientId } = req.body;

    const AllergyRepository = getRepository(Allergy);
    const ClientRepository = getRepository(Client);
    let myallergies;
    let client: Client;
    try {
      client = await ClientRepository.findOneOrFail({
        where: { id: clientId },
      });
    } catch (error) {
      res.status(404).send("Client not found");
      return;
    }

    try {
      myallergies = await AllergyRepository.find({
        where: { client: clientId },
      });
    } catch (error) {
      res.status(404).send("Allergie repo error.");
      return;
    }
    if (myallergies) {
      res.send(myallergies);
    } else {
      res.status(404).send("No allergies.");
    }
  };

  static delete = async (req: Request, res: Response) => {
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
    let  id  = req.params.id;

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
    const AllergyRepository = getRepository(Allergy);
    const allergies = await AllergyRepository.find({ relations: ["client","IngredientTriggering"] });

    let adminallergies: Array<Allergy> = [];

    allergies.forEach((element) => {
      if (element.client == null) {
        adminallergies.push(element);
      }
    });

    //Send the allergies object
    res.send(adminallergies);
  };


  static getOtherIngredients = async (req: Request, res: Response) => {
    let { id } = req.body;
    //Get allergies from database
    const AllergyRepository = getRepository(Allergy);
    const allergy = await AllergyRepository.findOneOrFail({where:{ id: id }, relations: ["IngredientTriggering"] });

    const IngredientRepository = getRepository(Ingredient);
    let ingredients;
    let finalList:Array<String> = [];
    allergy.IngredientTriggering.forEach((ingredient)=>{
      finalList.push(ingredient.IngredientName);
    })
    console.log(finalList);

  if (finalList.length>0){
     ingredients = await IngredientRepository.createQueryBuilder("ingredient")
    .where("ingredient.IngredientName NOT IN (:...list)",{list : finalList}).getMany();
  }else{
     ingredients = await IngredientRepository.find();
  }
  
    //Send the allergies object
    res.send(ingredients);
  };

  static addIngredients = async (req: Request, res: Response) => {
    let { id, IngredientId } = req.body;

    const AllergyRepository = getRepository(Allergy);
    const IngredientRepository = getRepository(Ingredient);
    try {
      const allergy = await AllergyRepository.findOneOrFail({where:{ id: id }, relations: ["IngredientTriggering"] });
      const ingredient = await IngredientRepository.findOneOrFail({where:{ id: IngredientId }});
      allergy.IngredientTriggering.push(ingredient);
      await AllergyRepository.save(allergy);

      res.status(200).send("IngredientTriggering Updated.");
    } catch (error) {
      res.status(404).send("Error IngredientTriggering");
      return;
    }
  };

  static deleteIngredients = async (req: Request, res: Response) => {
    let { id, IngredientId } = req.body;

    const AllergyRepository = getRepository(Allergy);
    const IngredientRepository = getRepository(Ingredient);
    try {
      const allergy = await AllergyRepository.findOneOrFail({where:{ id: id }, relations: ["IngredientTriggering"] });
      const ingredient = await IngredientRepository.findOneOrFail({where:{ id: IngredientId }});
      let index = 0;
      


      allergy.IngredientTriggering.forEach((item,i)=>{
        if (item.id == ingredient.id){
          index = i;
        }
      })
    
      allergy.IngredientTriggering.splice(index,1);
      console.log(allergy.IngredientTriggering);
      await AllergyRepository.save(allergy);

      res.status(200).send("IngredientTriggering Updated.");
    } catch (error) {
      res.status(404).send("Error IngredientTriggering");
      return;
    }
  };
}
export default AllergyController;
