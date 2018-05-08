<?php

namespace App\Models\Triggers;

use Illuminate\Database\Eloquent\Model;

class WarningPrimitive extends Model
{
    public $timestamps = false;
    protected $table = 'warning_primitives';

    public function warning() {
        return $this->belongsTo("App\\Models\\Triggers\\Warning", "warning", "id");
    }

    public function primitive() {
        return $this->belongsTo("App\\Models\\Triggers\\Primitive", "primitive", "id");
    }
}
