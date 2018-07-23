import { Component, OnInit } from '@angular/core';
import { ItemsService } from './items.service';
import { MatSnackBar } from '@angular/material';
import { environment } from '../../../environments/environment';
import { ActivatedRoute } from '@angular/router';
import { SearchFormService } from '../../shared/services/search-form.service';
import { SnackbarComponent } from './snackbar/snackbar.component';


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
    public snackBar: MatSnackBar,
    private searchFormService: SearchFormService
    ) {}

  ngOnInit() {
    this.searchFormService.currentParams.subscribe(currentParams => {
      this.params = currentParams;
      this.searchTours();
    });
  }

  


  // function for getting tours, which uses initialized service
  searchTours() {
    this.isLoading = true;  
   this.itemsService.getTours(this.params)
  .subscribe((data:any) => { 
    this.tours = data;
    this.isLoading = false 
    });
  }

  
  
  onScroll() {
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


  appendTours() {
    this.isAppending = true;
   this.itemsService.getTours(this.params)
  .subscribe((data:any) => {
    this.tours.data = this.tours.data.concat(data.data)
    this.isAppending = false
    });
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


