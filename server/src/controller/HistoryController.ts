import { Request, Response } from "express";
import { getRepository } from "typeorm";
import { validate } from "class-validator";
import { Admin } from "../entities/Admin";
import * as jwt from "jsonwebtoken";
import config from "../config/config";
import { History } from "../entities/History";
import { Product } from "../entities/Product";
import { Client } from "../entities/Client";


 class HistoryController{
  static add = async (req: Request, res: Response) => {
    let { SearchString, ProductId,ClientId } = req.body;
    let history = new History();
    history.SearchString = SearchString;
    const ProductRepository = getRepository(Product);
    const ClientRepository = getRepository(Client);
    const HistoryRepository = getRepository(History);

    let client: Client;
    let product: Product;
    try {
      client = await ClientRepository.findOneOrFail(ClientId);
      history.Client = client;
    } catch (error) {
      res.status(404).send("client not found.");
      return;
    }
    try {
      product = await ProductRepository.findOneOrFail(ClientId);
    //  history = product;
    } catch (error) {
      res.status(404).send("client not found.");
      return;
    }
    //If all ok, send 201 response
    res.status(201).send("Category inserted.");
  };
};
export default HistoryController;