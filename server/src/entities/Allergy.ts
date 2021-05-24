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

    @Column({unique:true})
    AllergyName: string;
  
    @Column()
    AllergyDescription: string;
    
    @Column()
    Image: string;
  
    @ManyToMany(() => Ingredient)
    @JoinTable()
    Triggers: Ingredient[];
    

  }
  
  
  
  
  
  