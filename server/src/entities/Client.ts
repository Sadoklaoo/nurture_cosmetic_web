import {
  Entity,
  Column,
  ManyToMany,
  OneToOne,
  JoinColumn,
  OneToMany,
  JoinTable,
} from "typeorm";
import { User } from "./User";
import { Contact } from "./Contact";
import { Notification } from "./Notifcation";
import { Allergy } from "./Allergy";
import { Skin } from "./Skin";
import { Product } from "./Product";
import { History } from "./History";

@Entity()
export class Client extends User {
  @Column({ nullable: true })
  requestCode: number;

  @Column("datetime")
  @Column({ nullable: true })
  requestCodeEndDate: Date;

  @Column({ nullable: true })
  notificationToken: string;

  @OneToMany(() => Notification, (notification) => notification.id)
  Notifications: Notification[];

  @OneToMany(() => Contact, (contact) => contact.Client)
  Contact: Contact[];

  @OneToMany(() => Allergy, (allergy) => allergy.client)
  Allergies: Allergy[];

  @OneToMany(() => History, (History) => History.Client)
  History: History[];

  @OneToOne(() => Skin, (skin) => skin.Client)
  Skin: Skin;

  @ManyToMany(() => Product)
  @JoinTable({ name: "client_favoris" })
  Favoris: Product[];

  isProductCompatible(product: Product) {
    let isCompatible = true;
    let final_allergies: Allergy[];
    let ingredients;

    final_allergies = [];
    ingredients = product.ProductIngredients;
    ingredients.forEach((ingr) => {
      ingr.Allergies.forEach((allergy) => {
        if (final_allergies.indexOf(allergy) == -1) {
          final_allergies.push(allergy);
        }
      });
    });

    final_allergies = Object.values(
      final_allergies.reduce(
        (acc, cur) => Object.assign(acc, { [cur.id]: cur }),
        {}
      )
    );

    if (
      this.Skin != null &&
      (this.Skin.SkinType != product.PreferedSkinType ||
        product.PreferedSkinType != "NORMAL")
    ) {
      isCompatible = false;
    }

    this.Allergies.forEach((userAllergy) => {
      final_allergies.forEach((allergy) => {
        if (allergy.AllergyName == userAllergy.AllergyName) {
          isCompatible = false;
        }
      });
    });

    return isCompatible;
  }
}
