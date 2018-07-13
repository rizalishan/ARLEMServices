<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Sensor extends Model
{
    public $timestamps = false;
    protected $table = 'sensors';

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'name', 'author',
    ];

    public function author() {
        return $this->belongsTo("App\\User", "author", "id");
    }

    public static function create($author, $input)
    {
        $objSensor = new Sensor;

        $objSensor->id_name = $input['name'];
        $objSensor->name = $input['name'];
        $objSensor->uri = $input['uri'];
        $objSensor->username = $input['username'];
        $objSensor->password = $input['password'];
        $objSensor->author = $author;

        $objSensor->save();
        return $objSensor;

    }

    public function toXML($xml)
    {
        $ele = $xml->addChild('sensor');
        $ele->addAttribute('id',$this->id);
        $ele->addAttribute('id_name',$this->id_name);
        $ele->addAttribute('name',$this->name);
        $ele->addAttribute('uri',$this->uri);

        if($this->username != '' && $this->username != null){
            $ele->addAttribute('username',$this->username);
        }
        if($this->password != '' && $this->password != null) {
            $ele->addAttribute('password', $this->password);
        }
        $this->author()->first()->toXML($ele);
    }

    public function toJSONP($id)
    {
        return $this::where("id", $id)->with(["author"])->first()->toArray();
    }
}
