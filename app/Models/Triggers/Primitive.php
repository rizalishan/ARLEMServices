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

    public function toXML()
    {
        $type = $this->type()->first();
        $author = $this->author()->first();
        $xml = new \SimpleXMLElement('<primitive/>');
        $xml->addAttribute('id',$this->id);
        $xml->addAttribute('type',$type->name);
        if($this->size > 0){
            $xml->addAttribute('size',$this->size);
        }
        if($this->url != '' && $this->url != null){
            $xml->addAttribute('url',$this->url);
        }
        if($this->option != '' && $this->option != null) {
            $xml->addAttribute('option', $this->option);
        }
        return str_replace('<?xml version="1.0"?>','',$xml->asXML());
    }
}
