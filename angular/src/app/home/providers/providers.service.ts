import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { environment } from '../../../environments/environment';


@Injectable({
  providedIn: 'root'
})
export class ProvidersService {

  constructor(private http: HttpClient) { }
  
  
  private providersUrl = environment.apiUrl+'/api/providers';
  

  
  getProviders() {
    return this.http.get<any>(this.providersUrl);
  }
  



}
