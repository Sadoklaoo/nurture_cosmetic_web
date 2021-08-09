import { Client } from "./Client";

export class Contact {

    id:number;
    message: string;
    type: string;
    rate: number;
    status: string;
    date: Date;
    Client: Client;
   }