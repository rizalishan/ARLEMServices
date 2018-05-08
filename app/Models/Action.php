<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Action extends Model
{    
    public $timestamps = false;
    protected $table = 'actions';

    public function author() {
        return $this->belongsTo("App\\User", "author", "id");
    }

    public function activity() {
        return $this->belongsTo("App\\Models\\Activity", "activity", "id");
    }

    public function viewport() {
        return $this->belongsTo("App\\Models\\Viewport", "viewport", "id");
    }

    public function triggers() {
        return $this->hasMany("App\\Models\\ActionTrigger", "action", "id");
    }

    public function toXML()
    {
        try {

            $xml = '<action id="' . $this->id . '" viewport="action" type="action">';

            $items = [];
            foreach ($this->triggers as $trigger) {
                $items[$trigger->triggerMode->name][] = $trigger->toXML();
            }

            foreach ($items as $type => $subitems) {
                $xml .= '<' . ($type == 'enter' || $type == 'exit' ? $type : 'triggers') . '>';
                foreach ($subitems as $item) {
                    $xml .= $item;
                }
                $xml .= '</' . ($type == 'enter' || $type == 'exit' ? $type : 'triggers') . '>';
            }

            $xml .= '</action>';

            $xml = new \SimpleXMLElement($xml);
            return str_replace('<?xml version="1.0"?>', '', $xml->asXML());
        }catch(\Exception $e){
            echo $e;
        }
    }
}
