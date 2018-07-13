<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Instruction extends Model
{
    public $timestamps = false;
    protected $table = 'instructions';

    public function author() {
        return $this->belongsTo("App\\User", "author", "id");
    }

    public function activity() {
        return $this->belongsTo("App\\Models\\Activity", "activity", "id");
    }

    public function toXML()
    {
        $typeElement = $xml->addChild('instruction');
        $typeElement->addAttribute('title', $this->title);
        $typeElement->addAttribute('description', '<![CDATA[' .$this->description. ']]>');
    }
}
