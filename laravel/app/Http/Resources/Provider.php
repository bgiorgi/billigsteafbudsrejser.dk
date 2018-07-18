<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\Resource;

class Provider extends Resource
{
    /**
     * Transform the resource into an array.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return array
     */
    public function toArray($request)
    {
        return [
            'id' => $this->id,
            'name' => $this->name,
            'code' => $this->code,
            'logo' => getenv('APP_URL').'/storage/'.$this->logo,
            'price_type' => $this->price_type
        ];
    }
}
