<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Entity extends Model
{
    public $timestamps = false;
    protected $table = 'entities';


    public function toXML()
    {

        $xml = '<activity id="' . $this->id . '" name="' . $this->name . '" language="' . $this->language . '" workplace="http://localhost:8080/workplace/generate/' . $this->workplace . '" start="' . $this->start . '">';

        $items = [];

        foreach ($this->actions as $action) {
            $xml .= $action->toXML();
        }

        if ($this->instructions != null){
            $xml .= $this->instructions->toXML();
        }

        $xml .= "</activity>";

        Header('Content-type: text/xml');
        $xml = new \SimpleXMLElement($xml);
        //dd($workplaceXML);
        print($xml->asXML());

    }
}