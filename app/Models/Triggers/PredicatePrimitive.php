<?php

namespace App\Models\Triggers;

use Illuminate\Database\Eloquent\Model;

class PredicatePrimitive extends Model
{
    public $timestamps = false;
    protected $table = 'predicate_primitives';

    public function predicate() {
        return $this->belongsTo("App\\Models\\Triggers\\Predicate", "predicate", "id");
    }

    public function primitive() {
        return $this->belongsTo("App\\Models\\Triggers\\Primitive", "primitive", "id");
    }
}