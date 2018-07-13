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
        return $this->belongsTo("App\\Models\\Triggers\\Detectable", "detectable", "id");
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

    public function toXML($xml)
    {
        $ele = $xml->addChild('place');
        $ele->addAttribute('id',$this->id);
        $ele->addAttribute('name',$this->name);
        $ele->addAttribute('type',$this->id_name);
        $ele->addAttribute('detectable',$this->detectable);
        $this->detectable()->first()->toXML($ele);
        $this->author()->first()->toXML($ele);
    }

    public function toJSONP($id)
    {
        return $this::where("id", $id)->with(["detectable", "detectable.sensor", "detectable.sensor.author", "detectable.author", "author"])->first()->toArray();
    }

}
