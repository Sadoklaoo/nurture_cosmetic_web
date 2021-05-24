import {
    Entity,
    Column,
    PrimaryGeneratedColumn,
    OneToOne,
    JoinColumn,
    OneToMany,
    ManyToOne
  } from "typeorm";


  
  @Entity()
  export class Ingredient {


    @PrimaryGeneratedColumn()
    id: number;

    @Column()
    IngredientName: string;
  
    @Column({unique:true})
    IngredientType: string;
  
    
    

  }
  
  
  
  
  
  