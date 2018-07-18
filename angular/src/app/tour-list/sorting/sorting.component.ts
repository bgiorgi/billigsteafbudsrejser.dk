import { Component, OnInit } from '@angular/core';
import { ActivatedRoute, Router } from '@angular/router';
import * as moment from 'moment';

@Component({
  selector: 'app-sorting',
  templateUrl: './sorting.component.html',
  styleUrls: ['./sorting.component.scss']
})
export class SortingComponent implements OnInit {


  params:any;
  
  
  constructor(
    private route: ActivatedRoute, 
    private router: Router
    ) { }

  ngOnInit() {
     this.route.queryParams.subscribe(queryParams => {
      let departure_airport = queryParams.departure_airport instanceof Array ? queryParams.departure_airport : queryParams.departure_airport ? [queryParams.departure_airport] : queryParams.departure_airport;
      let providers = queryParams.providers instanceof Array ? queryParams.providers : queryParams.providers ? [queryParams.providers] : queryParams.providers;
      
      this.params = {
        departure_airport: departure_airport, // array
        departure_date: queryParams.departure_date,
        flexible_departure: queryParams.flexible_departure,
        destination: queryParams.destination,
        price_min: queryParams.price_min,
        price_max: queryParams.price_max,
        duration_min: queryParams.duration_min,
        duration_max: queryParams.duration_max,
        providers: providers, // array
        order: queryParams.order
      }

      
  });
}


  sortTours() {
    this.router.navigate([], { queryParams: this.params});
  }

}
