import { Component, OnInit } from '@angular/core';
import {Router} from '@angular/router';
import * as moment from 'moment';

@Component({
  selector: 'app-home',
  templateUrl: './home.component.html',
  styleUrls: ['./home.component.scss']
})
export class HomeComponent implements OnInit {

  params:any= {
    departure_airport: ['Billund','Aalborg','Aarhus'],
    flexible_departure:21
  };
  searching = false; 
  
  
  constructor(private router: Router) { }

  ngOnInit() {
  }


  onSubmit() {
    this.searching = true;
    if(this.params.departure_date) this.params.departure_date =  moment(this.params.departure_date).format('YYYY-MM-DD');
    else this.params.flexible_departure = undefined;
        this.router.navigate(['/tour-list'], { queryParams: this.params});

  }
}
