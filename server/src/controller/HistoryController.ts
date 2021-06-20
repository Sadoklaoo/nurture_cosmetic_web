import { Request, Response } from "express";
import { getRepository,Raw } from "typeorm";
import { validate } from "class-validator";
import { Admin } from "../entities/Admin";
import * as jwt from "jsonwebtoken";
import config from "../config/config";
import { History } from "../entities/History";
import { Product } from "../entities/Product";
import { Client } from "../entities/Client";

class HistoryController {
  static add = async (req: Request, res: Response) => {
    let { SearchString, ProductId, clientId } = req.body;

    const ProductRepository = getRepository(Product);
    const ClientRepository = getRepository(Client);
    const HistoryRepository = getRepository(History);
    let exist = false;
    let client: Client;
    let product: Product;
    let history: History;
    let newHistory = new History();
    var minutes=5;
    var currentDate = new Date();
    var previousDate = new Date(currentDate.getTime() - minutes*60000);


    try {
      history = await HistoryRepository.findOne({ where: { 
        SearchString: SearchString ,
        consultedAt: Raw(alias =>`${alias} >= ':date'`, { date: previousDate })
      } 
      });
      if (history) {
        exist = true;
        console.log("History Found");
      }
    } catch (error) {
      res.status(403).send("History repo error.");
      return;
    }

    if (!exist) {
      newHistory.SearchString = SearchString;

      try {
        client = await ClientRepository.findOneOrFail(clientId);
        newHistory.Client = client;
      } catch (error) {
        res.status(404).send("Client not found.");
        return;
      }

      try {
        product = await ProductRepository.findOneOrFail(ProductId);
        //  history = product;
        newHistory.ConsultedProducts.push(product);
      } catch (error) {
        res.status(404).send("Product not found.");
        return;
      }

      try {
        await HistoryRepository.save(newHistory);
      } catch (error) {
        res.status(520).send("Insertion error.");
        return;
      }

      res.status(201).send("New History inserted.");
    }else{

      try {
        product = await ProductRepository.findOneOrFail(ProductId);
        //  history = product;
        history.ConsultedProducts.push(product);
      } catch (error) {
        res.status(404).send("Product not found.");
        return;
      }

      try {
        await HistoryRepository.save(history);
      } catch (error) {
        res.status(520).send("Insertion error.");
        return;
      }

      res.status(201).send("History Product inserted.");

    }

    
  };
}
export default HistoryController;
