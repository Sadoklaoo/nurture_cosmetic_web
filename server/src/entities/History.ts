import {
  Entity,
  Column,
  PrimaryGeneratedColumn,
  OneToOne,
  CreateDateColumn,
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


  @ManyToOne(() => Product)
  ConsultedProduct: Product;

  @Column()
  @CreateDateColumn()
  consultedAt: Date;

  @ManyToOne((client) => Client, { onDelete: "CASCADE" })
  @JoinColumn()
  Client: Client;
}
