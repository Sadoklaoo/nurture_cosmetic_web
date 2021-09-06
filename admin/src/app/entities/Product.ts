import { SkinType } from './SkinType';
import { Category } from "./Category";


export class Product {

    id:number;
    ProductName: string;
    Reference: string;
    Price: number;
    Rank: number;
    Image: string;
    ProductShortDescription: string;
    usingAdvice: string;
    isShown: boolean;
    Skintypes: SkinType[];
    Category: Category[];
   }