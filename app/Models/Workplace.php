<?php

namespace App\Models;

use App\Models\Tangibles\Person;
use App\Models\Resource;
use App\Models\Tangibles\Places;
use App\Models\Tangibles\Thing;

use Illuminate\Database\Eloquent\Model;

class Workplace extends Model
{
    public $timestamps = false;
    protected $table = 'workplaces';

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'name', 'author',
    ];

    public function author()
    {
        return $this->belongsTo("App\\User", "author", "id");
    }

    public function resources()
    {
        return $this->hasMany("App\\Models\\Resource", "workplace", "id");
    }

    public function toXML()
    {
        $workplace = '<workplace id="'.$this->id.'" name="'.$this->name.'">';

        $items = [
            'tangibles' => [],
            'configurables' => [],
            'triggers' => [],
            'sensors' => []
        ];

        foreach ($this->resources as $resource) {
            $mainClass = app("App\\Models\\{$resource->type}");
            $types = explode("\\", $resource->type);
            $items[strtolower($types[0])][strtolower($types[1])][] = $mainClass::find($resource->id)->toXML();
        }

        // tangibles, configurables
        foreach ($items as $category => $subItems) {
            $workplace .= "<$category>";
            // person, place
            foreach($subItems as $subcategory => $subsubitems) {
                $workplace .= '<'.str_plural($subcategory).'>';
                foreach($subsubitems as $item) {
                    $workplace .= $item;
                }
                $workplace .= '</'.str_plural($subcategory).'>';
            }
            $workplace .= "</$category>";
        }

        $workplace .= "</workplace>";

        $workplaceXML = new \SimpleXMLElement($workplace);
        //dd($workplaceXML);
        return ($workplaceXML->asXML());

    }

    public function toJSONP()
    {

        $workplace = [
            "id" => $this->id,
            "name" => $this->name,
            'tangibles' => [
                "thing" => [],
                "place" => [],
                "person" => []
            ],
            'configurables' => [
                "device" => [],
                "app" => []
            ],
            'triggers' => [
                "hazard" => [],
                "detectable" => [],
                "predicate" => [],
                "warning" => []
            ],
            'sensors' => [],
            'activities' => []
        ];

        foreach ($this->resources as $resource) {
            $mainClass = app("App\\Models\\{$resource->type}");
            $types = explode("\\", $resource->type);
            $builder = $mainClass::where("id", $resource->id)->get();
            if($builder->count() > 0){
                if(strtolower(isset($types[1]))){
                    $workplace[strtolower($types[0])][strtolower($types[1])][] = $mainClass->toJSONP($resource->id);
                } else{
                    $workplace[strtolower($types[0])][] = $mainClass->toJSONP($resource->id);
                }
            } else {
                $workplace[strtolower($types[0])][strtolower($types[1])][] = [];
            }
        }

        foreach(WorkplaceActivity::where("workplaces_id", $this->id)->get() as $workplaceActivity){
            $workplace["activities"][] = $workplaceActivity->activity->toJSONP();
        }

        return $workplace;
    }

    public static function create($author, $input)
    {
        $objWorkplace = new Workplace;

        $objWorkplace->name = $input['name'];
        $objWorkplace->author = $author;
        $objWorkplace->save();
        $id = $objWorkplace->id;
        foreach($input['items'] as $item){
            $objResource = new Resource;
            $objResource->id = $item["id"];
            $objResource->type = Resource::typeParser($item["type"]);
            $objResource->workplace = $id;
            $objResource->author = $author;
            $objResource->save();
        }
    }
}