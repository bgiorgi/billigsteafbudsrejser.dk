import { BrowserModule } from '@angular/platform-browser';
import { NgModule } from '@angular/core';

// routing
import { AppRoutingModule } from './app-routing.module';
// material design    
import {BrowserAnimationsModule} from '@angular/platform-browser/animations';
import {MatIconModule,MatButtonModule,MatFormFieldModule,MatInputModule,MatCardModule,MatDatepickerModule,MatNativeDateModule,MatSelectModule,MatListModule } from '@angular/material';
// material flex layout
import { FlexLayoutModule } from "@angular/flex-layout";
// http client
import { HttpClientModule } from '@angular/common/http';
// forms module
import { ReactiveFormsModule } from '@angular/forms';


import { AppComponent } from './app.component';
import { HomeComponent } from './home/home.component';
import { FeaturedToursComponent } from './home/featured-tours/featured-tours.component';
import { PopularDestinationsComponent } from './home/popular-destinations/popular-destinations.component';
import { ProvidersComponent } from './home/providers/providers.component';

@NgModule({
  declarations: [
    AppComponent,
    HomeComponent,
    FeaturedToursComponent,
    PopularDestinationsComponent,
    ProvidersComponent
  ],
  imports: [
    BrowserModule,
    AppRoutingModule,
    BrowserAnimationsModule,
    MatButtonModule, MatInputModule, MatIconModule,MatDatepickerModule,MatNativeDateModule,MatCardModule,MatSelectModule,MatListModule,
    FlexLayoutModule,
    HttpClientModule,
    ReactiveFormsModule
  ],
  providers: [],
  bootstrap: [AppComponent]
})
export class AppModule { }
