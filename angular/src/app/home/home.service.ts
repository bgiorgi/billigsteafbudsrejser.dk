import { Injectable, LOCALE_ID, Inject } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { environment } from '../../environments/environment';

@Injectable({
  providedIn: 'root'
})
export class HomeService {

  locale:string;
  
  constructor(private http: HttpClient, @Inject(LOCALE_ID) locale: string) {
    this.locale = locale.replace('en-US','en_US').replace('da','da_DK');
  }
  
  getMainpageData() {
    let params = {
      lang: this.locale
    }
    return this.http.get(environment.apiUrl+'/api/mainpage',{ params: params});
  }
  


  getStaticPages() {
    return this.http.get(environment.apiUrl+'/api/get-static-pages',{ params: { lang: this.locale }});
  }
    
  
}
