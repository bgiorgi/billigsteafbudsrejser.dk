<?php

namespace App\Http\Controllers\Api;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Destination;
use App\Http\Resources\Destination as DestinationResource;

class DestinationController extends Controller
{
    public static function Popular() {
                return DestinationResource::collection(Destination::orderBy('view_count','desc')->limit(20)->get());
    }
}