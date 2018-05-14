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

        $objSensor->name = $input['name'];
        $objSensor->uri = $input['uri'];
        $objSensor->username = $input['username'];
        $objSensor->password = $input['password'];
        $objSensor->author = $author;

        $objSensor->save();
        return $objSensor;

    }
}
