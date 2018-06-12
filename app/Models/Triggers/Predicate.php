<?php

namespace App\Models\Triggers;

use Illuminate\Database\Eloquent\Model;

class Predicate extends Model
{
    public $timestamps = false;
    protected $table = 'predicates';

    public function author() {
        return $this->belongsTo("App\\User", "author", "id");
    }

    public function primitives()
    {
        return $this->hasMany("App\\Models\\Triggers\\PredicatePrimitive", "predicate", "id");
    }

    public function toXML()
    {
        /*$xml = '';
        if ($this->primitives->count() > 0) {
            foreach ($this->primitives as $primitive) {
                $xml .= $primitive->primitive()->first()->toXML();
            }
        }
        if ($xml != '') {
            $xml = '<predicates>' . $xml . '</predicates>';
            $xml = new \SimpleXMLElement($xml);
            return str_replace('<?xml version="1.0"?>', '', $xml->asXML());
        }*/
    }

    public function toJSONP($id)
    {
        return $this::where("id", $id)->with(["primitives", "primitives.primitive", "primitives.primitive.author", "author"])->first()->toArray();
    }
}
