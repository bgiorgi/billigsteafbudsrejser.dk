<?php

namespace App\Http\Controllers\Api;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;


use App\Tour;
use App\Http\Resources\Tour as TourResource;
use App\Variation;
use App\Http\Resources\Variation as VariationResource;

class TourController extends Controller
{
    public static function Search(Request $request) {

        // departure minimum and maximum times
        $departure_date = $request->departure_date;        
        $flexible_departure = $request->flexible_departure;        
        $departure_timecode = strtotime($departure_date); 
        $departure_date_min_timecode = $departure_timecode-$flexible_departure*24*60*60;
        $departure_date_max_timecode = $departure_timecode+$flexible_departure*24*60*60;

        $departure_date_min = date('Y-m-d',$departure_date_min_timecode);
        $departure_date_max = date('Y-m-d',$departure_date_max_timecode);



        $variations = Variation::
        when($request->departure_date && $request->flexible_departure, function($query) use ($request,$departure_date_min,$departure_date_max){        
              return $query->where('departure_date', '>',$departure_date_min)->where('departure_date','<',$departure_date_max);
        })
        ->when($request->number_of_persons, function($query) use ($request){
                return $query->where('number_of_persons',$request->number_of_persons);
        })
        ->when($request->duration_min, function($query) use ($request){
               return $query->where('duration','>',$request->duration_min);
        })   
        ->when($request->duration_max, function($query) use ($request){
               return $query->where('duration','<',$request->duration_max);
        })  
        ->when($request->provider_id,function($query) use($request) {
            return $query->where('provider_id',$request->provider_id);
        }) 
        ->when(strlen($request->destination)>3,function($query) use($request) {
            return $query->whereHas('tour',function($query) use ($request) {
                $query->where('country','like',"%$request->destination%")->orWhere('city','like',"%$request->destination%");
            });
        })    
        ->when($request->price_min,function($query) use($request) {
            return $query->whereHas('tour',function($query) use ($request) {
                 $query->where('price','>',$request->price_min);
            });
        }) 
        ->when($request->price_max,function($query) use($request) {
            return $query->whereHas('tour',function($query) use ($request) {
                 $query->where('price','<',$request->price_max);
            });
        }) 
        ->when($request->order && $request->order=='price',function($query) {
            return $query->whereHas('tour',function($query)  {
                 $query->orderBy('price','asc');
            });
        }) 
        ->when($request->order && $request->order=='date',function($query)  {
            return $query->whereHas('tour',function($query)  {
                 $query->orderBy('departure_date','asc');
            });
        }) 
        ->when($request->order && $request->order=='popularity', function($query) {
            return $query->orderBy('view_count','desc');
        })  
       ->when(!$request->order, function($query) {
            return $query->orderBy('view_count','desc');
        })          
        ->paginate(30);
        
        return VariationResource::collection($variations);
        
        

    }
    
    
        public static function FeaturedTours(Request $request) {
            
            
            // popular tours
            if($request->tourType=="popular")  {
                return VariationResource::collection(Variation::orderBy('view_count','desc')->groupBy('tour_id')->limit(4)->get());
            }
            
            
            
            // cheapest tours
            elseif($request->tourType=="cheapest")  {
                return VariationResource::collection(Variation::whereHas('tour',function($query) {
                    $query->orderBy('price','asc');
                })->groupBy('tour_id')->limit(4)->get());
            }
            
            
            
            // closest tours
            elseif($request->tourType=="closest") {
                return VariationResource::collection(Variation::orderBy('departure_date','asc')->distinct('tour_id')->groupBy('tour_id')->limit(4)->get());
            }
            
            
        }
        
}
