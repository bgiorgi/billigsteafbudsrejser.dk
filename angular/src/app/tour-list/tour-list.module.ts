import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
// routing
import { TourListRoutingModule } from './tour-list-routing.module';
// material design    
import { BrowserAnimationsModule } from '@angular/platform-browser/animations';
import { MatIconModule, MatButtonModule, MatFormFieldModule, MatInputModule, MatCardModule, MatDatepickerModule, MatNativeDateModule, MatSidenavModule, MatSelectModule, MatProgressSpinnerModule, MatBottomSheetModule, MatSnackBarModule, MatAutocompleteModule } from '@angular/material';
// material flex layout
import { FlexLayoutModule } from "@angular/flex-layout";
// http client
import { HttpClientModule } from '@angular/common/http';
// infinite scroll
import { InfiniteScrollModule } from "ngx-infinite-scroll";

import { FormsModule, ReactiveFormsModule } from '@angular/forms';

import { TourListComponent } from './tour-list.component';
import { ItemsComponent } from './items/items.component';
import { SidebarComponent } from './sidebar/sidebar.component';
import { BottomSheetComponent } from './bottom-sheet/bottom-sheet.component';
import { SnackbarComponent } from './items/snackbar/snackbar.component';
import { SortingComponent } from './sorting/sorting.component';



@NgModule({
  imports: [
    CommonModule,
    TourListRoutingModule,
    FormsModule,ReactiveFormsModule,  
    MatIconModule, MatButtonModule, MatFormFieldModule, MatInputModule, MatCardModule, MatDatepickerModule, MatNativeDateModule, MatSidenavModule, MatSelectModule, MatProgressSpinnerModule, MatBottomSheetModule, MatSnackBarModule, MatAutocompleteModule,
    FlexLayoutModule,
    HttpClientModule,
    InfiniteScrollModule
  ],
  declarations: [    
    TourListComponent,
    ItemsComponent,
    SidebarComponent,
    BottomSheetComponent,
    SnackbarComponent,
    SortingComponent
    ],
  entryComponents: [
    BottomSheetComponent,
    SnackbarComponent
  ]
})
export class TourListModule { }
