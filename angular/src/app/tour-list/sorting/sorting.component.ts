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
      this.params = {
        number_of_persons: queryParams.number_of_persons,
        departure_date: moment(queryParams.departure_date).format('YYYY-MM-DD'),
        flexible_departure: queryParams.flexible_departure,
        destination: queryParams.destination,
        price_min: queryParams.price_min,
        price_max: queryParams.price_max,
        duration_min: queryParams.duration_min,
        duration_max: queryParams.duration_max,
        order: queryParams.order
      }
  });
}


  sortTours() {
    this.router.navigate([], { queryParams: this.params});
  }

}
