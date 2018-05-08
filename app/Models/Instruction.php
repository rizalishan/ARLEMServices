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
        $xml = new \SimpleXMLElement('<instruction/>');
        $xml->addChild('title',$this->title);
        $xml->addChild('description','<![CDATA[' .$this->description. ']]>');
        return str_replace('<?xml version="1.0"?>','',$xml->asXML());
    }
}
