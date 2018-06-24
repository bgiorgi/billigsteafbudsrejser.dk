<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class RedirectTourController extends Controller
{
    public static function Redirect($tour_id) {
        // update tour view_count
        $tour = \App\Tour::find($tour_id);
        $tour->view_count++;
        $tour->save();
        
        // update destination view_count
        $destination = \App\Destination::firstOrNew(['city'=>$tour->city,'country'=>$tour->country]);
        $destination->view_count++;
        $destination->save();
        
        
        return view('tourRedirect',['redirectUrl'=>$tour->url]);
        
        
    }
}
