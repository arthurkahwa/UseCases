import { TestBed } from '@angular/core/testing';

import { CallService } from './call-service-s.service';

describe('CallServiceService', () => {
  let service: CallService;

  beforeEach(() => {
    TestBed.configureTestingModule({});
    service = TestBed.inject(CallService);
  });

  it('should be created', () => {
    expect(service).toBeTruthy();
  });
});
