import { ComponentFixture, TestBed } from '@angular/core/testing';

import { AffectProduitCategorieComponent } from './affect-produit-categorie.component';

describe('AffectProduitCategorieComponent', () => {
  let component: AffectProduitCategorieComponent;
  let fixture: ComponentFixture<AffectProduitCategorieComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ AffectProduitCategorieComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(AffectProduitCategorieComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
