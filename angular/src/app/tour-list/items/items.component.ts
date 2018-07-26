import { Component, OnInit } from '@angular/core';
import { ItemsService } from './items.service';
import { environment } from '../../../environments/environment';
import { ActivatedRoute } from '@angular/router';
import { SearchFormService } from '../../shared/services/search-form.service';



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
  noMoreTours:boolean;
  
  searchFormSubscription;
  
  
  constructor(
    private itemsService: ItemsService,
    private searchFormService: SearchFormService
    ) {}

  ngOnInit() {
    this.searchFormSubscription = this.searchFormService.currentParams.subscribe(currentParams => {
      this.params = currentParams;
      this.searchTours();
    });
  }


  ngOnDestroy() {
    this.searchFormSubscription.unsubscribe();
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
    if(lastPage>1 && lastPage==this.currentPage) this.noMoreTours = true;
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
  



  
  redirectUrl(tour_id) {
    return environment.apiUrl+'/redirect-tour/'+tour_id;
  }
    
}


