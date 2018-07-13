<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class ActionTriggerMode extends Model
{
    public $timestamps = false;
    protected $table = 'action_trigger_modes';

    public function toXML($xml)
    {
        $typeElement = $xml->addChild('mode');
        $typeElement->addAttribute('id', $this->id);
        $typeElement->addAttribute('name', $this->name);
    }
}
