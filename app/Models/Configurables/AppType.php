<?php

namespace App\Models\Configurables;

use Illuminate\Database\Eloquent\Model;

class AppType extends Model
{
    public $timestamps = false;
    protected $table = 'device_types';

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */

}
