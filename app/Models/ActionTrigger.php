<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class ActionTrigger extends Model
{
    public $timestamps = false;
    protected $table = 'action_triggers';

    public function action()
    {
        return $this->belongsTo("App\\Models\\Action", "action", "id");
    }

    public function triggerMode()
    {
        return $this->belongsTo("App\\Models\\ActionTriggerMode", "mode", "id");
    }

    public function triggerpredicate()
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

    public static function create($action, $author, $data)
    {
        $objTrigger = new ActionTrigger;
        $objTrigger->action = $action;
        $objTrigger->mode = $data["mode"];
        $objTrigger->remove = !isset($data["remove"]) || $data["remove"] == 1 ? 'y' : 'n';
        $objTrigger->save();
        $id = $objTrigger->id;


        if ($data["mode"] <= 2) {
            foreach ($data["operations"] as $operation) {
                ActionTriggerOperation::create($id, $author, $operation);
            }
        } elseif ($data["mode"] == 3) {
            ActionTriggerOperation::create($id, $author, [
                "entityType" => "action",
                "entityId" => $data["entity"],
                "viewport" => $data["viewport"]
            ]);
        } elseif ($data["mode"] == 4) {
            ActionTriggerOperation::create($id, $author, [
                "entityType" => $data["type"],
                "entityId" => $data["entity"],
                "options" => $data["options"]
            ]);
        } elseif ($data["mode"] == 5) {
            ActionTriggerOperation::create($id, $author, [
                "entityType" => "sensor",
                "entityId" => $data["entity"],
                "options" => $data["options"]
            ]);
        }
    }
}