import { Component, OnInit } from '@angular/core';
import { MatBottomSheet } from '@angular/material';
import { BottomSheetComponent } from './bottom-sheet/bottom-sheet.component';
import { ActivatedRoute } from '@angular/router';


@Component({
  selector: 'app-tour-list',
  templateUrl: './tour-list.component.html',
  styleUrls: ['./tour-list.component.scss']
})
export class TourListComponent implements OnInit {
  params:any;

  constructor(
    private bottomSheet: MatBottomSheet,
    private route: ActivatedRoute
    ) {
        this.route.queryParams.subscribe(queryParams => {
        this.params = queryParams;  
    });
  }
  
    openBottomSheet(): void {
    this.bottomSheet.open(BottomSheetComponent);
  }

  ngOnInit() {
  }
  
  
  receiveParams($event) {
    this.params = $event;
    console.log('params received');
    console.log($event);
  }

}
