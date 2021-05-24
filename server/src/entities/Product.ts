import {
    Entity,
    Column,
    PrimaryGeneratedColumn,
    ManyToMany,
    JoinTable,
    OneToMany,
    ManyToOne
  } from "typeorm";
import { Ingredient } from "./Ingredient";


  
  @Entity()
  export class Product {


    @PrimaryGeneratedColumn()
    id: number;

    @Column()
    ProductName: string;
  
    @Column({unique:true})
    Reference: string;
  
    @Column({ type: "float" })
    Price: number;

    @Column({ type: "float" })
    Rank: number;
    
    @Column()
    Image: string;

    @Column()
    Type: string;

    @Column()
    ProductDescription: string;

    @Column()
    ProductDimensions: string;
    @Column()
    PreferedSkinType: string;

    @ManyToMany(() => Ingredient)
    @JoinTable()
    ProductIngredients: Ingredient[];

  }
  
  
  
  
  
  