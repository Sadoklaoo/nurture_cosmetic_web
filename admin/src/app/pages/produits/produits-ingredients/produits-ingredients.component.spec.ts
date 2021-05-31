import { ComponentFixture, TestBed } from '@angular/core/testing';

import { ProduitsIngredientsComponent } from './produits-ingredients.component';

describe('ProduitsIngredientsComponent', () => {
  let component: ProduitsIngredientsComponent;
  let fixture: ComponentFixture<ProduitsIngredientsComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ ProduitsIngredientsComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(ProduitsIngredientsComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
