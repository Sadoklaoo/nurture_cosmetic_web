import {
    Entity,
    Column,
    PrimaryGeneratedColumn,
    OneToOne,
    JoinColumn,
    ManyToMany,
    JoinTable,
    ManyToOne
  } from "typeorm";
import { Ingredient } from "./Ingredient";


  
  @Entity()
  export class Allergy {


    @PrimaryGeneratedColumn()
    id: number;

    @Column()
    AllergyName: string;
  
    @Column({unique:true})
    AllergyDescription: string;
  
    @ManyToMany(() => Ingredient)
    @JoinTable()
    Triggers: Ingredient[];
    

  }
  
  
  
  
  
  