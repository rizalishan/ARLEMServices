<?php

namespace App\Http\Controllers;

use App\Models\Sensor;
use Illuminate\Http\Request;

class SensorController extends Controller
{
    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        //
    }

    public function getList(Request $request)
    {
        $data = Sensor::with(["author"])->orderBy('created_at','desc')->paginate(env('PAGE_SIZE'));
        return $this->success($data, 200);
    }

    public function getDetail($id)
    {
        $data = Sensor::findOrFail($id);
        return $this->success($data, 200);
    }
}
