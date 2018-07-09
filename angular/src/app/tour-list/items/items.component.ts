import { Component, OnInit } from '@angular/core';
import { ItemsService } from './items.service';
import * as moment from 'moment';
import { ActivatedRoute } from '@angular/router';
import { MatSnackBar } from '@angular/material';
import { SnackbarComponent } from './snackbar/snackbar.component';
import { environment } from '../../../environments/environment';


@Component({
  selector: 'app-items',
  templateUrl: './items.component.html',
  styleUrls: ['./items.component.scss'],
  providers: [ItemsService]
})
export class ItemsComponent implements OnInit {
  
  params:any;
  tours:any;
  currentPage:number = 1;
  isLoading = true;
  isAppending = false;
  


  
  constructor(
    private itemsService: ItemsService,
    private route: ActivatedRoute,
    public snackBar: MatSnackBar
    ) { 
    }

  ngOnInit() {
    this.route.queryParams.subscribe(queryParams => {
      this.params = {
        departure_airport: JSON.stringify(queryParams.departure_airport),
        departure_date: moment(queryParams.departure_date).format('YYYY-MM-DD'),
        flexible_departure: queryParams.flexible_departure,
        destination: queryParams.destination,
        price_min: queryParams.price_min,
        price_max: queryParams.price_max,
        duration_min: queryParams.duration_min,
        duration_max: queryParams.duration_max,
        order: queryParams.order,
        provider_id: queryParams.provider_id
      }
      
      this.searchTours();    
    });
      
  }

  


  // function for getting tours, which uses initialized service
  searchTours() {
    this.isLoading = true;  
    console.log(this.params);
   this.itemsService.getTours(this.params)
  .subscribe((data:any) => { 
    this.tours = data;
    this.isLoading = false 
    });
  }

  appendTours() {
    this.isAppending = true;
   this.itemsService.getTours(this.params)
  .subscribe((data:any) => {
    this.tours.data = this.tours.data.concat(data.data)
    this.isAppending = false
    });
  } 
  

  
  
  onScroll() {
    console.log('scrolled');
    if(this.tours) {
    let lastPage = this.tours.meta.last_page;
    if(lastPage>1 && lastPage==this.currentPage) this.openSnackBar();      
    else if(this.currentPage < lastPage) {
      this.currentPage++;
      this.params.page = this.currentPage;    
      this.appendTours();  
      }
    }
  }



  openSnackBar() {
    this.snackBar.openFromComponent(SnackbarComponent, {
      duration: 2000,
    });
  }
  
  
  redirectUrl(tour_id) {
    return environment.apiUrl+'/redirect-tour/'+tour_id;
  }
    
}


