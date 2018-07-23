import { Component, OnInit } from '@angular/core';
import { SearchFormService } from '../../shared/services/search-form.service';


@Component({
  selector: 'app-sorting',
  templateUrl: './sorting.component.html',
  styleUrls: ['./sorting.component.scss']
})
export class SortingComponent implements OnInit {

  
  constructor(private searchFormService: SearchFormService) { }

  order:string;

  ngOnInit() {
    this.searchFormService.currentParams.subscribe((data:any) => this.order = data.order);
  }

  sortTours(order) {
    this.searchFormService.changeCurrentParams({order: order});
  }

}
