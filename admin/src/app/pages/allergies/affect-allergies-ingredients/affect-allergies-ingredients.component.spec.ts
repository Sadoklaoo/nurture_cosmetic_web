import { ComponentFixture, TestBed } from '@angular/core/testing';

import { AffectAllergiesIngredientsComponent } from './affect-allergies-ingredients.component';

describe('AffectAllergiesIngredientsComponent', () => {
  let component: AffectAllergiesIngredientsComponent;
  let fixture: ComponentFixture<AffectAllergiesIngredientsComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ AffectAllergiesIngredientsComponent ],
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(AffectAllergiesIngredientsComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
