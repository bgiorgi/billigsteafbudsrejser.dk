import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';


import { HomeComponent } from './home/home.component';
import { StaticPageComponent } from './static-page/static-page.component';



const routes: Routes = [
  { path: '', component: HomeComponent },
  { path: 'tour-list', loadChildren: './tour-list/tour-list.module#TourListModule' },
  { path: ':slug', component: StaticPageComponent }
  ];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
