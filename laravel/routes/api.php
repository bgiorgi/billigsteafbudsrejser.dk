<?php

use Illuminate\Http\Request;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/



Route::get('search-tours', 'Api\TourController@Search');

Route::get('search-featured-tours', 'Api\TourController@FeaturedTours');


Route::get('providers', 'Api\ProviderController@All');
Route::get('popular-destinations', 'Api\DestinationController@Popular');

Route::get('autocomplete/destinations','Api\AutocompleteController@Destinations');