import {
  Entity,
  Column,
  PrimaryGeneratedColumn,
  ManyToMany,
  JoinTable,
  OneToMany,
  ManyToOne,
} from "typeorm";
import { Allergy } from "./Allergy";

@Entity()
export class Ingredient {
  @PrimaryGeneratedColumn()
  id: number;

  @Column()
  IngredientName: string;

  @Column({ unique: true })
  IngredientType: string;

  @ManyToMany(() => Allergy)
  @JoinTable()
  AllergyTriggered: Allergy[];
}
