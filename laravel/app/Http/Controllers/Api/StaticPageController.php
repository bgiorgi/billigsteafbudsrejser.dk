<?php

namespace App\Http\Controllers\Api;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

use App\StaticPage;
use App\Http\Resources\StaticPage as StaticPageResource;

class StaticPageController extends Controller
{
    public static function All(Request $request) {
        $staticPages = StaticPage::where('lang',$request->lang)->get();
        return StaticPageResource::collection($staticPages);
    }
    
    public static function Single(Request $request) {
        $staticPage = StaticPage::where('slug',$request->slug)->where('lang',$request->lang)->first();
        return new StaticPageResource($staticPage);
    }
    
    
}
