import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { environment } from '../../../environments/environment';

@Injectable({
  providedIn: 'root'
})
export class PopularDestinationsService {

  constructor(private http: HttpClient) { }

  private destinationsUrl = environment.apiUrl+'/api/popular-destinations';
  
  
  getDestinations() {
    return this.http.get<any>(this.destinationsUrl);
  }
    
  
}
