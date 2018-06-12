<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class WorkplaceActivity extends Model
{    
    public $timestamps = false;
    protected $table = 'workplace_activities';

    public function author() {
        return $this->belongsTo("App\\User", "author", "id");
    }

    public function activity() {
        return $this->belongsTo("App\\Models\\Activity", "activities_id", "id");
    }

    public function workplace() {
        return $this->belongsTo("App\\Models\\Workplace", "workplaces_id", "id");
    }
}
