<?php

namespace App\Models\Triggers;

use Illuminate\Database\Eloquent\Model;

class PrimitiveType extends Model
{
    public $timestamps = false;
    protected $table = 'primitive_types';

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
