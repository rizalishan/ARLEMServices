<?php

/*
|--------------------------------------------------------------------------
| Application Routes
|--------------------------------------------------------------------------
|
| Here is where you can register all of the routes for an application.
| It is a breeze. Simply tell Lumen the URIs it should respond to
| and give it the Closure to call when that URI is requested.
|
*/

$router->get('/', function () use ($router) {
    return $router->app->version();
});

Route::patch("/signin", "AuthController@patchSignIn");
Route::post("/signup", "AuthController@postSignUp");
Route::post("/forget", "AuthController@postForgot");
Route::patch("/change/{code}", "AuthController@patchChange");

Route::group(["middleware" => ["auth"]], function () {
    Route::get("/logout", "AuthController@getLogout");
    /* Member Routes */
    Route::get("/dashboard", "MemberController@getDashboard");
    /* Workplace Routes */
    Route::get("/workplaces", "WorkplaceController@getList");
    Route::get("/workplace/{id}", "WorkplaceController@getDetail");
    Route::post("/workplace", "WorkplaceController@postCreate");
    Route::put("/workplace/{id}", "WorkplaceController@putEdit");
    Route::delete("/workplace/{id}", "WorkplaceController@deleteRemove");

    Route::get("/tangibles", "TangibleController@getList");
    Route::post("/tangible/person/create", "TangibleController@postCreatePerson");
    Route::post("/tangible/place/create", "TangibleController@postCreatePlace");
    Route::post("/tangible/thing/create", "TangibleController@postCreateThing");

    Route::get("/configurables", "ConfigurableController@getList");
    Route::post("/configurable/app/create", "ConfigurableController@postCreateApp");
    Route::post("/configurable/device/create", "ConfigurableController@postCreateDevice");

    Route::get("/configurable/device/types", "ConfigurableController@getDeviceTypeList");

    Route::get("/triggers", "TriggerController@getList");

    Route::get("/sensors", "SensorController@getList");


});
Route::get("/workplace/generate/{id}", "WorkplaceController@getGenerate");
Route::get("/activity/generate/{id}", "ActivityController@getGenerate");

Route::options('/{any:.*}', function (){
    return response('');
});
