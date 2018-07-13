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

    public function mode()
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

    public function operations()
    {
        return $this->hasMany("App\\Models\\ActionTriggerOperation", "actionTrigger", "id");
    }

    public function toXML($xml)
    {

        $ele = null;
        if ($this->triggerMode->name != 'enter' && $this->triggerMode->name != 'exit') {
            $ele = $xml->addChild('trigger');
            $this->triggerMode()->first()->toXML($ele);
        } else {
            $ele = $xml->addChild($this->triggerMode->name);
        }
        $ele->addAttribute('id', $this->id);
        $ele->addAttribute('type', $this->type);

        $operationEle = $ele->addChild('operations');

        foreach($this->operations as $operation) {
            $operation->toXML($operationEle);
        }

    }

    public function toJSONP($id)
    {
        return $this::where("id", $id)->with(["action", "triggerMode", "triggerpredicate", "triggerPoi", "triggerViewport"])->first()->toArray();
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