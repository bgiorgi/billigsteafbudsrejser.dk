<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use \App\Tour;
use \App\Provider;
use \App\Variation;



            
            
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
            Variation::where('provider_id',$provider->id)->delete();
            
            // TEMP
            $i=0;
            
            // insert tours
            foreach($apiArray['products'] as $apiTour) {
                // TEMP
                $i++;
                //if($i==20) die('demo abort');
                
                $tour = new Tour;
                $tour->provider_id = $provider->id;
                $tour->name = $apiTour['name'];
                $tour->price = $apiTour['price']['amount'];
                $tour->currency = $apiTour['price']['currency'];
                $tour->url = $apiTour['URL'];
                $tour->image_url = $apiTour['images'][0];
                $tour->country = isset($apiTour['properties']['country'][0]) ? $apiTour['properties']['country'][0] : null;
                $tour->city = $apiTour['properties']['city'][0];
                $tour->service_type = $apiTour['properties']['serviceType'][0];
                $tour->stars = isset($apiTour['properties']['stars'][0]) ? $apiTour['properties']['stars'][0] : null;
                $tour->save();
                
                // insert tour variations
                foreach($apiTour['variations'] as $apiVariation) {
                    $variation = new Variation;
                    $variation->tour_id = $tour->id;
                    $variation->provider_id = $provider->id;
                    $variation->departure_date = $apiVariation['departureDate'][0];
                    $variation->duration = $apiVariation['duration'][0];
                    $variation->departure_price = $apiVariation['departurePrice'][0];
                    $variation->number_of_persons = $apiVariation['numberOfPersons'][0];
                    $variation->transport_type = $apiVariation['transportType'][0];
                    $variation->save();
                }
            }
    }
}
