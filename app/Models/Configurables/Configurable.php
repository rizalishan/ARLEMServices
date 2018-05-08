<?php

namespace App\Models\Configurables;

use Illuminate\Database\Eloquent\Model;

class Configurable extends Model
{
    public $timestamps = false;
    protected $table = 'configurables';

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */

    public function author() {
        return $this->belongsTo("App\\User", "author", "id");
    }

    public function detectable() {
        return $this->belongsTo("App\\Models\\Detectable", "detectable", "id");
    }
}
