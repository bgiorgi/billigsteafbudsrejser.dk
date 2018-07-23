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
  
  
  getTours(params) {
    
      let queryParams = {
        departure_date: params.departure_date,
        departure_airports: JSON.stringify(params.departure_airports),
        flexible_departure: params.flexible_departure,
        destination: params.destination,
        price_min: params.price_min,
        price_max: params.price_max,
        duration_min: params.duration_min,
        duration_max: params.duration_max,
        providers: JSON.stringify(params.providers),
        order: params.order,
        page: params.page
      }    
      
      Object.keys(queryParams).forEach(key => !queryParams[key] ? delete queryParams[key] : ''); // delete undefined values
    
      return this.http.get(environment.apiUrl+'/api/search-tours', {params: queryParams});
    }
}
