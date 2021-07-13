import {
  Entity,
  Column,
  PrimaryGeneratedColumn,
  OneToOne,
  CreateDateColumn,
  JoinColumn,
  ManyToOne,
  Index,
} from "typeorm";
import { Admin } from "./Admin";
import { Client } from "./Client";

@Entity()
export class Contact {
  @PrimaryGeneratedColumn()
  id: number;

  @Column()
  message: string;

  @Column()
  type: string;

  @Column()
  rate: number;


  @ManyToOne(() => Client, (client) => client.id, { nullable: true })
  @JoinColumn()
  Client: Client;

  @Column()
  @CreateDateColumn()
  date: Date;
}
