<?php

namespace App\Http\Controllers;

use App\Models\Action;
use App\Models\Activity;
use App\Models\Viewport;
use App\Models\ActionTriggerMode;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class ActivityController extends Controller
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
        $activities = Activity::with(["author", "workplace"])->paginate(env('PAGE_SIZE'));
        return $this->success($activities, 200);
    }

    public function getDetail($id)
    {
        $activities = Activity::findOrFail($id);
        return $this->success($activities, 200);
    }

    public function postCreate(Request $request)
    {
        try {

            return $this->success([
                "message" => "Successfully created the Workplace.",
                "object" => Activity::create(Auth::id(), $request->json()->all())
            ], 200);

        } catch (Exception $e) {
            $this->error(trans("unexpected_error"), 500);
        }
    }

    public function deleteRemove($id)
    {
        $activities = Activity::findOrFail($id)->delete();
        return $this->success("Successfully deleted the workplace.", 200);
    }

    public function getGenerate($id)
    {
        Activity::find($id)->toXML();
    }

    public function getActionSelectList()
    {
        $activities = Action::select("id", "name")->get()->all();
        return $this->success($activities, 200);
    }

    public function getViewPortSelectList()
    {
        $viewports = Viewport::select("id", "name")->get()->all();
        return $this->success($viewports, 200);
    }

    public function getTriggerModeSelectList()
    {
        $data = ActionTriggerMode::select("id", "name")->where("id", ">", 2)->get()->all();
        return $this->success($data, 200);
    }


}
