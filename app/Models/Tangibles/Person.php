<?php

namespace App\Models\Tangibles;

use Illuminate\Database\Eloquent\Model;

class Person extends Model
{
    public $timestamps = false;
    protected $table = 'persons';

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

    public static function create($author, $input)
    {
        $objPerson = new Person;

        $objPerson->name = $input['name'];
        $objPerson->twitter = $input['twitter'];
        $objPerson->mbox = $input['mbox'];
        $objPerson->detectable = $input['detectable'];
        $objPerson->persona = $input['persona'];
        $objPerson->author = $author;

        $objPerson->save();
        return $objPerson;

    }

    public function toXML($xml)
    {
        $ele = $xml->addChild('person');
        $ele->addAttribute('id',$this->id);
        $ele->addAttribute('name',$this->name);
        $ele->addAttribute('twitter',$this->twitter);
        $ele->addAttribute('mbox',$this->mbox);
        $ele->addAttribute('persona',$this->persona);
        $ele->addAttribute('detectable',$this->detectable);
        $this->detectable()->first()->toXML($ele);
        $this->author()->first()->toXML($ele);
    }

    public function toJSONP($id)
    {
        return $this::where("id", $id)->with(["detectable", "detectable.sensor", "detectable.sensor.author", "detectable.author", "author"])->first()->toArray();
    }
}
