<?php

namespace App\Http\Controllers\Api;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

use App\Mainpage;
use App\Http\Resources\Mainpage as MainpageResource;

class MainpageController extends Controller
{
    public function Index(Request $request) {
        $mainpage = Mainpage::where('lang',$request->lang)->first();
        return new MainpageResource($mainpage);
    }
}
