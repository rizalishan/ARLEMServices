<?php

namespace App\Models\Configurables;

use Illuminate\Database\Eloquent\Model;

class DeviceType extends Model
{
    public $timestamps = false;
    protected $table = 'device_types';

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */

    public function toXML($xml)
    {
        $typeElement = $xml->addChild('type');
        $typeElement->addAttribute('id', $this->id);
        $typeElement->addAttribute('name', $this->name);
    }
}
