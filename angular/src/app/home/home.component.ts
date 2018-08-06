import { Component, OnInit } from '@angular/core';
import {Router} from '@angular/router';
import { SearchFormService } from '../shared/services/search-form.service';
import {FormGroup,FormBuilder } from '@angular/forms';
import { HomeService } from './home.service';


@Component({
  selector: 'app-home',
  templateUrl: './home.component.html',
  styleUrls: ['./home.component.scss']
})
export class HomeComponent implements OnInit {

  searchForm:FormGroup;
  searching = false; 
  mainpageData:any;
  staticPages:any;
  
  
  constructor(private router: Router, private fb:FormBuilder,private searchFormService:SearchFormService,private homeService: HomeService) {}

  ngOnInit() {
    this.createForm();
    this.getMainpageData();
    this.getStaticPages();
  }


  goSearch(values) {
    this.searchFormService.changeCurrentParams(values);
    this.router.navigate(['/tour-list']);
  }
  
  
  createForm() {
    this.searchForm = this.fb.group({
      departure_airports: [['Billund','Aalborg','Aarhus']],
      departure_date: '',
      flexible_departure: '21'
    });
  }
  
  
  getMainpageData() {
    this.homeService.getMainpageData().subscribe((data:any) => this.mainpageData = data.data);
  }
  
  getStaticPages() {    
    this.homeService.getStaticPages().subscribe((data:any) => this.staticPages = data.data);
  }
  
    
}
