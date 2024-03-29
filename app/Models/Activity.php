<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Activity extends Model
{
    public $timestamps = false;
    protected $table = 'activities';

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'name', 'author', 'description', 'language'
    ];

    public function author()
    {
        return $this->belongsTo("App\\User", "author", "id");
    }

    public function start()
    {
        return $this->belongsTo("App\\Models\\Action", "start", "id");
    }

    public function workplace()
    {
        return $this->belongsTo("App\\Models\\Workplace", "workplace", "id");
    }

    public function actions()
    {
        return $this->hasMany("App\\Models\\Action", "activity", "id");
    }

    public function toXML($xml)
    {

        $ele = $xml->addChild('activity');
        $ele->addAttribute('id',$this->id);
        $ele->addAttribute('type',$this->name);
        $ele->addAttribute('language',$this->language);
        $ele->addAttribute('start',$this->start()->first()->id);

        $eleActions = $ele->addChild('actions');
        $items = [];

        foreach ($this->actions as $action) {
            $action->toXML($eleActions);
        }
    }

    public function toJSONP()
    {

        $acitivy = [
            "id" => $this->id,
            "name" => $this->name,
            'language' => $this->language,
            'start' => $this->start
        ];

        foreach ($this->actions as $action) {
            $acitivy["actions"][] = $action->toJSONP($action->id);
        }

        return $acitivy;
    }

    public static function create($user, $data)
    {
        $objActivity = new Activity;
        $objActivity->name = $data["name"];
        $objActivity->workplace = $data["workplace"];
        $objActivity->language = $data["language"];
        $objActivity->description = $data["description"];
        $objActivity->author = $user;
        $objActivity->save();

        $id = $objActivity->id;

        foreach ($data["actions"] as $key => $action) {
            $actionId = Action::create($id, $user, $action);
            if ($key == 0) {
                $objActivity->start = $actionId;
                $objActivity->save();
            }
        }
    }
}