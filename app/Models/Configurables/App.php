<?php

namespace App\Models\Configurables;

use Illuminate\Database\Eloquent\Model;

class App extends Model
{
    public $timestamps = false;
    protected $table = 'apps';

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */

    public function type()
    {
        return $this->belongsTo("App\\Models\\Configurables\\AppType", "type", "id");
    }

    public function author()
    {
        return $this->belongsTo("App\\User", "author", "id");
    }

    public static function create($author, $input)
    {
        $objApp = new App;

        $objApp->name = $input['name'];
        $objApp->manifest = $input['manifest'];
        $objApp->author = $author;

        $objApp->save();
        return $objApp;

    }

    public function toXML()
    {
        $type = $this->type()->first();
        $xml = new \SimpleXMLElement('<app/>');
        $xml->addAttribute('type',$type->name);
        $xml->addAttribute('id',$this->id);
        $xml->addAttribute('name',$this->name);
        $xml->addAttribute('manifest',$this->manifest);
        return str_replace('<?xml version="1.0"?>','',$xml->asXML());
    }

    public function toJSONP($id)
    {
        return $this::where("id", $id)->with(["type", "author"])->first()->toArray();
    }
}
