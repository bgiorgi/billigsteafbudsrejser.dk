// this service is used for retrieval of destinations for the autocomplete
import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { environment } from '../../../../environments/environment';



@Injectable({
  providedIn: 'root'
})
export class DestinationsService {

  constructor(private http: HttpClient) {}
    
  getDestinations() {
    return this.http.get(environment.apiUrl+'/api/autocomplete/destinations');
  }
    
}
