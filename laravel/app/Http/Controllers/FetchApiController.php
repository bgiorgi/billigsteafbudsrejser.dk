<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use \App\Tour;
use \App\Provider;



            
            
class FetchApiController extends Controller
{
    public static function Index(Request $request) {
            // provider list
            $apiList = [
                'SUNWEB'=>'http://pf.tradetracker.net/?aid=304736&encoding=utf-8&type=json&fid=919799&categoryType=2&additionalType=2', // sunweb.dk
                'ELIZAGENERAL'=>'http://pf.tradetracker.net/?aid=304736&encoding=utf-8&type=json&fid=842636&categoryType=2&additionalType=2', // elizawashere.dk general
                'ELIZAOFFER'=>'http://pf.tradetracker.net/?aid=304736&encoding=utf-8&type=json&fid=842636&categoryType=2&additionalType=2', // elizawashere.dk offer
                'TRAVELBIRD'=>'http://pf.tradetracker.net/?aid=304736&encoding=utf-8&type=json&fid=1041339&categoryType=2&additionalType=2', // travelbird.dk
                'PRIMOTOURS'=>'http://pf.tradetracker.net/?aid=304736&encoding=utf-8&type=json&fid=1329114&categoryType=2&additionalType=2', // primotours.dk
                'AARHUSCHARTER'=>'http://pf.tradetracker.net/?aid=304736&encoding=utf-8&type=json&fid=1329103&categoryType=2&additionalType=2', // aarhuscharter.dk
                'SUNCHARTER'=>'http://pf.tradetracker.net/?aid=304736&encoding=utf-8&type=json&fid=1326662&categoryType=2&additionalType=2' // suncharter.dk
            ];
            $code = $request->code;
            $apiUrl = $apiList[$code];
            $apiContent = file_get_contents($apiUrl);
            $apiArray = json_decode($apiContent,1);
            
            // get current provider id
            $provider = Provider::where('code',$code)->first();
            // delete existed tours in database, by current provider
            Tour::where('provider_id',$provider->id)->delete();
            
            // TEMP
            $i=0;
            

            // insert tours
            foreach($apiArray['products'] as $apiTour) {
                if(@$apiTour['properties']['accommodationType']==['Fly t/r']) continue;
                
                // TEMP
                $i++;
                //if($i==20) die('demo abort');
                
                
                            
                // sunweb
                if($code=="SUNWEB") {
                    
                    
                    $tour = new Tour;
                    $tour->provider_id = $provider->id;
                    $tour->name = $apiTour['name'];
                    $tour->price = $apiTour['price']['amount'];
                    $tour->currency = $apiTour['price']['currency'];
                    $tour->url = $apiTour['URL'];
                    $tour->image_url = $apiTour['images'][0];
                    $tour->country = $apiTour['properties']['country'][0];
                    $tour->city = $apiTour['properties']['city'][0];
                    $tour->stars = isset($apiTour['properties']['stars'][0]) ? $apiTour['properties']['stars'][0] : null;
    
                    
                    // insert tour variations
                        foreach($apiTour['variations'] as $apiVariation) {
                            $tour->departure_date = $apiVariation['departureDate'][0];
                            $tour->duration = $apiVariation['duration'][0];
                            $tour->number_of_persons = $apiVariation['numberOfPersons'][0];
                        }
                    $tour->save();                    
                }
                elseif($code=="TRAVELBIRD") {
                    $tour = new Tour;
                    $tour->provider_id = $provider->id;
                    $tour->name = $apiTour['name'];
                    $tour->price = $apiTour['price']['amount'];
                    $tour->currency = $apiTour['price']['currency'];
                    $tour->url = $apiTour['URL'];
                    $tour->image_url = $apiTour['images'][0];
                    $tour->country = $apiTour['properties']['country'][0];
                    $tour->city = $apiTour['properties']['city'][0];
                    $tour->duration = $apiTour['properties']['numberOfDays'][0];
                    $tour->save();
                }
                elseif($code=="PRIMOTOURS") {
                    $tour = new Tour;
                    $tour->provider_id = $provider->id;
                    $tour->name = $apiTour['name'];
                    $tour->price = $apiTour['price']['amount'];
                    $tour->currency = $apiTour['price']['currency'];
                    $tour->url = $apiTour['URL'];
                    $tour->image_url = $apiTour['images'][0];
                    $tour->country = $apiTour['properties']['arrivalCountry'][0];
                    $tour->city = $apiTour['properties']['arrivalAirport'][0];
                    $tour->duration = $apiTour['properties']['duration'][0];
                    $tour->stars = $apiTour['properties']['stars'][0];
                    $tour->departure_date = $apiTour['properties']['departureDate'][0];
                    $tour->departure_airport = $apiTour['properties']['departureAirport'][0];
                    $tour->save();
                }    
                elseif($code=="AARHUSCHARTER") {
                    $tour = new Tour;
                    $tour->provider_id = $provider->id;
                    $tour->name = $apiTour['name'];
                    $tour->price = $apiTour['price']['amount'];
                    $tour->currency = $apiTour['price']['currency'];
                    $tour->url = $apiTour['URL'];
                    $tour->image_url = $apiTour['images'][0];
                    $tour->country = $apiTour['properties']['arrivaleCountry'][0];
                    $tour->city = $apiTour['properties']['arrivalAirport'][0];
                    $tour->duration = $apiTour['properties']['duration'][0];
                    $tour->stars = $apiTour['properties']['stars'][0];
                    $tour->departure_date = $apiTour['properties']['departureDate'][0];
                    $tour->departure_airport = $apiTour['properties']['departureAirport'][0];                    
                    $tour->save();
                }    
                elseif($code=="SUNCHARTER") {
                    $tour = new Tour;
                    $tour->provider_id = $provider->id;
                    $tour->name = $apiTour['name'];
                    $tour->price = $apiTour['price']['amount'];
                    $tour->currency = $apiTour['price']['currency'];
                    $tour->url = $apiTour['URL'];
                    $tour->image_url = $apiTour['images'][0];
                    $tour->country = $apiTour['properties']['arrivaleCountry'][0];
                    $tour->city = $apiTour['properties']['arrivalAirport'][0];
                    $tour->duration = $apiTour['properties']['duration'][0];
                    $tour->stars = $apiTour['properties']['stars'][0];
                    $tour->departure_date = $apiTour['properties']['departureDate'][0];
                    $tour->departure_airport = $apiTour['properties']['departureAirport'][0];                    
                    $tour->save();
                }                    
            }


        echo "Tours are fetched successfully";
    }
}
