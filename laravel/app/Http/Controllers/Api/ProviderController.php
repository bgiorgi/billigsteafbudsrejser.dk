<?php

namespace App\Http\Controllers\Api;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Provider;
use App\Http\Resources\Provider as ProviderResource;

class ProviderController extends Controller
{
    public static function All() {
                return ProviderResource::collection(Provider::all());
    }
}