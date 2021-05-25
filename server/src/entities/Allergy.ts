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

  @Column({ unique: true })
  AllergyName: string;

  @Column()
  AllergyDescription: string;

  @Column()
  Image: string;

  @ManyToOne((client) => Client, { onDelete: "CASCADE" })
  @JoinColumn()
  client: Client;
}
