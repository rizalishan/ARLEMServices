<?php

namespace App\Http\Controllers;

use App\Models\Entity;
use App\Models\Workplace;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class WorkplaceController extends Controller
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
        $workplaces = Workplace::with(["author"])->paginate(env('PAGE_SIZE'));
        return $this->success($workplaces, 200);
    }

    public function getSelectList(Request $request)
    {
        $workplaces = Workplace::select("id", "name")->get()->all();
        return $this->success($workplaces, 200);
    }

    public function getDetail($id)
    {
        $workplaces = Workplace::findOrFail($id);
        return $this->success($workplaces, 200);
    }

    public function postCreate(Request $request)
    {

        try {
            $this->validate($request, [
                "name" => "required",
                "category" => "required",
                "items" => "required"
            ]);

            return $this->success([
                "message" => "Successfully created the Workplace.",
                "object" => Workplace::create(Auth::id(), $request->json()->all())
            ], 200);

        } catch (Exception $e) {
            $this->error(trans("unexpected_error"), 500);
        }

        $workplaces = Workplace::findOrFail($id);
        return $this->success($workplaces, 200);
    }

    public function putEdit()
    {
        $workplaces = Workplace::findOrFail($id);
        return $this->success($workplaces, 200);
    }

    public function deleteRemove()
    {
        $workplaces = Workplace::findOrFail($id)->delete();
        return $this->success("Successfully deleted the workplace.", 200);
    }

    public function getGenerate($id)
    {
        Workplace::find($id)->toXML();
    }

    public function getEnityList(Request $request)
    {
        $entities = ["data" => ["total" => 0]];
        if($request->get("term") != ""){
            $entities = Entity::where("name", "like", $request->get("term") . "%")->paginate(env('PAGE_SIZE'));
        } else {
            $entities = Entity::paginate(env('PAGE_SIZE'));
        }
        return $this->success($entities, 200);
    }
}