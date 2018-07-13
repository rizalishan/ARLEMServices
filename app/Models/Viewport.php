<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Viewport extends Model
{
    public $timestamps = false;
    protected $table = 'viewports';


    public function toXML($xml)
    {
        $typeElement = $xml->addChild('mode');
        $typeElement->addAttribute('id', $this->id);
        $typeElement->addAttribute('name', $this->name);
    }
}
