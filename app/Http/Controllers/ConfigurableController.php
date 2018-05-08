<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Configurables\App;
use Illuminate\Support\Facades\Auth;
use App\Models\Configurables\Device;
use App\Models\Configurables\DeviceType;
use App\Models\Configurables\Configurable;

class ConfigurableController extends Controller
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
        $workplaces = Configurable::with(["author"])->orderBy("created","desc")->paginate(env('PAGE_SIZE'));
        return $this->success($workplaces, 200);
    }

    public function getDetail($id)
    {
        $workplaces = Configurable::findOrFail($id);
        return $this->success($workplaces, 200);
    }

    public function postCreateApp(Request $request)
    {
        try {
            $this->validate($request, [
                "name" => "required",
                "manifest" => "required"
            ]);

            return $this->success([
                "message" => "Successfully created the app.",
                "object" => App::create(Auth::id(), $request->json()->all())
            ], 200);

        } catch (Exception $e) {
            $this->error(trans("unexpected_error"), 500);
        }
    }

    public function postCreateDevice(Request $request)
    {
        try {
            $this->validate($request, [
                "name" => "required",
                "type" => "required"
            ]);

            return $this->success([
                "message" => "Successfully created the device.",
                "object" => Device::create(Auth::id(), $request->json()->all())
            ], 200);

        } catch (Exception $e) {
            $this->error(trans("unexpected_error"), 500);
        }
    }

    public function getDeviceTypeList(Request $request)
    {
        $deviceTypes = DeviceType::get()->all();
        return $this->success($deviceTypes, 200);
    }

}
