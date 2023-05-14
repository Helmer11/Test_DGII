/* tslint:disable:no-unused-variable */

import { TestBed, async, inject } from '@angular/core/testing';
import { ContribuyenteService } from './Contribuyente.service';

describe('Service: Contribuyente', () => {
  beforeEach(() => {
    TestBed.configureTestingModule({
      providers: [ContribuyenteService]
    });
  });

  it('should ...', inject([ContribuyenteService], (service: ContribuyenteService) => {
    expect(service).toBeTruthy();
  }));
});
