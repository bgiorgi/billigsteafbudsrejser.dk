import { Injectable } from '@angular/core';
import { BehaviorSubject } from 'rxjs';
import * as moment from 'moment/moment';


@Injectable({
  providedIn: 'root'
})
export class SearchFormService {


  
  private paramsSource = new BehaviorSubject({});
  currentParams = this.paramsSource.asObservable();



  constructor() { }
  
  params:any = {};
  
  
      
  changeCurrentParams(data) {
    if(data.departure_date) data.departure_date = moment(data.departure_date).format('YYYY-MM-DD');
    Object.keys(data).forEach(key => this.params[key] = data[key]);    
    Object.keys(data).forEach(key => !data[key] ? delete this.params[key] : ''); // delete empty values
    this.paramsSource.next(this.params);
  }        
  
  deleteParams() {
    this.params = {};
    this.paramsSource.next(this.params);
  }

    
    
    
}






