import { Allergy } from "./../entities/Allergy";
import { Request, Response } from "express";
import { Between, getManager, getRepository, Like } from "typeorm";
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
import { History } from "../entities/History";

class ProductController {
  static MostFrequentProduct(array) {
    if (array.length == 0) return null;
    var modeMap = {};
    var maxEl = array[0],
      maxCount = 1;
    for (var i = 0; i < array.length; i++) {
      var el = array[i];
      if (modeMap[el] == null) modeMap[el] = 1;
      else modeMap[el]++;
      if (modeMap[el] > maxCount) {
        maxEl = el;
        maxCount = modeMap[el];
      }
    }
    return maxEl;
  }
  static newProduct = async (req: Request, res: Response) => {
    //Get parameters from the body
    let {
      ProductName,
      Reference,
      Price,
      Categories,
      ProductShortDescription,
      usingAdvice,
      SkinTypes,
      Image,
      Type,
      isShown,
    } = req.body;
    let product = new Product();
    product.ProductName = ProductName;
    product.Reference = Reference;
    product.Price = Price;
    product.Categories = Categories;
    product.Rank = 10;
    product.Image = Image;
    product.ProductShortDescription = ProductShortDescription;
    product.SkinTypes = SkinTypes;
    product.usingAdvice = usingAdvice;
    product.isShown = isShown;
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
      relations: ["Categories", "ProductIngredients", "SkinTypes", "Type"],
    });

    //Send the product object
    res.send(products);
  };
  static listAllProductsUser = async (req: Request, res: Response) => {
    //Get products from database
    const productRepository = getRepository(Product);
    const products = await productRepository.find({
      relations: ["Categories", "ProductIngredients", "SkinTypes", "Type"],
      where: {
        isShown: true,
      },
    });

    //Send the product object
    res.send(products);
  };

  static listAllProductsUserByKey = async (req: Request, res: Response) => {
    let { key } = req.body;
    //Get products from database
    const productRepository = getRepository(Product);
    const products = await productRepository.find({
      relations: ["Categories", "SkinTypes", "Type"],
      where: [
        {
          isShown: true,
          ProductName: Like(`%${key}%`),
        },
        {
          isShown: true,
          ProductShortDescription: Like(`%${key}%`),
        },
        {
          isShown: true,
          usingAdvice: Like(`%${key}%`),
        },
      ],
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
        relations: ["Favoris", "Favoris.Categories"],
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
        relations: ["Favoris", "Favoris.Categories"],
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
        relations: ["Favoris", "Favoris.Categories"],
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
        relations: ["Favoris", "Favoris.Categories"],
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
    let { idProduct, idUser } = req.body;
    //Get products from database
    const productRepository = getRepository(Product);
    const userRepository = getRepository(Client);
    let product;
    let user;
    let final_allergies: Allergy[];
    let ingredients;
    try {
      product = await productRepository.findOneOrFail(idProduct, {
        relations: [
          "ProductIngredients",
          "ProductIngredients.Allergies",
          "SkinTypes",
        ],
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
      user = await userRepository.findOneOrFail(idUser, {
        relations: ["Skin", "Allergies"],
      });
    } catch (error) {
      //If not found, send a 404 response
      res.status(404).send("User not found");
      return;
    }
    console.log(user.isProductCompatible(product));
    var status = 200;
    if (user.isProductCompatible(product) == true) {
      status = 200;
    } else {
      status = 400;
    }

    res.sendStatus(status);
  };

  static listAllProductsByCategoryId = async (req: Request, res: Response) => {
    let { id } = req.body;
    //Get products from database
    const productRepository = getRepository(Product);
    const categoryRepository = getRepository(Category);
    let final = [];
    const category = await categoryRepository.findOne(id);
    const products = await productRepository.find({
      select: [
        "id",
        "ProductName",
        "Price",
        "Image",
        "ProductShortDescription",
      ],
      relations: ["Categories"],
    });
    products.forEach((product) => {
      product.Categories.forEach((cat) => {
        if (cat.id == category.id) {
          final.push(product);
        }
      });
    });

    //Send the product object
    res.send(final);
  };

  static getLatestProduct = async (req: Request, res: Response) => {
    //Get products from database
    const productRepository = getRepository(Product);
    const products = await productRepository.findOne({
      select: [
        "id",
        "ProductName",
        "Price",
        "Image",
        "ProductShortDescription",
        "createdAt",
      ],
      relations: ["Categories","Type"],
      order: {
        createdAt: "DESC",
      },
    });

    //Send the product object
    res.send(products);
  };

  static getPopularProduct = async (req: Request, res: Response) => {
    //Get products from database
    const productRepository = getRepository(Product);
    const historyRepository = getRepository(History);

    const histories = await historyRepository.find({
      relations: ["ConsultedProduct"],
    });

    const products = histories.map((history) => {
      return history.ConsultedProduct.id;
    });

    var id = ProductController.MostFrequentProduct(products);

    const product = await productRepository.findOne({
      select: [
        "id",
        "ProductName",
        "Price",
        "Image",
        "ProductShortDescription",
      ],
      relations: ["Categories","Type"],
      where: {
        id: id,
      },
    });

    /* const product = await productRepository.createQueryBuilder("product")
    .innerJoinAndSelect("product.Category","category")
    .innerJoinAndSelect("product.History","history")
    .getMany();*/

    //Send the product object
    res.send(product);
  };

  static filterAllProductsUser = async (req: Request, res: Response) => {
    const { minPrice, maxPrice, isNormal, category, productType } = req.body;
    const productRepository = getRepository(Product);
    var result;
    //Get products from database

    if (category != null && productType != null) {
      result = await productRepository.find({
        join: {
          alias: "product",
          leftJoinAndSelect: {
            Categories: "product.Categories",
            Type: "product.Type",
          },
        },
        order: {
          id: isNormal,
        },
        where: (qb) => {
          qb.where("product.isShown=1")
            .andWhere("product.price BETWEEN :begin AND :end", {
              begin: minPrice,
              end: maxPrice,
            })
            .andWhere("Categories.categoryName= :categoryName", {
              categoryName: category,
            })
            .andWhere("Type.TypeName IN (:types)", { types: productType });
        },
      });
    } else if (category != null) {
      result = await productRepository.find({
        join: {
          alias: "product",
          leftJoinAndSelect: {
            Categories: "product.Categories",
            Type: "product.Type",
          },
        },
        order: {
          id: isNormal,
        },
        where: (qb) => {
          qb.where("product.isShown=1")
            .andWhere("product.price BETWEEN :begin AND :end", {
              begin: minPrice,
              end: maxPrice,
            })
            .andWhere("Categories.categoryName= :categoryName", {
              categoryName: category,
            });
        },
      });
    } else if (productType != null) {
      result = await productRepository.find({
        join: {
          alias: "product",
          leftJoinAndSelect: {
            Categories: "product.Categories",
            Type: "product.Type",
          },
        },
        order: {
          id: isNormal,
        },
        where: (qb) => {
          qb.where("product.isShown=1")
            .andWhere("product.price BETWEEN :begin AND :end", {
              begin: minPrice,
              end: maxPrice,
            })
            .andWhere("Type.TypeName IN (:types)", { types: productType });
        },
      });
    } else {
      result = await productRepository.find({
        join: {
          alias: "product",
          leftJoinAndSelect: {
            Categories: "product.Categories",
            Type: "product.Type",
          },
        },
        order: {
          id: isNormal,
        },
        where: (qb) => {
          qb.where("product.isShown=1").andWhere(
            "product.price BETWEEN :begin AND :end",
            { begin: minPrice, end: maxPrice }
          );
        },
      });
    }

    //Send the product object
    res.send(result);
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
          Categories: "product.Categories",
          Type: "product.Type",
        },
      },
      where: (qb) => {
        qb.where("product.isShown=1").andWhere("Type.TypeName= :typeName", {
          typeName: typeName,
        });
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

  // static listAllProductsWithoutCategory = async (
  //   req: Request,
  //   res: Response
  // ) => {
  //   Get products from database
  //   const productRepository = getRepository(Product);
  //   const products = await productRepository.find({
  //     where: {
  //       Categories: {
  //         id: IsNull(),
  //       },
  //     },
  //   });

  //   Send the product object
  //   res.send(products);
  // };

  static listAllProductType = async (req: Request, res: Response) => {
    //Get product types from database
    const productRepository = getRepository(ProductType);
    const products = await productRepository.find({});

    //Send the product object
    res.send(products);
  };

  static productByReference = async (req: Request, res: Response) => {
    const { Reference } = req.body;
    let products;
    //Get products from database
    const productRepository = getRepository(Product);
    try {
      products = await productRepository.findOneOrFail({
        where: {
          Reference: Reference,
        },
        relations: ["ProductIngredients"],
      });
    } catch (error) {
      res.status(404).send("Product not found");
      return;
    }

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
        relations: ["ProductIngredients", "Type", "Categories", "SkinTypes"],
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
      Categories,
      ProductShortDescription,
      isShown,
      usingAdvice,
      SkinTypes,
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
    product.Categories = Categories;
    product.ProductShortDescription = ProductShortDescription;
    product.isShown = isShown;
    product.usingAdvice = usingAdvice;
    product.SkinTypes = SkinTypes;
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
