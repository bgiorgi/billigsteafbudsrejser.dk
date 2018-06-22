import { Component, OnInit } from '@angular/core';
import { PopularDestinationsService } from './popular-destinations.service';

@Component({
  selector: 'app-popular-destinations',
  templateUrl: './popular-destinations.component.html',
  styleUrls: ['./popular-destinations.component.scss']
})
export class PopularDestinationsComponent implements OnInit {

  destinations:any;
  constructor(private popularDestinationsService: PopularDestinationsService) { }

  ngOnInit() {
  }
  
  ngAfterViewInit() {
    this.fetchDestinations();
  }
  
  fetchDestinations(){
    this.popularDestinationsService.getDestinations().subscribe((data:any) => this.destinations = data)
  }

}
