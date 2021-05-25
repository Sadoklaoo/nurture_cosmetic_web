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
import { Product } from "./Product";

@Entity()
export class History {
  @PrimaryGeneratedColumn()
  id: number;

  @Column()
  SearchString: string;

  @ManyToMany(() => Product)
  @JoinTable()
  ConsultedProducts: Product[];

  @ManyToOne((client) => Client, { onDelete: "CASCADE" })
  @JoinColumn()
  Client: Client;
}
