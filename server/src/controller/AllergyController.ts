import { Request, Response } from "express";
import { getRepository } from "typeorm";
import { validate } from "class-validator";

import { Client } from "../entities/Client";
import { Allergy } from "../entities/Allergy";

class AllergyController {
  static add = async (req: Request, res: Response) => {
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
        }
      });
    } catch (error) {
      res.status(404).send("Client Doesn't have allergies");
      return;
    }

    if (!found) {
      allergy.AllergyName = AllergyName;
      allergy.client = client;
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
    let { AllergyName } = req.body;

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
      res.status(404).send("Client Doesn't have allergies");
      return;
    }

    if (!found) {
      allergy.AllergyName = AllergyName;
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
  static getMyAllergies = async (req: Request, res: Response) => {};
  
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

  static getAll = async (req: Request, res: Response) => {};
}
export default AllergyController;
