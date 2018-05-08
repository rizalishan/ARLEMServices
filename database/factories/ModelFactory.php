<?php

/*
|--------------------------------------------------------------------------
| Model Factories
|--------------------------------------------------------------------------
|
| Here you may define all of your model factories. Model factories give
| you a convenient way to create models for testing and seeding your
| database. Just tell the factory how a default model should look.
|
*/

$factory->define(App\User::class, function (Faker\Generator $faker) {
    return [
        'name' => $faker->name,
        'email' => $faker->email,
        'password' => app('hash')->make('yourpassword'),
        'created_at' => $faker->dateTime($max = 'now')
    ];
});

$factory->define(App\Models\Workplace::class, function (Faker\Generator $faker) {
    return [
        'name' => $faker->name,
        'author' => mt_rand(1,2),
        'created_at' => $faker->dateTime($max = 'now'),
        'modified_at' => $faker->dateTime($max = 'now')
    ];
});

$factory->define(App\Models\Tangibles\Person::class, function (Faker\Generator $faker) {
    return [
        'name' => $faker->name,
        'author' => mt_rand(1,2),
        'twitter' => $faker->userName,
        'mbox' => $faker->email,
        'detectable' => mt_rand(1,10),
        'persona' => 'persona/'.$faker->slug,
        'created_at' => $faker->dateTime($max = 'now'),
        'modified_at' => $faker->dateTime($max = 'now')
    ];
});

$factory->define(App\Models\Tangibles\Place::class, function (Faker\Generator $faker) {
    return [
        'name' => $faker->name,
        'author' => mt_rand(1,2),
        'id_name' => $faker->userName,
        'detectable' => mt_rand(1,10),
        'created_at' => $faker->dateTime($max = 'now'),
        'modified_at' => $faker->dateTime($max = 'now')
    ];
});

$factory->define(App\Models\Tangibles\Thing::class, function (Faker\Generator $faker) {
    return [
        'name' => $faker->name,
        'author' => mt_rand(1,2),
        'id_name' => $faker->userName,
        'detectable' => mt_rand(1,10),
        'urn' => 'thing/'.$faker->slug,
        'created_at' => $faker->dateTime($max = 'now'),
        'modified_at' => $faker->dateTime($max = 'now')
    ];
});

$factory->define(App\Models\Sensor::class, function (Faker\Generator $faker) {
    return [
        'name' => $faker->word,
        'uri' => 'http://sensors.arlem:' .  mt_rand(8900,9000) . '?clientid=' . mt_rand(8900,9000),
        'username' => $faker->username,
        'password' => app('hash')->make('yourpassword'),
        'author' => mt_rand(1,2),
        'created_at' => $faker->dateTime($max = 'now'),
        'modified_at' => $faker->dateTime($max = 'now')
    ];
});

$factory->define(App\Models\Triggers\Detectable::class, function (Faker\Generator $faker) {
    return [
        'sensor' => mt_rand(1,5),
        'type' => 'marker',
        'url' => 'http://this.is.me/markers/' . mt_rand(1,10) . '.asset',
        'message_id' => mt_rand(1,10),
        'author' => mt_rand(1,2),
        'created_at' => $faker->dateTime($max = 'now'),
        'modified_at' => $faker->dateTime($max = 'now')
    ];
});

$factory->define(App\Models\Triggers\Primitive::class, function (Faker\Generator $faker) {
    return [
        'name' => $faker->word,
        'overlay' => mt_rand(1,5),
        'type' => mt_rand(1,3),
        'symbol' => "",
        'size' => mt_rand(0.2,0.4),
        'url' => '',
        'option' => '',
        'author' => mt_rand(1,2),
        'created_at' => $faker->dateTime($max = 'now'),
        'modified_at' => $faker->dateTime($max = 'now')
    ];
});

$factory->define(App\Models\Triggers\Predicate::class, function (Faker\Generator $faker) {
    return [
        'name' => $faker->word,
        'author' => mt_rand(1,2),
        'created_at' => $faker->dateTime($max = 'now'),
        'modified_at' => $faker->dateTime($max = 'now')
    ];
});

$factory->define(App\Models\Triggers\PredicatePrimitive::class, function (Faker\Generator $faker) {
    return [
        'predicate' => mt_rand(1,10),
        'primitive' => mt_rand(1,10)
    ];
});

