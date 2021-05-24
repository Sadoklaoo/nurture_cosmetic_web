import {
    Entity,
    Column,
    ManyToMany,
    OneToMany
  } from "typeorm";
import { User } from "./User";
import { Contact } from "./Contact";
import { Notification } from "./Notifcation";


  
  @Entity()
  export class Client extends User{
  
    @Column({nullable:true})
    requestCode:number;

    @Column('datetime')
    @Column({nullable:true})
    requestCodeEndDate: Date;

    @Column({nullable:true})
    Image: string;

    @Column({default:0})
    fidelityPoints:number;

    @Column({nullable:true})
    notificationToken: string;

    
    @OneToMany(() => Notification, (notification) => notification.id)
    Notifications: Notification[];

    @OneToMany(() => Contact, (contact) => contact.Client)
    contact: Contact[];

    
  }
  
  
  
  
  
  
  
  