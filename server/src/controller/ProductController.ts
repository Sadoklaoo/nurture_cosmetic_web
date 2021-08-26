import { Allergy } from "./../entities/Allergy";
import { Request, Response } from "express";
import { getManager, getRepository } from "typeorm";
import { validate } from "class-validator";
import { Admin } from "../entities/Admin";
import * as jwt from "jsonwebtoken";
import config from "../config/config";
import { Product } from "../entities/Product";
import { ProductType } from "../entities/ProductType";
import { IsNull } from "typeorm";
import { Category } from "../entities/Category";
import { Ingredient } from "../entities/Ingredient";
import { Client } from "../entities/Client";

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
    const products = await productRepository.find({
      relations: ["Category", "ProductIngredients"],
    });

    //Send the product object
    res.send(products);
  };

  static listAllFavoris = async (req: Request, res: Response) => {
    const { id } = req.body;

    //Try to find client on database
    const clientRepository = getRepository(Client);
    let client;
    try {
      client = await clientRepository.findOneOrFail(id, {
        relations: ["Favoris", "Favoris.Category"],
      });
    } catch (error) {
      //If not found, send a 404 response
      res.status(404).send("Admin not found");
      return;
    }
    if (
      client.Favoris != undefined &&
      client.Favoris != null &&
      client.Favoris.length != 0
    ) {
      res.send(client.Favoris);
    } else {
      res.status(403).send("No favorite found.");
    }
  };

  static isProductInFavoris = async (req: Request, res: Response) => {
    const { id, idProduct } = req.body;

    //Try to find client on database
    const clientRepository = getRepository(Client);
    let client;
    const productRepository = getRepository(Product);
    let product;
    try {
      client = await clientRepository.findOne(id, {
        relations: ["Favoris", "Favoris.Category"],
      });
    } catch (error) {
      //If not found, send a 404 response
      res.status(404).send("Admin not found");
      return;
    }
    try {
      product = await productRepository.findOne(idProduct);
    } catch (error) {
      //If not found, send a 404 response
      res.status(404).send("Product not found");
      return;
    }

    if (
      client.Favoris != null &&
      client.Favoris != undefined &&
      client.Favoris.length != 0 &&
      product != undefined &&
      product != null
    ) {
      let found = false;
      client.Favoris.forEach((prod) => {
        if (prod.id == product.id) {
          found = true;
        }
      });
      if (found) {
        res.status(200).send("In favorite.");
      } else {
        res.status(403).send("Not In favorite.");
      }
    } else {
      res.status(403).send("Not In favorite.");
    }
  };

  static addProductToFavoris = async (req: Request, res: Response) => {
    const { id, idProduct } = req.body;

    //Try to find client on database
    const clientRepository = getRepository(Client);
    let client;
    const productRepository = getRepository(Product);
    let product;
    try {
      client = await clientRepository.findOne(id, {
        relations: ["Favoris", "Favoris.Category"],
      });
    } catch (error) {
      //If not found, send a 404 response
      res.status(404).send("Admin not found");
      return;
    }
    try {
      product = await productRepository.findOneOrFail(idProduct);
    } catch (error) {
      //If not found, send a 404 response
      res.status(404).send("Product not found");
      return;
    }

    if (
      client.Favoris != null &&
      client.Favoris != undefined &&
      client.Favoris.length != 0
    ) {
      let found = false;
      client.Favoris.forEach((prod) => {
        if (prod.id == product.id) {
          found = true;
        }
      });
      if (found) {
        res.status(205).send("In favorite.");
      } else {
        client.Favoris[client.Favoris.length] = product;
        try {
          await clientRepository.save(client);
          res.status(200).send("Added Successfuly to Favorit");
        } catch (e) {
          res.status(409).send("Favoris Update Error");
          return;
        }
      }
    } else {
      client.Favoris[0] = product;
      try {
        await clientRepository.save(client);
        res.status(200).send("Added New Successfuly to Favorit");
      } catch (e) {
        res.status(409).send("Favoris Update Error");
        return;
      }
    }
  };

  static removeProductFromFavoris = async (req: Request, res: Response) => {
    const { id, idProduct } = req.body;

    //Try to find client on database
    const clientRepository = getRepository(Client);
    let client;
    const productRepository = getRepository(Product);
    let product;
    let ind = -1;
    try {
      client = await clientRepository.findOne(id, {
        relations: ["Favoris", "Favoris.Category"],
      });
    } catch (error) {
      //If not found, send a 404 response
      res.status(404).send("Admin not found");
      return;
    }
    try {
      product = await productRepository.findOneOrFail(idProduct);
    } catch (error) {
      //If not found, send a 404 response
      res.status(404).send("Product not found");
      return;
    }

    if (
      client.Favoris != null &&
      client.Favoris != undefined &&
      client.Favoris.length != 0
    ) {
      let found = false;
      client.Favoris.forEach((prod, index) => {
        if (prod.id == product.id) {
          found = true;
          ind = index;
        }
      });
      if (found) {
        client.Favoris.splice(ind, 1);
        try {
          await clientRepository.save(client);
          res.status(200).send("Removed Successfuly From Favorit");
        } catch (e) {
          res.status(409).send("Favoris Update Error");
          return;
        }
      } else {
        res.status(205).send("Not In favorite.");
      }
    } else {
      res.status(203).send("Favoris already empty");
    }
  };


  static isProductCompatibleToUser = async (req: Request, res: Response) => {
    let { idProduct,idUser } = req.body;
    //Get products from database
    const productRepository = getRepository(Product);
    const userRepository = getRepository(Client);
    let product;
    let user;
    let final_allergies: Allergy[];
    let ingredients;
    try {
      product = await productRepository.findOneOrFail(idProduct,{
        relations:["ProductIngredients","ProductIngredients.Allergies"]
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
      //If not found, send a 404 response
      res.status(404).send("Product not found");
      return;
    }

    try {
      user = await userRepository.findOneOrFail(idUser,{
        relations:["Skin", "Allergies"]
      });
    } catch (error) {
      //If not found, send a 404 response
      res.status(404).send("User not found");
      return;
    }

    if(user.Skin!=null && (user.Skin.SkinType != product.PreferedSkinType || product.PreferedSkinType !="NORMAL")){
      res.status(301).send('Skin Type doesnt match')
    }

    user.Allergies.forEach(userAllergy => {
        final_allergies.forEach(allergy =>{
          if (allergy.AllergyName == userAllergy.AllergyName){
            res.status(302).send('Contains triggering allergies');
          }
        })
    });

    console.log(user.isProductCompatible(product));

    res.status(200).send('Product Compatible');
    



  };

  static listAllProductsByCategoryId = async (req: Request, res: Response) => {
    let { id } = req.body;
    //Get products from database
    const productRepository = getRepository(Product);
    const products = await productRepository.find({
      select: ["id", "ProductName", "Price", "Image", "ProductDescription"],
      relations: ["Category"],
      where: {
        Category: {
          id: id,
        },
      },
    });

    //Send the product object
    res.send(products);
  };

  static listAllProductsByTypeId = async (req: Request, res: Response) => {
    let { typeName } = req.body;
    //Get products from database
    const productRepository = getRepository(Product);
    const manager = getManager();
    /*const result = await manager.query(`SELECT * FROM product AS p 
    LEFT JOIN category AS c ON p.categoryId = c.id 
    LEFT JOIN product_types AS t ON t.productId = p.id
    LEFT JOIN product_type AS ty ON t.productTypeId = ty.id
    WHERE ty.TypeName = "Bio";`);*/

    const result = await productRepository.find({
      join: {
        alias: "product",
        leftJoinAndSelect: {
          Category: "product.Category",
          Type: "product.Type",
        },
      },
      where: (qb) => {
        qb.where("Type.TypeName= :typeName", { typeName: typeName });
      },
    });
    /* const resultat = await manager.getRepository(Product).createQueryBuilder().select();
    ;
    .leftJoin('Product.Category','Category')
    .leftJoin('Product.Type','Type');*/

    //console.log(resultat);

    /*  const products = await productRepository.find({
      select: ["id", "ProductName", "Price", "Image", "ProductDescription"],
      relations: ["Category","Type"],
      where: {
        id:id,
        Type: {
          TypeName: "Bio",
        },
      },
    });*/

    //Send the product object
    res.send(result);
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

  static editProduct = async (req: Request, res: Response) => {
    //Get values from the body
    const {
      id,
      ProductName,
      Reference,
      Category,
      ProductDescription,
      ProductSecondDescription,
      ProductDimensions,
      PreferedSkinType,
      Type,
      Price,
      Image,
    } = req.body;

    //Try to find product on database
    const productRepository = getRepository(Product);
    let product;
    try {
      product = await productRepository.findOneOrFail(id);
    } catch (error) {
      //If not found, send a 404 response
      res.status(404).send("Admin not found");
      return;
    }

    //Validate the new values on model
    product.ProductName = ProductName;
    product.Category = Category;
    product.ProductDescription = ProductDescription;
    product.ProductSecondDescription = ProductSecondDescription;
    product.ProductDimensions = ProductDimensions;
    product.PreferedSkinType = PreferedSkinType;
    product.Type = Type;
    product.Price = Price;
    product.Image = Image;

    const errors = await validate(product);
    if (errors.length > 0) {
      res.status(400).send(errors);
      return;
    }
    //Try to safe, if fails, that means phoneNumber already in use
    try {
      await productRepository.save(product);
    } catch (e) {
      res.status(409).send("Error in update");
      return;
    }
    //After all send a 204 (no content, but accepted) response
    res.status(204).send();
  };

  static getOtherIngredients = async (req: Request, res: Response) => {
    let { id } = req.body;
    //Get Product from database
    const ProductRepository = getRepository(Product);
    const product = await ProductRepository.findOneOrFail({
      where: { id: id },
      relations: ["ProductIngredients"],
    });

    const IngredientRepository = getRepository(Ingredient);
    let ingredients;
    let finalList: Array<String> = [];
    product.ProductIngredients.forEach((ingredient) => {
      finalList.push(ingredient.IngredientName);
    });
    console.log(finalList);

    if (finalList.length > 0) {
      ingredients = await IngredientRepository.createQueryBuilder("ingredient")
        .where("ingredient.IngredientName NOT IN (:...list)", {
          list: finalList,
        })
        .getMany();
    } else {
      ingredients = await IngredientRepository.find();
    }

    //Send the ingredients object
    res.send(ingredients);
  };

  static addIngredients = async (req: Request, res: Response) => {
    let { id, IngredientId } = req.body;

    const ProductRepository = getRepository(Product);
    const IngredientRepository = getRepository(Ingredient);
    try {
      const product = await ProductRepository.findOneOrFail({
        where: { id: id },
        relations: ["ProductIngredients"],
      });
      const ingredient = await IngredientRepository.findOneOrFail({
        where: { id: IngredientId },
      });
      product.ProductIngredients.push(ingredient);
      await ProductRepository.save(product);

      res.status(200).send("ProductIngredients Updated.");
    } catch (error) {
      res.status(404).send("Error ProductIngredients");
      return;
    }
  };

  static deleteIngredients = async (req: Request, res: Response) => {
    let { id, IngredientId } = req.body;

    const ProductRepository = getRepository(Product);
    const IngredientRepository = getRepository(Ingredient);
    try {
      const product = await ProductRepository.findOneOrFail({
        where: { id: id },
        relations: ["ProductIngredients"],
      });
      const ingredient = await IngredientRepository.findOneOrFail({
        where: { id: IngredientId },
      });
      let index = 0;

      product.ProductIngredients.forEach((item, i) => {
        if (item.id == ingredient.id) {
          index = i;
        }
      });

      product.ProductIngredients.splice(index, 1);
      console.log(product.ProductIngredients);
      await ProductRepository.save(product);

      res.status(200).send("ProductIngredients Updated.");
    } catch (error) {
      res.status(404).send("Error ProductIngredients");
      return;
    }
  };
}
export default ProductController;
