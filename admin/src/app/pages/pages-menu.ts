import { NbMenuItem } from '@nebular/theme';

export const MENU_ITEMS: NbMenuItem[] = [
  {
    title: 'Allergies',
    icon: 'sun-outline',
    home: true,
    children: [
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
    title: 'Ingrédients',
    icon: 'clipboard-outline',
    children: [
      {
        title: 'List ingrédients',
        link: '/pages/ingredients/list-ingredients',
      },
      {
        title: 'Type ingredients',
        link: '/pages/ingredients/type-ingredients',
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
    title: 'Réclamations',
    icon: 'question-mark-circle-outline',
    children: [
      {
        title: 'List réclamations',
        link: '/pages/reclamations/list-reclamation',
      },
      {
        title: 'Changer état réclamation',
        link: '/pages/reclamations/etat-reclamation',
      },
    
    ],
  },
  {
    title: 'Utilisateurs',
    icon: 'people-outline',
    children: [
      {
        title: 'List utilisateurs',
        link: '/pages/users/list-users',
      },
      
    
    ],
  },
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
    title: 'Auth',
    icon: 'lock-outline',
    children: [
      {
        title: 'Login',
        link: '/auth/login',
      },
      {
        title: 'Register',
        link: '/auth/register',
      },
      {
        title: 'Request Password',
        link: '/auth/request-password',
      },
      {
        title: 'Reset Password',
        link: '/auth/reset-password',
      },
    ],
  },
];
