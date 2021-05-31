import { ComponentFixture, TestBed } from '@angular/core/testing';

import { TypeIngredientsComponent } from './type-ingredients.component';

describe('TypeIngredientsComponent', () => {
  let component: TypeIngredientsComponent;
  let fixture: ComponentFixture<TypeIngredientsComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ TypeIngredientsComponent ],
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(TypeIngredientsComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
