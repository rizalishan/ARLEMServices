<?php

namespace App\Http\Controllers;

use App\Models\Triggers\Trigger;
use Illuminate\Http\Request;

class TriggerController extends Controller
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
        return $this->success(Trigger::enlist($request->all()), 200);
    }

    public function getDetail($id)
    {
        return $this->success(Trigger::findOrFail($id), 200);
    }
}
