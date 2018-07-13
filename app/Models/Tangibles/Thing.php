<?php

namespace App\Models\Tangibles;

use Illuminate\Database\Eloquent\Model;

class Thing extends Model
{
    public $timestamps = false;
    protected $table = 'things';

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */

    public function author()
    {
        return $this->belongsTo("App\\User", "author", "id");
    }

    public function detectable()
    {
        return $this->belongsTo("App\\Models\\Triggers\\Detectable", "detectable", "id");
    }

    public function poi()
    {
        return $this->hasMany("App\\Models\\Tangibles\\POI", "thing", "id");
    }

    public static function create($author, $input)
    {
        $objThing = new Thing;

        $objThing->name = $input['name'];
        $objThing->id_name = $input['id_name'];
        $objThing->detectable = $input['detectable'];
        $objThing->urn = $input['urn'];
        $objThing->author = $author;

        $objThing->save();

        if (count($input['poi']) > 0) {
            foreach ($input['poi'] as $poi) {
                $objPOI = new POI;
                $objPOI->thing = $objThing->id;
                $objPOI->name = isset($poi["name"]) ? $poi["name"] : '';
                $objPOI->x = $poi["x"];
                $objPOI->y = $poi["y"];
                $objPOI->z = $poi["z"];
                $objPOI->relativeTo = isset($poi["relativeTo"]) ? $poi["relativeTo"] : '';
                $objPOI->save();
            }
        }
        return Thing::where("id",$objThing->id)->with("poi")->get()->first();
    }

    public function toXML($xml)
    {
        $ele = $xml->addChild('place');
        $ele->addAttribute('id', $this->id);
        $ele->addAttribute('name', $this->name);
        $ele->addAttribute('urn', $this->urn);
        $ele->addAttribute('detectable', $this->detectable);

        if ($this->poi->count() > 0) {
            $pois = $ele->addChild('pois');
            foreach ($this->poi as $poi) {
                $tmp = $pois->addChild('poi');
                $tmp->addAttribute('id', $poi->id);
                $tmp->addAttribute('x-offset', $poi->x);
                $tmp->addAttribute('y-offset', $poi->y);
                $tmp->addAttribute('z-offset', $poi->z);
            }
        }

        $this->detectable()->first()->toXML($ele);
        $this->author()->first()->toXML($ele);
    }

    public function toJSONP($id)
    {
        return $this::where("id", $id)->with(["detectable", "detectable.sensor", "detectable.sensor.author", "detectable.author", "author", "poi"])->first()->toArray();
    }

}