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
    const products = await productRepository.find({ relations: ["Category","ProductIngredients"] });

    //Send the product object
    res.send(products);
  };

  static listAllProductsByCategoryId = async (req: Request, res: Response) => {
    let { id } = req.body;
    //Get products from database
    const productRepository = getRepository(Product);
    const products = await productRepository.find({
      select:["id","ProductName", "Price","Image","ProductDescription"],
      relations:["Category"],
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


  static editProduct = async (req: Request, res: Response) => {
    //Get values from the body
    const { id, 
      ProductName, 
      Reference, 
      Category, 
      ProductDescription, 
      ProductSecondDescription,
      ProductDimensions,
      PreferedSkinType,
      Type,
      Price,
      Image } = req.body;

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
    const product = await ProductRepository.findOneOrFail({where:{ id: id }, relations: ["ProductIngredients"] });

    const IngredientRepository = getRepository(Ingredient);
    let ingredients;
    let finalList:Array<String> = [];
    product.ProductIngredients.forEach((ingredient)=>{
      finalList.push(ingredient.IngredientName);
    })
    console.log(finalList);

  if (finalList.length>0){
     ingredients = await IngredientRepository.createQueryBuilder("ingredient")
    .where("ingredient.IngredientName NOT IN (:...list)",{list : finalList}).getMany();
  }else{
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
      const product = await ProductRepository.findOneOrFail({where:{ id: id }, relations: ["ProductIngredients"] });
      const ingredient = await IngredientRepository.findOneOrFail({where:{ id: IngredientId }});
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
      const product = await ProductRepository.findOneOrFail({where:{ id: id }, relations: ["ProductIngredients"] });
      const ingredient = await IngredientRepository.findOneOrFail({where:{ id: IngredientId }});
      let index = 0;
      


      product.ProductIngredients.forEach((item,i)=>{
        if (item.id == ingredient.id){
          index = i;
        }
      })
    
      product.ProductIngredients.splice(index,1);
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
