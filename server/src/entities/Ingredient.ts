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

  @Column({unique:true})
  IngredientName: string;

  @Column()
  IngredientType: string;

  @ManyToMany(() => Allergy, allergy => allergy.IngredientTriggering)
    @JoinTable({name: 'ingredient_trigered_allergy',})
    Allergies: Allergy[];
}
