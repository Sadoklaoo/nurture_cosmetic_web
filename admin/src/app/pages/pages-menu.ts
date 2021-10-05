import { NbMenuItem } from '@nebular/theme';

export const MENU_ITEMS: NbMenuItem[] = [
  {
    title: 'Categories',
    icon: 'grid-outline',
    children: [
      {
        title: 'List categories',
        link: '/pages/categories/list-categories',
      },
      {
        title: 'Add category',
        link: '/pages/categories/add-category',
      },
    
    
    ],
  },
  {
    title: 'Products',
    icon: 'pricetags-outline',
    children: [
      {
        title: 'List products',
        link: '/pages/produits/list-produits',
      },
      {
        title: 'Add Product',
        link: '/pages/produits/add-produits',
      },
      {
        title: 'Edit product\'s ingredients',
        link: '/pages/produits/produits-ingredients',
      },
      {
        title: 'Produits Details',
        link: '/pages/produits/produits-details',
      },
    ],
  },
  {
    title: 'Ingrédients',
    icon: 'clipboard-outline',
    link: '/pages/ingredients/list-ingredients',
    
  },
  {
    title: 'Allergens',
    icon: 'sun-outline',
    home: true,
    children: [
      {
        title: 'Add allergen',
        link: '/pages/allergies/add-allergy',
      },
      {
        title: 'List allergens',
        link: '/pages/allergies/list-allergies',
      },
      {
        title: 'Associate Ingredient/Allergen',
        link: '/pages/allergies/affect-allergies-ingredients',
      },
    ],
  },
  
  
  {
    title: 'Claims',
    icon: 'question-mark-circle-outline',
    link: '/pages/reclamations/list-reclamation',
  },
  {
    title: 'Utilisateurs',
    icon: 'people-outline',
    link: '/pages/users/list-users',
  },
  
  
 
];
