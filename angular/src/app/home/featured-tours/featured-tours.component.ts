import { Component, OnInit, Input } from '@angular/core';
import { FeaturedToursService } from './featured-tours.service';
import { environment } from '../../../environments/environment';

@Component({
  selector: 'app-featured-tours',
  templateUrl: './featured-tours.component.html',
  styleUrls: ['./featured-tours.component.scss'],
  providers: [FeaturedToursService]  
})
export class FeaturedToursComponent implements OnInit {
  // get tour type from home component
  @Input() tourType; // tour type: cheapest, closest, most popular
  @Input() tourOrder; // tour ordering
  
  tours: any;


  
  constructor(private featuredToursService: FeaturedToursService) { }

  ngOnInit() {
  }
  
  
  // after loading view, load fetched tours
  ngAfterViewInit() {
        this.searchTours();
  }
  
    // function for getting tours, which uses initialized service
    searchTours() {
     this.featuredToursService.getTours({tourType:this.tourType})
    .subscribe((data:any) => this.tours = data);
    console.log(this.tourType);
    }  
    
    
  // function for tour redirection  
  redirectUrl(tour_id) {
    return environment.apiUrl+'/redirect-tour/'+tour_id;
  }    

}
