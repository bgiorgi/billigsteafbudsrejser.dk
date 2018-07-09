import { Component, OnInit } from '@angular/core';
import { ActivatedRoute, Router } from '@angular/router';
import * as moment from 'moment';
import { FormControl, FormGroup, FormBuilder } from '@angular/forms';
// rxjs needed for autocomplete
import {Observable} from 'rxjs';
import {map, startWith} from 'rxjs/operators';
import { DestinationsService } from '../shared/services/destinations.service';




@Component({
  selector: 'app-sidebar',
  templateUrl: './sidebar.component.html',
  styleUrls: ['./sidebar.component.scss']
})
export class SidebarComponent implements OnInit {
  
  params:any;
  form: FormGroup;

  
  // for autocomplete
  states: any;  
  filteredStates: Observable<any[]>;


  
  
  constructor(
    private route: ActivatedRoute, 
    private router: Router,
    private fb: FormBuilder,
    private destinationsService: DestinationsService
    ) {}
    

  // for autocomplete
  filterStates(value: string) {
    return this.states.filter(state =>
      state.value.toLowerCase().indexOf(value.toLowerCase()) === 0);
  }


  ngOnInit() {
    this.route.queryParams.subscribe(queryParams => {
      this.params = {
        departure_airport: queryParams.departure_airport,
        departure_date: queryParams.departure_date,
        flexible_departure: queryParams.flexible_departure,
        destination: queryParams.destination,
        price_min: queryParams.price_min,
        price_max: queryParams.price_max,
        duration_min: queryParams.duration_min,
        duration_max: queryParams.duration_max,
        order: queryParams.order
      }
    });

  
    this.createForm();
    this.valueChanges();


      // generate states
      this.destinationsService.getDestinations().subscribe(destinations => {
        this.states = destinations
        console.log(this.states);
      
      
                
    // for autocomplete
    this.filteredStates = this.form.get('destination').valueChanges
      .pipe(
        startWith(''),
        map(state => state ? this.filterStates(state) : this.states.slice())
      );    
      
      });

      
      

      

  }
  
  
  createForm() {
        this.form = this.fb.group({
          "departure_airport": [this.params.departure_airport],
          "departure_date": this.params.departure_date,
          "flexible_departure": this.params.flexible_departure,
          "destination": this.params.destination,
          "price_min": this.params.price_min,
          "price_max": this.params.price_max,
          "duration_min": this.params.duration_min,
          "duration_max": this.params.duration_max
    });
  }




  valueChanges() {
    this.form.valueChanges
      .subscribe((value) => {
      let queryParams = {
        departure_airport: value.departure_airport,
        departure_date: value.departure_date,
        flexible_departure: value.flexible_departure,
        destination: value.destination,
        price_min: value.price_min,
        price_max: value.price_max,
        duration_min: value.duration_min,
        duration_max: value.duration_max,
        order: this.params.order
    }
    if(queryParams.departure_date) queryParams.departure_date = moment(queryParams.departure_date).format('YYYY-MM-DD');
    this.router.navigate([], { queryParams: queryParams});
    // console.log(form.value);
      });
      
  }

}









