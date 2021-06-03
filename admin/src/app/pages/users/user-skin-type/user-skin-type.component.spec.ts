import { ComponentFixture, TestBed } from '@angular/core/testing';

import { UserSkinTypeComponent } from './user-skin-type.component';

describe('UserSkinTypeComponent', () => {
  let component: UserSkinTypeComponent;
  let fixture: ComponentFixture<UserSkinTypeComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ UserSkinTypeComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(UserSkinTypeComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
