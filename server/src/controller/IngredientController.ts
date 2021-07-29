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

      if (ingredient){
        ingredient.IngredientName = NewIngredientName;
        ingredient.IngredientType = IngredientType;

        await IngredientRepository.save(ingredient);
        res.status(200).send("Ingredient Updated.");

      }

      
      
      
    } catch (error) {
      res.status(404).send("Not found");
      return;
    }
  };

 


  static delete = async (req: Request, res: Response) => {
    let id = req.params.id;

    const IngredientRepository = getRepository(Ingredient);

    try {
      const ingredient = await IngredientRepository.findOneOrFail({
        where: { id: id },
      });
     
      IngredientRepository.delete(ingredient);
      
    } catch (error) {
      res.status(409).send("Ingredient repo error.");
      return;
    }
    res.status(201).send("Ingredient deleted.");
  };

  

  static getAll = async (req: Request, res: Response) => {
    //Get Ingredeints from database
    const IngredientRepository = getRepository(Ingredient);
    const Ingredients = await IngredientRepository.find();

    

    //Send the ingredeitns object
    res.send(Ingredients);
  };
}
export default IngredientController;
