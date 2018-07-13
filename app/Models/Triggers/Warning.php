<?php

namespace App\Models\Triggers;

use Illuminate\Database\Eloquent\Model;

class Warning extends Model
{
    public $timestamps = false;
    protected $table = 'warnings';

    public function author() {
        return $this->belongsTo("App\\User", "author", "id");
    }

    public function primitives()
    {
        return $this->hasMany("App\\Models\\Triggers\\WarningPrimitive", "warning", "id");
    }

    public function toXML($xml)
    {
        $ele = $xml->addChild('warnings');
        $ele->addAttribute('id',$this->id);
        if ($this->primitives->count() > 0) {
            foreach ($this->primitives as $primitive) {
                $primitive->primitive()->first()->toXML($ele);
            }
        }
        $this->author()->first()->toXML($ele);

    }



    public function toJSONP($id)
    {
        return $this::where("id", $id)->with(["author", "primitives.primitive", "primitives.primitive.author"])->first()->toArray();
    }
}
