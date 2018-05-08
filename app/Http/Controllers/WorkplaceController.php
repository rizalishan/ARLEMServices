<?php

namespace App\Http\Controllers;

use App\Models\Workplace;
use Illuminate\Http\Request;

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

    public function getDetail($id)
    {
        $workplaces = Workplace::findOrFail($id);
        return $this->success($workplaces, 200);
    }

    public function getCreate()
    {
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
}
