<?php

use Illuminate\Database\Seeder;
use App\User;
use App\Models\Sensor;
use App\Models\Resource;
use App\Models\Workplace;
use App\Models\Activity;
use App\Models\Instruction;
use App\Models\Action;
use App\Models\ActionTrigger;
use App\Models\Tangibles\Person;
use App\Models\Tangibles\Place;
use App\Models\Tangibles\Thing;
use App\Models\Configurables\App;
use App\Models\Configurables\Device;
use App\Models\Triggers\Detectable;
use App\Models\Triggers\Hazard;
use App\Models\Triggers\HazardPrimitive;
use App\Models\Triggers\Predicate;
use App\Models\Triggers\PredicatePrimitive;
use App\Models\Triggers\Primitive;
use App\Models\Triggers\Trigger;
use App\Models\Triggers\Warning;
use App\Models\Triggers\WarningPrimitive;


class DatabaseSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        // $this->call('UsersTableSeeder');
        // Disable foreign key checking because truncate() will fail
        DB::statement('SET FOREIGN_KEY_CHECKS = 0');

        User::truncate();
        Workplace::truncate();
        Person::truncate();
        Place::truncate();
        Thing::truncate();
        Detectable::truncate();
        Hazard::truncate();
        HazardPrimitive::truncate();
        Predicate::truncate();
        PredicatePrimitive::truncate();
        Primitive::truncate();

        Warning::truncate();
        WarningPrimitive::truncate();

        Sensor::truncate();
        App::truncate();
        Device::truncate();

        Resource::truncate();

        Activity::truncate();
        Action::truncate();
        ActionTrigger::truncate();
        Instruction::truncate();


        factory(User::class, 2)->create();
        factory(Workplace::class, 10)->create();
        factory(Person::class, 10)->create();
        factory(Place::class, 10)->create();
        factory(Thing::class, 10)->create();
        factory(Sensor::class, 5)->create();
        factory(Detectable::class, 10)->create();
        factory(Hazard::class, 10)->create();
        factory(HazardPrimitive::class, 10)->create();
        factory(Predicate::class, 10)->create();
        factory(PredicatePrimitive::class, 10)->create();
        factory(Primitive::class, 10)->create();
        factory(Warning::class, 10)->create();
        factory(WarningPrimitive::class, 10)->create();

        factory(App::class, 10)->create();
        factory(Device::class, 10)->create();

        factory(Resource::class, 100)->create();

        factory(Activity::class, 10)->create();
        factory(Action::class, 10)->create();
        factory(ActionTrigger::class, 10)->create();

        factory(Instruction::class, 10)->create();


        DB::statement('SET FOREIGN_KEY_CHECKS = 1');
    }
}
