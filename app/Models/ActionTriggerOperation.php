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



    public function toXML()
    {
        if ($this->triggerMode->name != 'enter' && $this->triggerMode->name != 'exit') {
            $xml = new \SimpleXMLElement('<trigger/>');
            $xml->addAttribute('mode', $this->triggerMode->name);
        } else {
            if ($this->is_activate == 'y') {
                $xml = new \SimpleXMLElement('<activate/>');
            } else {
                $xml = new \SimpleXMLElement('<deactivate/>');
            }
        }
        $xml->addAttribute('id', $this->trigger);
        $xml->addAttribute('type', $this->type);

        if ($this->type == 'tangible') {
            $xml->addAttribute('predicate', $this->triggerpredicate->name);
            $xml->addAttribute('poi', $this->triggerPoi->name);
            $xml->addAttribute('option', $this->option);
        } else {
            $xml->addAttribute('viewport', $this->triggerViewport->name);
        }
        return str_replace('<?xml version="1.0"?>', '', $xml->asXML());
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