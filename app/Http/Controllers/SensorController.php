<?php

namespace App\Http\Controllers;

use App\Models\Sensor;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

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
        $data = Sensor::with(["author"])->orderBy('created_at', 'desc')->paginate(env('PAGE_SIZE'));
        return $this->success($data, 200);
    }

    public function getDetail($id)
    {
        $data = Sensor::findOrFail($id);
        return $this->success($data, 200);
    }

    public function postCreate(Request $request)
    {
        try {
            $this->validate($request, [
                "name" => "required",
                "uri" => "required"
            ]);

            return $this->success([
                "message" => "Successfully created the place.",
                "object" => Sensor::create(Auth::id(), $request->json()->all())
            ], 200);

        } catch (Exception $e) {
            $this->error(trans("unexpected_error"), 500);
        }
    }

    public function getListSelectList()
    {
        $data = Sensor::select("id", "name")->get()->all();
        return $this->success($data, 200);
    }
}