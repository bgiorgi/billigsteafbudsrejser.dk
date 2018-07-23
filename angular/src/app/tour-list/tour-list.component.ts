import { Component, OnInit } from '@angular/core';
import { MatBottomSheet } from '@angular/material';
import { BottomSheetComponent } from './bottom-sheet/bottom-sheet.component';
import { ActivatedRoute } from '@angular/router';
import { SearchFormService } from '../shared/services/search-form.service';


@Component({
  selector: 'app-tour-list',
  templateUrl: './tour-list.component.html',
  styleUrls: ['./tour-list.component.scss']
})
export class TourListComponent implements OnInit {
  params:any = {};

  constructor(
    private bottomSheet: MatBottomSheet,
    private route: ActivatedRoute,
    private searchFormService: SearchFormService
    ) {
        this.route.queryParams.subscribe((queryParams:any) => {
          if(queryParams.order) this.params.order = queryParams.order;
          if(queryParams.destination) this.params.destination = queryParams.destination;
          if(queryParams.providers) this.params.providers = [queryParams.providers];
          
        
        this.searchFormService.changeCurrentParams(this.params);
    });
  }
  
    openBottomSheet(): void {
    this.bottomSheet.open(BottomSheetComponent);
  }

  ngOnInit() {
  }
  
  ngOnDestroy() {
    this.searchFormService.deleteParams();
  }
  
  
}
