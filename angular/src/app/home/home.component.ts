import { Component, OnInit } from '@angular/core';
import {Router} from '@angular/router';
import { SearchFormService } from '../shared/services/search-form.service';
import {FormGroup,FormBuilder } from '@angular/forms';


@Component({
  selector: 'app-home',
  templateUrl: './home.component.html',
  styleUrls: ['./home.component.scss']
})
export class HomeComponent implements OnInit {

  searchForm:FormGroup;
  searching = false; 
  
  
  constructor(private router: Router, private fb:FormBuilder,private searchFormService:SearchFormService) { }

  ngOnInit() {
    this.createForm();
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
  
    
}
