<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Tour extends Model
{
    public function provider()
    {
        return $this->belongsTo('App\Provider');
    }
    
    public function variations()
    {
        return $this->hasMany('App\Variation');
    }    
}
