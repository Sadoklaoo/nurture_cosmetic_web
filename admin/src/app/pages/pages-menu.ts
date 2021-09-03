import { NbMenuItem } from '@nebular/theme';

export const MENU_ITEMS: NbMenuItem[] = [
  {
    title: 'Catégories',
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
      {
        title: 'Affecter produit/categorie',
        link: '/pages/categories/affect-produit-categorie',
      },
    
    ],
  },
  {
    title: 'Produits',
    icon: 'pricetags-outline',
    children: [
      {
        title: 'List produits',
        link: '/pages/produits/list-produits',
      },
      {
        title: 'Ajouter Produit',
        link: '/pages/produits/add-produits',
      },
      {
        title: 'Affecter produits/ingredients',
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
    title: 'Allergies',
    icon: 'sun-outline',
    home: true,
    children: [
      {
        title: 'Add allergies',
        link: '/pages/allergies/add-allergy',
      },
      {
        title: 'List allergies',
        link: '/pages/allergies/list-allergies',
      },
      {
        title: 'Affecter allergies/ingredients',
        link: '/pages/allergies/affect-allergies-ingredients',
      },
    ],
  },
  
  
  {
    title: 'Réclamations',
    icon: 'question-mark-circle-outline',
    link: '/pages/reclamations/list-reclamation',
  },
  {
    title: 'Utilisateurs',
    icon: 'people-outline',
    link: '/pages/users/list-users',
  },
  
  
 
];
