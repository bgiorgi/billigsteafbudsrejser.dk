import { Component, OnInit } from '@angular/core';
import { FormGroup, FormBuilder } from '@angular/forms';
// rxjs needed for autocomplete
import {Observable} from 'rxjs';
import {map, startWith} from 'rxjs/operators';
import { DestinationsService } from '../shared/services/destinations.service';
import { ProvidersService } from '../shared/services/providers.service';
import { SearchFormService } from '../../shared/services/search-form.service';



@Component({
  selector: 'app-sidebar',
  templateUrl: './sidebar.component.html',
  styleUrls: ['./sidebar.component.scss']
})
export class SidebarComponent implements OnInit {
  
  params:any;
  searchForm: FormGroup;

  
  // for autocomplete
  states: any;  
  filteredStates: Observable<any[]>;
  
  // providers
  providers:any;
  
  searchFormSubscription;
  
  departure_airports = ['Billund','Aalborg','Aarhus'];
  flexible_departure = '21';


  
  
  constructor(
    private fb: FormBuilder,
    private destinationsService: DestinationsService,
    private providersService: ProvidersService,
    private searchFormService: SearchFormService
    ) {}
    

  // for autocomplete
  filterStates(value: string) {
    return this.states.filter(state =>
      state.value.toLowerCase().indexOf(value.toLowerCase()) === 0);
  }


  ngOnInit() {

    this.searchFormSubscription = this.searchFormService.currentParams.subscribe(data => {
      this.params = data;
          this.createForm();
          this.valueChanges();          
          }).unsubscribe();

      // generate states
      this.destinationsService.getDestinations().subscribe(destinations => {
        this.states = destinations

                
    // for autocomplete
    this.filteredStates = this.searchForm.get('destination').valueChanges
      .pipe(
        startWith(''),
        map(state => state ? this.filterStates(state) : this.states.slice())
      );    
      
      });

      
    // generate providers
    this.providersService.getProviders().subscribe((data:any) => this.providers = data.data);

      
  }
  

  
  
  createForm() {
    
    let departure_airports = this.params.departure_airports ? this.params.departure_airports : this.departure_airports;
    let flexible_departure = this.params.flexible_departure ? this.params.flexible_departure : this.flexible_departure;
    
    this.searchForm = this.fb.group({
      departure_airports: [departure_airports],
      departure_date: this.params.departure_date,
      flexible_departure: flexible_departure,
      destination: this.params.destination,
      price_min: this.params.price_min,
      price_max: this.params.price_max,
      duration_min: this.params.duration_min,
      duration_max: this.params.duration_max,
      providers: [this.params.providers]
    });
  }




  valueChanges() {
    this.searchForm.valueChanges.subscribe(values => {
      this.searchFormService.deleteParams();
      this.searchFormService.changeCurrentParams(values);
      })
  }

}









