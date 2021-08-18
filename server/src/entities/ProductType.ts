import {
    Entity,
    Column,
    PrimaryGeneratedColumn,

  } from "typeorm";
  
  
  @Entity()
  export class ProductType {
    @PrimaryGeneratedColumn()
    id: number;
  
    @Column()
    TypeName: string;

    @Column()
    Image: string;
   
  }
  