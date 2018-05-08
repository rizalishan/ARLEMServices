<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Tangibles\POI;
use App\Models\Tangibles\Thing;
use App\Models\Tangibles\Place;
use App\Models\Tangibles\Person;
use App\Models\Tangibles\Tangible;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Validator;

class TangibleController extends Controller
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
        $data = Tangible::with(["author"])->orderBy('created', 'desc')->paginate(env('PAGE_SIZE'));
        return $this->success($data, 200);
    }

    public function getDetail($id)
    {
        $data = Tangible::findOrFail($id);
        return $this->success($data, 200);
    }

    public function postCreatePerson(Request $request)
    {
        try {
            $this->validate($request, [
                "name" => "required",
                "persona" => "required",
                "detectable" => "required"
            ]);

            return $this->success([
                "message" => "Successfully created the person.",
                "object" => Person::create(Auth::id(), $request->json()->all())
            ], 200);

        } catch (Exception $e) {
            $this->error(trans("unexpected_error"), 500);
        }
    }

    public function postCreatePlace(Request $request)
    {
        try {
            $this->validate($request, [
                "id_name" => "required",
                "name" => "required",
                "detectable" => "required"
            ]);

            return $this->success([
                "message" => "Successfully created the place.",
                "object" => Place::create(Auth::id(), $request->json()->all())
            ], 200);

        } catch (Exception $e) {
            $this->error(trans("unexpected_error"), 500);
        }
    }

    public function postCreateThing(Request $request)
    {
        try {
            $this->validate($request, [
                "id_name" => "required",
                "name" => "required",
                "urn" => "required",
                "detectable" => "required"
            ]);

            return $this->success([
                "message" => "Successfully created the thing.",
                "object" => Thing::create(Auth::id(), $request->json()->all())
            ], 200);

        } catch (Exception $e) {
            $this->error(trans("unexpected_error"), 500);
        }
    }
}
