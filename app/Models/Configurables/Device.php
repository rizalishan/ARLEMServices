<?php

namespace App\Models\Configurables;

use Illuminate\Database\Eloquent\Model;

class Device extends Model
{
    public $timestamps = false;
    protected $table = 'devices';

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */

    public function type()
    {
        return $this->belongsTo("App\\Models\\Configurables\\DeviceType", "type", "id");
    }


    public function author()
    {
        return $this->belongsTo("App\\User", "author", "id");
    }

    public static function create($author, $input)
    {
        $objDevice = new Device;

        $objDevice->name = $input['name'];
        $objDevice->type = $input['type'];
        $objDevice->author = $author;

        $objDevice->save();
        return $objDevice;
    }

    public function toXML()
    {
        $type = $this->type()->first();
        $author = $this->author()->first();
        $xml = new \SimpleXMLElement('<device/>');
        $xml->addAttribute('id',$this->id);
        $xml->addAttribute('type',$type->name);
        $xml->addAttribute('name',$this->name);
        $xml->addAttribute('owner',$author->name);
        return str_replace('<?xml version="1.0"?>','',$xml->asXML());
    }

    public function toJSONP($id)
    {
        return $this::where("id", $id)->with(["type", "author"])->first()->toArray();
    }
}
