import {
  Entity,
  Column,
  PrimaryGeneratedColumn,
  ManyToMany,
  JoinTable,
  OneToMany,
  JoinColumn,
  ManyToOne,
} from "typeorm";
import { Category } from "./Category";
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


  @ManyToOne((category) => Category)
  @JoinColumn()
  Category: Category;
}
