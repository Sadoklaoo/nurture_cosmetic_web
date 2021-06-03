import { ComponentFixture, TestBed } from '@angular/core/testing';

import { EtatReclamationComponent } from './etat-reclamation.component';

describe('EtatReclamationComponent', () => {
  let component: EtatReclamationComponent;
  let fixture: ComponentFixture<EtatReclamationComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ EtatReclamationComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(EtatReclamationComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
