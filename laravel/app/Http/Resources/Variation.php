<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\Resource;
use App\Tour;
use App\Http\Resources\Tour as TourResource;
use App\Provider;
use App\Http\Resources\Provider as ProviderResource;

class Variation extends Resource
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
            'departure_date' => $this->departure_date,
            'duration' => $this->duration,
            'departure_price' => $this->departure_price,
            'number_of_persons' => $this->number_of_persons,
            'transport_type' => $this->transport_type,
            'departure_price' => $this->departure_price,
            'tour' => new TourResource(Tour::find($this->tour_id)),
            'provider' => new ProviderResource(Provider::find($this->provider_id)),
        ];
    }
}
