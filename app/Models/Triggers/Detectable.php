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

    public function toXML($xml)
    {
        $sensor = $this->sensor()->first();
        $ele = $xml->addChild('detectable');
        $ele->addAttribute('id',$this->id);
        if($sensor != null){
            $sensor->toXML($ele);
        }
        $ele->addAttribute('type',$this->type);
        $ele->addAttribute('url',$this->url);
        $this->author()->first()->toXML($ele);
    }

    public function toJSONP($id)
    {
        return $this::where("id", $id)->with(["author", "sensor", "sensor.author", ])->first()->toArray();
    }
}
