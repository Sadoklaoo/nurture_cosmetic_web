import { Allergy } from "./../entities/Allergy";
import { Request, Response } from "express";
import { getRepository } from "typeorm";
import { validate } from "class-validator";
import { Admin } from "../entities/Admin";
import * as jwt from "jsonwebtoken";
import config from "../config/config";
import { Product } from "../entities/Product";
import { ProductType } from "../entities/ProductType";
import { IsNull } from "typeorm";
import { Category } from "../entities/Category";
import { Ingredient } from "../entities/Ingredient";
class ProductController {
  static newProduct = async (req: Request, res: Response) => {
    //Get parameters from the body
    let {
      ProductName,
      Reference,
      Price,
      Category,
      ProductDescription,
      ProductSecondDescription,
      ProductDimensions,
      PreferedSkinType,
      Image,
      Type,
    } = req.body;
    let product = new Product();
    product.ProductName = ProductName;
    product.Reference = Reference;
    product.Price = Price;
    product.Category = Category;
    product.Rank = 10;
    product.Image = Image;
    product.ProductDescription = ProductDescription;
    product.PreferedSkinType = PreferedSkinType;
    product.ProductSecondDescription = ProductSecondDescription;
    product.ProductDimensions = ProductDimensions;
    product.Type = Type;

    //Validade if the parameters are ok
    const errors = await validate(product);
    if (errors.length > 0) {
      res.status(400).send(errors);
      return;
    }

    //Try to save. If fails, the phoneNumber is already in use
    const productRepository = getRepository(Product);
    try {
      await productRepository.save(product);
    } catch (e) {
      res.status(409).send("Insert Error");
      return;
    }
    //If all ok, send 201 response
    res.status(201).send("Product created");
  };

  static setProductCategory = async (req: Request, res: Response) => {
    let { idProduct, idCategory } = req.body;
    //Get products from database
    const productRepository = getRepository(Product);
    const categoryRepository = getRepository(Category);
    let product;
    let category;
    try {
      product = await productRepository.findOneOrFail(idProduct, {
        relations: ["Category"],
      });
    } catch (error) {
      res.status(404).send("Product not found");
      return;
    }

    if (idCategory === null) {
      console.log("null Id");
      product.Category = null;
    } else {
      try {
        category = await categoryRepository.findOneOrFail(idCategory);
      } catch (error) {
        res.status(404).send("Category not found");
        return;
      }
      product.Category = category;
    }

    try {
      await productRepository.save(product);
    } catch (e) {
      res.status(409).send("Product Update Error");
      return;
    }
    //Send the product object
    res.send(product);
  };

  static listAllProducts = async (req: Request, res: Response) => {
    //Get products from database
    const productRepository = getRepository(Product);
    const products = await productRepository.find({ relations: ["Category"] });

    //Send the product object
    res.send(products);
  };

  static listAllProductsByCategoryId = async (req: Request, res: Response) => {
    let { id } = req.body;
    //Get products from database
    const productRepository = getRepository(Product);
    const products = await productRepository.find({
      where: {
        Category: {
          id: id,
        },
      },
    });

    //Send the product object
    res.send(products);
  };

  static listAllProductsWithoutCategory = async (
    req: Request,
    res: Response
  ) => {
    //Get products from database
    const productRepository = getRepository(Product);
    const products = await productRepository.find({
      where: {
        Category: {
          id: IsNull(),
        },
      },
    });

    //Send the product object
    res.send(products);
  };

  static listAllProductType = async (req: Request, res: Response) => {
    //Get product types from database
    const productRepository = getRepository(ProductType);
    const products = await productRepository.find({});

    //Send the product object
    res.send(products);
  };

