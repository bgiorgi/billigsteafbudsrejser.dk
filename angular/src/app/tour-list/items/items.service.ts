// this service is for fetching tours from back end
import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { environment } from '../../../environments/environment';

@Injectable({
  providedIn: 'root'
})
export class ItemsService {

  constructor(
    private http: HttpClient
    ) { }
  
  toursUrl = environment.apiUrl+'/api/search-tours';
  
  getTours(params) {
      Object.keys(params).forEach(key => params[key] === undefined ? delete params[key] : ''); // delete undefined keys
      return this.http.get(this.toursUrl, {params: params});
    }
}
