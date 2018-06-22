import { Injectable } from '@angular/core';
import { HttpClient,HttpParams } from '@angular/common/http';
import { environment } from '../../../environments/environment';


@Injectable({
  providedIn: 'root'
})
export class FeaturedToursService {

  constructor(private http: HttpClient) { }
  
  toursUrl = environment.apiUrl+'/api/search-featured-tours';  
  
  getTours(options) {
    const params = { params: new HttpParams()
    .set('tourType',options.tourType)
    };
    return this.http.get(this.toursUrl,params);
  }
  

}
