<?php

namespace App\Models\Tangibles;

use Illuminate\Database\Eloquent\Model;

class Tangible extends Model
{
    public $timestamps = false;
    protected $table = 'tangibles';

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */

    public function author() {
        return $this->belongsTo("App\\User", "author", "id");
    }

    public function detectable() {
        return $this->belongsTo("App\\Models\\Triggers\\Detectable", "detectable", "id");
    }

}
