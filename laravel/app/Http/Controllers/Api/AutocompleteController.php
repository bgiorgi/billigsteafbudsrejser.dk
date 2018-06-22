<?php

namespace App\Http\Controllers\Api;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;


use App\Tour;


class AutocompleteController extends Controller
{
    public static function Destinations() {
        $data = array();
        $destinations = Tour::select('city','country')->distinct('city')->get();
        // we need to asign add keys to cities and even keys to the countries, to show both options in autocomplete
        //cities
        $addKey = 0;
        foreach($destinations as $destination) {
            $value = $destination->city;
            $displayValue = $destination->city.', '.$destination->country;
            $data[$addKey] = array('value'=>$value,'displayValue'=>$displayValue);
            $addKey++;
        }

        // countries
                $evenKey = 1;
        $destinations = Tour::select('country')->distinct('country')->get();
        foreach($destinations as $destination) {
            $value = $destination->country;
            $displayValue = $destination->country;
            $data[$evenKey] = array('value'=>$value,'displayValue'=>$displayValue);
            $evenKey++;
        }
        
                echo json_encode($data);
        
    }
}
