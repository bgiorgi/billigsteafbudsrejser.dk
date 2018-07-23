import { Component, OnInit } from '@angular/core';
import { SearchFormService } from '../../shared/services/search-form.service';


@Component({
  selector: 'app-sorting',
  templateUrl: './sorting.component.html',
  styleUrls: ['./sorting.component.scss']
})
export class SortingComponent implements OnInit {

  
  constructor(private searchFormService: SearchFormService) { }

  

  ngOnInit() {
  }

  sortTours(order) {
    this.searchFormService.changeCurrentParams({order: order});
  }

}
