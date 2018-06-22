import { Component, OnInit } from '@angular/core';
import { ProvidersService } from './providers.service';


@Component({
  selector: 'app-providers',
  templateUrl: './providers.component.html',
  styleUrls: ['./providers.component.scss']
})
export class ProvidersComponent implements OnInit {

  providers: any;
  
  
  constructor(  private providersService: ProvidersService  ) { }

  ngOnInit() {
  }

  // after loading view, load fetched tours
  ngAfterViewInit() {
        this.fetchProviders();
  }
  
  
    // function for getting tour variations, which uses initialized service
    fetchProviders() {
     this.providersService.getProviders()
    .subscribe((data:any) => this.providers = data);
    }
}
