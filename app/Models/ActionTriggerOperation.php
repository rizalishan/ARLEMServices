<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class ActionTriggerOperation extends Model
{
    public $timestamps = false;
    protected $table = 'action_trigger_operations';

    public function triggerMode()
    {
        return $this->belongsTo("App\\Models\\ActionTrigger", "actionTrigger", "id");
    }

    public function triggerpredicate()
    {
        return $this->hasOne("App\\Models\\Triggers\\Predicate", "id", "predicate");
    }

    public function predicate()
    {
        return $this->hasOne("App\\Models\\Triggers\\Predicate", "id", "predicate");
    }

    public function triggerPoi()
    {
        return $this->hasOne("App\\Models\\Tangibles\\POI", "id", "poi");
    }

    public function triggerViewport()
    {
        return $this->hasOne("App\\Models\\Viewport", "id", "viewport");
    }

    public function viewport()
    {
        return $this->hasOne("App\\Models\\Viewport", "id", "viewport");
    }

    public function sensor()
    {
        return $this->hasOne("App\\Models\\Sensor", "id", "sensor");
    }



    public function toXML($xml)
    {
        $ele = $xml->addChild('operation');

        $ele->addAttribute('id', $this->id);
        $ele->addAttribute('type', $this->type);
        $ele->addAttribute('is_active', $this->is_active);
        $ele->addAttribute('options', $this->option);
        $ele->addAttribute('poi', $this->poi);

        if($this->triggerpredicate()->first() != null) {
            $this->triggerpredicate()->first()->toXML($ele);
        }

        if($this->triggerViewport()->first() != null) {
            $this->triggerViewport()->first()->toXML($ele);
        }


        if($this->sensor()->first() != null) {
            $this->sensor()->first()->toXML($ele);
        }
    }

    public function toJSONP($id)
    {
        return $this::where("id", $id)->with(["triggerMode", "triggerpredicate", "triggerPoi", "triggerViewport"])->first()->toArray();
    }

    public static function create($trigger, $author, $data)
    {
        $objOperation = new ActionTriggerOperation;
        $objOperation->actionTrigger = $trigger;
        $objOperation->is_active = isset($data["action"]) ? "y" : "n";
        $objOperation->entityType = isset($data["type"]) ? strtolower($data["type"]) : "";
        $objOperation->entityId = isset($data["entity"]) ? $data["entity"] : "" ;
        $objOperation->predicate = isset($data["predicate"]) ? $data["predicate"] : "" ;
        $objOperation->poi = isset($data["poi"]) ? $data["poi"] : "";
        $objOperation->options = isset($data["options"]) ? $data["options"] : "";
        $objOperation->viewport = isset($data["viewport"]) ? $data["viewport"] : "";
        return $objOperation->save();
    }

}