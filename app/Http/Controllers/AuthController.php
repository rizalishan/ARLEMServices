<?php

namespace App\Http\Controllers;

use App\User;
use App\Http\Mail\Register;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Mail;
use Illuminate\Support\Facades\Crypt;
use Illuminate\Support\Facades\Validator;

class AuthController extends Controller
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

    public function patchSignIn(Request $request)
    {
        try {
            $validation = Validator::make($request->all(), [
                "email" => "required|email",
                "password" => "required"
            ]);
            if ($validation->fails()) {
                return $this->error($validation->errors(), 401);
            }

            $objUser = User::where("email", $request->json()->get("email"))->get();
            if ($objUser->count() > 0) {
                $objUser = $objUser->first();
                if (app()->make('hash')->check($request->json()->get("password"), $objUser->password)) {
                    $objUser->api_token = str_random(35);
                    $objUser->save();
                    return $this->success($objUser->toArray(), 200);
                }
            }
            return $this->error(["Invalid credentails. Please try again."], 401);
        } catch (Exception $e) {
            $this->error($e.getMessage(), 500);
        }
    }

    public function postSignUp(Request $request)
    {
        try {
            $validation = Validator::make($request->all(), [
                "name" => "required",
                "email" => "required|email|unique:authors",
                "password" => "required"
            ]);
            if ($validation->fails()) {
                return $this->error($validation->errors(), 401);
            }

            $objUser = new User;
            $objUser->name = $request->json()->get("name");
            $objUser->email = $request->json()->get("email");
            $objUser->password = app()->make('hash')->make($request->json()->get("password"));
            $objUser->save();
            //Mail::to("rizalishan@gmail.com")->send(new Register(Crypt::encrypt($request->json()->get("email"))));
            return $this->success(["message" => "Welcome to ARLEM Panel. Please signin"], 200);
        } catch (Exception $e) {
            $this->error([trans("unexpected_error")], 500);
        }
    }

    public function postForgot(Request $request)
    {
        try {
            $validation = Validator::make($request->all(), [
                "email" => "required|email"
            ]);
            if ($validation->fails()) {
                return $this->error($validation->errors(), 401);
            }

            $objUser = User::where("email", $request->json()->get("email"))->get();
            if ($objUser->count() > 0) {
                //Mail::to("rizalishan@gmail.com")->send(new Register(Crypt::encrypt($request->json()->get("email"))));
                return $this->success(["message" => "An email has been sent your email address with further instructions."], 200);
            }
            return $this->error(["Account does not exists, please try again."], 401);
        } catch (Exception $e) {
            $this->error([trans("unexpected_error")], 500);
        }
    }

    public function patchChange($code, Request $request)
    {
        try {
            $validation = Validator::make($request->all(), [
                "password" => "required",
                "repassword" => "required"
            ]);
            if ($validation->fails()) {
                return $this->error($validation->errors(), 401);
            }

            $objUser = User::where("email", Crypt::decrypt($code))->get();
            if ($objUser->count() > 0) {

                $objUser = $objUser->first();
                $objUser->password = app()->make('hash')->make($request->json()->get("password"));
                $objUser->save();

                return $this->success(["message" => "Password has been updated, try login now."], 200);
            }
            return $this->error(["Either code is invalid or expired, please try again."], 401);
        } catch (Exception $e) {
            $this->error([trans("unexpected_error")], 500);
        }
    }
}
