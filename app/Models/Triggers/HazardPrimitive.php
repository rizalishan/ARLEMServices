<?php

namespace App\Models\Triggers;

use Illuminate\Database\Eloquent\Model;

class HazardPrimitive extends Model
{
    public $timestamps = false;
    protected $table = 'hazard_primitives';

    public function hazard() {
        return $this->belongsTo("App\\Models\\Triggers\\Hazard", "hazard", "id");
    }

    public function primitive() {
        return $this->belongsTo("App\\Models\\Triggers\\Primitive", "primitive", "id");
    }
}