$factory->define(App\Models\Triggers\Hazard::class, function (Faker\Generator $faker) {
    return [
        'name' => $faker->word,
        'author' => mt_rand(1,2),
        'created_at' => $faker->dateTime($max = 'now'),
        'modified_at' => $faker->dateTime($max = 'now')
    ];
});

$factory->define(App\Models\Triggers\HazardPrimitive::class, function (Faker\Generator $faker) {
    return [
        'hazard' => mt_rand(1,10),
        'primitive' => mt_rand(1,10)
    ];
});

$factory->define(App\Models\Triggers\Warning::class, function (Faker\Generator $faker) {
    return [
        'name' => $faker->word,
        'author' => mt_rand(1,2),
        'created_at' => $faker->dateTime($max = 'now'),
        'modified_at' => $faker->dateTime($max = 'now')
    ];
});

$factory->define(App\Models\Triggers\WarningPrimitive::class, function (Faker\Generator $faker) {
    return [
        'warning' => mt_rand(1,10),
        'primitive' => mt_rand(1,10)
    ];
});

$factory->define(App\Models\Configurables\App::class, function (Faker\Generator $faker) {
    return [
        'name' => $faker->word,
        'manifest' => 'http://this.is.me/' . $faker->word . '.xml',
        'author' => mt_rand(1,2),
        'type' => mt_rand(1,3),
        'created_at' => $faker->dateTime($max = 'now'),
        'modified_at' => $faker->dateTime($max = 'now')
    ];
});

$factory->define(App\Models\Configurables\Device::class, function (Faker\Generator $faker) {
    return [
        'name' => $faker->word,
        'type' => mt_rand(1,5),
        'author' => mt_rand(1,2),
        'created_at' => $faker->dateTime($max = 'now'),
        'modified_at' => $faker->dateTime($max = 'now')
    ];
});

$factory->define(App\Models\Resource::class, function (Faker\Generator $faker) {

    return [
        'id' => mt_rand(1,10),
        'type' => $faker->randomElement(['Tangibles\Person','Tangibles\Place','Tangibles\Thing','Configurables\Device','Configurables\App','Triggers\Detectable','Triggers\Hazard','Triggers\Warning','Triggers\Predicate']),
        'author' => mt_rand(1,2),
        'workplace' => mt_rand(1,10),
        'created_at' => $faker->dateTime($max = 'now'),
        'modified_at' => $faker->dateTime($max = 'now')
    ];
});

$factory->define(App\Models\Activity::class, function (Faker\Generator $faker) {

    return [
        'name' => $faker->name,
        'description' => $faker->paragraph(3),
        'workplace' => mt_rand(1,10),
        'start' => mt_rand(1,10),
        'author' => mt_rand(1,2),
        'created_at' => $faker->dateTime($max = 'now'),
        'modified_at' => $faker->dateTime($max = 'now')
    ];
});

$factory->define(App\Models\Action::class, function (Faker\Generator $faker) {

    return [
        'name' => $faker->name,
        'viewport' => mt_rand(1,3),
        'device' => mt_rand(0,10),
        'location' => mt_rand(0,10),
        'instruction' => mt_rand(0,10),
        'activity' => mt_rand(1,10),
        'author' => mt_rand(1,2),
        'created_at' => $faker->dateTime($max = 'now'),
        'modified_at' => $faker->dateTime($max = 'now')
    ];
});

$factory->define(App\Models\Instruction::class, function (Faker\Generator $faker) {

    return [
        'title' => $faker->name,
        'description' => $faker->paragraph(3),
        'activity' => mt_rand(1,10),
        'author' => mt_rand(1,2),
        'created_at' => $faker->dateTime($max = 'now'),
        'modified_at' => $faker->dateTime($max = 'now')
    ];
});


$factory->define(App\Models\ActionTrigger::class, function (Faker\Generator $faker) {

    return [
        'action' => mt_rand(1,10),
        'mode' => mt_rand(1,3),
        'type' => $faker->randomElement(['action','tangible']),
        'predicate' => mt_rand(1,10),
        'poi' => mt_rand(1,10),
        'viewport' => mt_rand(1,2),
        'option' => $faker->randomElement(['down','tangible'])
    ];
});