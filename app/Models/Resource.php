<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Resource extends Model
{
    public $timestamps = false;
    protected $table = 'resources';

    public static function typeParser($type) {
        $resourceTypes = [
            "person" => "Tangibles\Person",
            "place" => "Tangibles\Place",
            "thing" => "Tangibles\Thing",

            "predicate" => "Tangibles\Predicate",
            "warning" => "Tangibles\Warning",
            "hazard" => "Tangibles\Hazard",

            "apps" => "Configurables\App",
            "device" => "Configurables\Device",

            "sensor" => "Sensor",
        ];

        return $resourceTypes[$type];
    }

}
