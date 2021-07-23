import { Category } from "./Category";

export class Product {

    id:number;
    ProductName: string;
    Reference: string;
    Price: number;
    Rank: number;
    Image: string;
    ProductDescription: string;
    ProductSecondDescription: string;
    ProductDimensions: string;
    PreferedSkinType: string;
    Category: Category;
   }