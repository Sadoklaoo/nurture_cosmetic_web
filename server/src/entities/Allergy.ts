import { Ingredient } from './Ingredient';
import {
  Entity,
  Column,
  PrimaryGeneratedColumn,
  OneToOne,
  JoinColumn,
  ManyToMany,
  JoinTable,
  ManyToOne,
} from "typeorm";
import { Client } from "./Client";

@Entity()
export class Allergy {
  @PrimaryGeneratedColumn()
  id: number;

  @Column({nullable:true})
  AllergyName: string;

  @Column()
  Image: string;

  @ManyToOne((client) => Client, { onDelete: "CASCADE" })
  @JoinColumn()
  client: Client;

  @ManyToMany(() => Ingredient)
  @JoinTable({name: 'ingredient_trigered_allergy',})
  IngredientTriggering: Ingredient[];
}
