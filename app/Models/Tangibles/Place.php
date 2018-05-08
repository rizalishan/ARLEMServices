<?php

namespace App\Models\Tangibles;

use Illuminate\Database\Eloquent\Model;

class Place extends Model
{
    public $timestamps = false;
    protected $table = 'places';

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */

    public function author() {
        return $this->belongsTo("App\\User", "author", "id");
    }

    public function detectable() {
        return $this->belongsTo("App\\Models\\Detectable", "detectable", "id");
    }

    public static function create($author, $input) {
        $objPlace = new Place;

        $objPlace->name = $input['name'];
        $objPlace->id_name = $input['id_name'];
        $objPlace->detectable = $input['detectable'];
        $objPlace->author = $author;

        $objPlace->save();
        return $objPlace;

    }

    public function toXML()
    {
        $xml = new \SimpleXMLElement('<place/>');
        $xml->addAttribute('id',$this->id);
        $xml->addAttribute('name',$this->name);
        $xml->addAttribute('type',$this->id_name);
        $xml->addAttribute('detectable',$this->detectable);
        return str_replace('<?xml version="1.0"?>','',$xml->asXML());
    }
}
