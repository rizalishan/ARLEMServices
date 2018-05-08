<?php

namespace App\Models\Tangibles;

use Illuminate\Database\Eloquent\Model;

class POI extends Model
{
    public $timestamps = false;
    protected $table = 'pois';

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */

    public function thing() {
        return $this->belongsTo("App\\Models\\Tangibles\\Thing", "thing", "id");
    }
}
