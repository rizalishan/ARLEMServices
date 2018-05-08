<?php

namespace App\Models\Triggers;

use Illuminate\Database\Eloquent\Model;

class Trigger extends Model
{    
    public $timestamps = false;
    protected $table = 'triggers';

    public function author() {
        return $this->belongsTo("App\\User", "author", "id");
    }

    public static function enlist($input) {
        $objTrigger = Trigger::with(["author"])->orderBy('created','desc');

        if(isset($input["type"]) && $input["type"] != "") {
            $objTrigger->where("type",$input["type"]);
        }

        if(isset($input["all"]) && $input["all"] != "") {
            return $objTrigger->get()->all();
        }

        return $objTrigger->paginate(env('PAGE_SIZE'));
    }
}
