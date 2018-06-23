<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\Resource;
use App\Http\Resources\Provider as ProviderResource;
use App\Provider;

class Tour extends Resource
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
            'price' => $this->price,
            'currency' => $this->currency,
            'url' => $this->url,
            'image_url' => $this->image_url,
            'country' => $this->country,
            'city' => $this->city,
            'service_type' => $this->service_type,
            'stars' => $this->stars,
            'provider' => new ProviderResource(Provider::find($this->provider_id)),
        ];
    }
}