import { ComponentFixture, TestBed } from '@angular/core/testing';

import { UserAllergiesComponent } from './user-allergies.component';

describe('UserAllergiesComponent', () => {
  let component: UserAllergiesComponent;
  let fixture: ComponentFixture<UserAllergiesComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ UserAllergiesComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(UserAllergiesComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
