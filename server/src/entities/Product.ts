import {
  Entity,
  Column,
  PrimaryGeneratedColumn,
  ManyToMany,
  JoinTable,
  OneToMany,
  JoinColumn,
  ManyToOne,
  CreateDateColumn,
  UpdateDateColumn,
} from "typeorm";
import { Allergy } from "./Allergy";
import { Category } from "./Category";
import { History } from "./History";
import { Ingredient } from "./Ingredient";
import { ProductType } from "./ProductType";

@Entity()
export class Product {
  @PrimaryGeneratedColumn()
  id: number;

  @Column()
  ProductName: string;

  @Column({ unique: true })
  Reference: string;

  @Column({ type: "float" })
  Price: number;

  @Column({ type: "float" })
  Rank: number;

  @Column()
  Image: string;

  @Column()
  @CreateDateColumn()
  createdAt: Date;

  @Column()
  @UpdateDateColumn()
  updatedAt: Date;

  @ManyToMany(() => ProductType)
  @JoinTable({name: 'product_types',})
  Type: ProductType[];

  @Column({ type: "longtext" })
  ProductDescription: string;
  @Column({ type: "longtext" })
  ProductSecondDescription: string;

  @Column()
  ProductDimensions: string;

  @Column()
  PreferedSkinType: string;

  @ManyToMany(() => Ingredient)
  @JoinTable({name: 'product_ingredients',})
  ProductIngredients: Ingredient[];

  @OneToMany(() => History, history => history.ConsultedProduct) // note: we will create author property in the Photo class below
    History: History[];

  @ManyToOne((category) => Category)
  @JoinColumn()
  Category: Category;

  isProductSimilar(product: Product) {
    let isSimilar = true;
    let final_allergies: Allergy[];
    let product_allergies: Allergy[];
    let ingredients;
    let product_ingredients;

    final_allergies = [];
    product_allergies = [];
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

    product_ingredients = this.ProductIngredients;
    product_ingredients.forEach((ingr) => {
      ingr.Allergies.forEach((allergy) => {
        if (product_allergies.indexOf(allergy) == -1) {
          product_allergies.push(allergy);
        }
      });
    });

    product_allergies = Object.values(
      product_allergies.reduce(
        (acc, cur) => Object.assign(acc, { [cur.id]: cur }),
        {}
      )
    );

    if(this.Category.CategoryName!=product.Category.CategoryName){
      isSimilar = false;
    }
    
    

    return isSimilar;
  }
}
