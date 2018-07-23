import { Component, OnInit } from '@angular/core';
import {Router} from '@angular/router';
import {FormGroup,FormBuilder } from '@angular/forms';
import { SearchFormService } from '../shared/services/search-form.service';

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
    this.searchFormService.currentParams.subscribe(test => { console.log('home currentParams'); console.log(test)}).unsubscribe();
  }


  onSubmit() {
    this.searching = true;
    let values = this.searchForm.value;
    console.log('home values');
    console.log(values);
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
