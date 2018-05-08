<?php

namespace App\Models\Triggers;

use Illuminate\Database\Eloquent\Model;

class Detectable extends Model
{
    public $timestamps = false;
    protected $table = 'detectables';

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */

    public function author() {
        return $this->belongsTo("App\\User", "author", "id");
    }

    public function sensor() {
        return $this->belongsTo("App\\Models\\Sensor", "sensor", "id");
    }

    public function toXML()
    {
        $sensor = $this->sensor()->first();
        $author = $this->author()->first();
        $xml = new \SimpleXMLElement('<detectable/>');
        $xml->addAttribute('id',$this->id);
        $xml->addAttribute('sensor',$sensor->name);
        $xml->addAttribute('type',$this->type);
        $xml->addAttribute('url',$this->url);
        return str_replace('<?xml version="1.0"?>','',$xml->asXML());
    }
}
