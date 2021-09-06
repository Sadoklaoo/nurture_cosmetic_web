import {
    Entity,
    Column,
    PrimaryGeneratedColumn,

  } from "typeorm";
  
  
  @Entity()
  export class SkinType {
    @PrimaryGeneratedColumn()
    id: number;
  
    @Column()
    SkinTypeName: string;


   
  }
  