  static productDetail = async (req: Request, res: Response) => {
    const id = req.params.id;
    let products;
    //Get products from database
    const productRepository = getRepository(Product);
    try {
      products = await productRepository.findOneOrFail(id, {
        relations: ["ProductIngredients", "Type", "Category"],
      });
    } catch (error) {
      res.status(404).send("Product not found");
      return;
    }

    //Send the product object
    res.send(products);
  };
  static productAllergies = async (req: Request, res: Response) => {
    const id = req.params.id;
    let product;
    let ingredients;

    let final_allergies: Allergy[];
    //Get products from database
    const productRepository = getRepository(Product);
    const ingredientRepository = getRepository(Ingredient);
    try {
      product = await productRepository.findOneOrFail(id, {
        relations: ["ProductIngredients", "ProductIngredients.Allergies"],
      });

      final_allergies = [];
      ingredients = product.ProductIngredients;
      ingredients.forEach((ingr) => {
        ingr.Allergies.forEach((allergy) => {
          if (final_allergies.indexOf(allergy) == -1) {
            final_allergies.push(allergy);
          }
        });
      });

      final_allergies = Object.values(
        final_allergies.reduce(
          (acc, cur) => Object.assign(acc, { [cur.id]: cur }),
          {}
        )
      );
    } catch (error) {
      res.status(404).send("Product not found");
      return;
    }

    //Send the product object
    res.send(final_allergies);
  };

  static deleteProduct = async (req: Request, res: Response) => {
    //Get the ID from the url
    const id = req.params.id;
    const productRepository = getRepository(Product);
    let product: Product;
    try {
      product = await productRepository.findOneOrFail(id);
    } catch (error) {
      res.status(404).send("product not found");
      return;
    }
    productRepository.delete(id);
    //After all send a 204 (no content, but accepted) response
    res.status(204).send();
  };

  /* static getOneById = async (req: Request, res: Response) => {
  //Get the ID from the url
  const id =  req.params.id;

  //Get the user from database
  const adminRepository = getRepository(Admin);
  try {
    const user = await adminRepository.findOneOrFail(id, {
      select: ["id", "username", "role"] //We dont want to send the password on response
    });
  } catch (error) {
    res.status(404).send("User not found");
  }
}; 
 */
  static editAdmin = async (req: Request, res: Response) => {
    //Get values from the body
    const { id, firstName, lastName, phoneNumber, email, address } = req.body;

    //Try to find admin on database
    const adminRepository = getRepository(Admin);
    let admin;
    try {
      admin = await adminRepository.findOneOrFail(id);
    } catch (error) {
      //If not found, send a 404 response
      res.status(404).send("Admin not found");
      return;
    }

    //Validate the new values on model
    admin.firstName = firstName;
    admin.lastName = lastName;
    admin.email = email;
    admin.address = address;
    admin.phoneNumber = phoneNumber;

    const errors = await validate(admin);
    if (errors.length > 0) {
      res.status(400).send(errors);
      return;
    }
    //Try to safe, if fails, that means phoneNumber already in use
    try {
      await adminRepository.save(admin);
    } catch (e) {
      res.status(409).send("phoneNumber already in use");
      return;
    }
    //After all send a 204 (no content, but accepted) response
    res.status(204).send();
  };

  static getOneByPhoneNumber = async (req: Request, res: Response) => {
    //Get the phoneNumber from request body
    let { phoneNumber } = req.body;
    //Get the admin from database
    const adminRepository = getRepository(Admin);
    try {
      // const user = await  adminRepository.findOneOrFail({ phoneNumber });
      const admin = await adminRepository.findOneOrFail(phoneNumber, {
        select: ["phoneNumber", "id", "role"], //We dont want to send the password on response
      });
      res.send(admin);
    } catch (error) {
      res.status(404).send("Admin not found");
    }
  };

  static deleteAdmin = async (req: Request, res: Response) => {
    //Get the ID from the url
    const id = req.params.id;
    const adminRepository = getRepository(Admin);
    let admin: Admin;
    try {
      admin = await adminRepository.findOneOrFail(id);
    } catch (error) {
      res.status(404).send("Admin not found");
      return;
    }
    adminRepository.delete(id);
    //After all send a 204 (no content, but accepted) response
    res.status(204).send();
  };

  static me = async (req: Request, res: Response) => {
    //Get the phoneNumber from request body
    const token = <string>req.headers["auth"];
    let jwtPayload;
    try {
      jwtPayload = <any>jwt.verify(token, config.jwtSecret);
      res.locals.jwtPayload = jwtPayload;
    } catch (error) {
      //If token is not valid, respond with 401 (unauthorized)
      res.status(401).send();
      return;
    }

    const { userId } = jwtPayload;
    //Get the admin from database
    const adminRepository = getRepository(Admin);
    try {
      const admin = await adminRepository.findOneOrFail({
        where: { id: userId },
      });
      res.send(admin);
    } catch (error) {
      res.status(404).send("admin not found");
    }
  };
}
export default ProductController;
