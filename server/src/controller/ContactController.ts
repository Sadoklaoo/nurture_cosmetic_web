import { Request, Response } from "express";
import { getRepository } from "typeorm";
import { validate } from "class-validator";
import { Category } from "../entities/Category";
import { Product } from "../entities/Product";
import { Contact } from "../entities/Contact";

class ContactController {
  static add = async (req: Request, res: Response) => {
    let { CategoryName, Image } = req.body;
    let category = new Category();
    category.CategoryName = CategoryName;
    category.Image = Image;

    const errors = await validate(category);
    if (errors.length > 0) {
      res.status(400).send(errors);
      return;
    }

    const CategoryRepository = getRepository(Category);

    try {
      await CategoryRepository.save(category);
    } catch (e) {
      res.status(409).send("Category insert error");
      return;
    }
    //If all ok, send 201 response
    res.status(201).send("Category inserted.");
  };

  static delete = async (req: Request, res: Response) => {
    //Get the ID from the url
    const id = req.params.id;
    const categoryRepository = getRepository(Category);
    const productRepository = getRepository(Product);
    let category: Category;
    let products;
    try {
      category = await categoryRepository.findOneOrFail(id);
      products = await productRepository.find({
        where: {
          Category: {
            id: id,
          },
        },
      });

      products.forEach(async (product) => {
        product.Category = null;
        await productRepository.save(product);
      });
    } catch (error) {
      res.status(404).send("category not found.");
      return;
    }
    await categoryRepository.delete(id);
    //After all send a 204 (no content, but accepted) response
    res.status(204).send("category deleted.");
  };

  static editAdmin = async (req: Request, res: Response) => {
    //Get values from the body
    const { id, status } = req.body;

    //Try to find category on database
    const contactRepository = getRepository(Contact);
    let contact;

    try {
      contact = await contactRepository.findOneOrFail(id);
      if (contact.status == "PENDING") {
        contact.status = status;
        contactRepository.save(contact);
        res.status(203).send("contact edited");
      }else{
        res.status(409).send("contact not edited");
      }
    } catch (error) {
      //If not found, send a 404 response
      res.status(404).send("contact not found");
      return;
    }
  };

  static getAll = async (req: Request, res: Response) => {
    //Get contact from database
    const contactRepository = getRepository(Contact);
    const contacts = await contactRepository.find({
      relations: ["Client"],
    });

    //Send the contact object
    res.send(contacts);
  };
  static getAllUser = async (req: Request, res: Response) => {
    const { id } = req.body;
    //Get contact from database
    const contactRepository = getRepository(Contact);
    const contacts = await contactRepository.find({
      where: {
        Client: id,
      },
    });

    //Send the contact object
    res.send(contacts);
  };
}
export default ContactController;
