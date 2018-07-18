// this service is used for retrieval of providers for sidebar
import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { environment } from '../../../../environments/environment';



@Injectable({
  providedIn: 'root'
})
export class ProvidersService {

  constructor(private http: HttpClient) {}
    
  getProviders() {
    return this.http.get(environment.apiUrl+'/api/providers');
  }
    
}
