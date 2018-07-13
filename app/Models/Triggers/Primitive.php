<?php

namespace App\Models\Triggers;

use Illuminate\Database\Eloquent\Model;

class Primitive extends Model
{
    public $timestamps = false;
    protected $table = 'primitives';

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */

    public function author() {
        return $this->belongsTo("App\\User", "author", "id");
    }

    public function type() {
        return $this->belongsTo("App\\Models\\Triggers\\PrimitiveType", "type", "id");
    }

    public function toXML($xml)
    {

        $ele = $xml->addChild('primitive');
        $ele->addAttribute('id',$this->id);
        if($this->size > 0){
            $ele->addAttribute('size',$this->size);
        }
        if($this->url != '' && $this->url != null){
            $ele->addAttribute('url',$this->url);
        }
        if($this->option != '' && $this->option != null) {
            $ele->addAttribute('option', $this->option);
        }
        $this->type()->first()->toXML($ele);
        $this->author()->first()->toXML($ele);
    }



    public function toJSONP($id)
    {
        return $this::where("id", $id)->with(["type", "author"])->first()->toArray();
    }
}
