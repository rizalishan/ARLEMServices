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

    public function toXML($xml)
    {

        $ele = $xml->addChild('device');
        $ele->addAttribute('id',$this->id);
        $ele->addAttribute('name',$this->name);
        $ele->addAttribute('manifest',$this->manifest);
        $this->type()->first()->toXML($ele);
        $this->author()->first()->toXML($ele);

    }

    public function toJSONP($id)
    {
        return $this::where("id", $id)->with(["type", "author"])->first()->toArray();
    }
}
