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

    public function activities()
    {
        return $this->hasMany("App\\Models\\WorkplaceActivity", "workplaces_id", "id");
    }

    public function toXML()
    {
        $xml = new \SimpleXMLElement('<workplace/>');
        $xml->addAttribute("id", $this->id);
        $xml->addAttribute("name", $this->name);

        $items = [
            'tangibles' => $xml->addChild('tangibles'),
            'configurables' => $xml->addChild('configurables'),
            'triggers' => $xml->addChild('triggers'),
            'sensors' => $xml->addChild('sensors'),
            'activities' => $xml->addChild('activities'),
        ];

        $subItems = [
            'apps' => $items['configurables']->addChild('apps'),
            'devices' => $items['configurables']->addChild('devices'),

            'places' => $items['tangibles']->addChild('places'),
            'people' => $items['tangibles']->addChild('people'),
            'things' => $items['tangibles']->addChild('things'),

            'detectables' => $items['triggers']->addChild('detectables'),
            'hazards' => $items['triggers']->addChild('hazards'),
            'predicates' => $items['triggers']->addChild('predicate'),
            'warnings' => $items['triggers']->addChild('warnings'),
        ];


        foreach ($this->resources as $resource) {
            $mainClass = app("App\\Models\\{$resource->type}");
            $types = explode("\\", $resource->type);
            if(strtolower(isset($types[1]))){
                $mainClass::find($resource->id)->toXML($subItems[strtolower(str_plural($types[1]))]);
            } else {
                $mainClass::find($resource->id)->toXML($items[strtolower(str_plural($types[0]))]);
            }
        }

        foreach ($this->activities as $activities) {
            $activities->activity()->first()->toXML($items['activities']);
        }

        // tangibles, configurables
        /*foreach ($items as $category => $subItems) {
            $workplace .= "<$category>";
            // person, place
            foreach($subItems as $subcategory => $subsubitems) {
                if(is_array($subsubitems)){
                    $workplace .= '<'.str_plural($subcategory).'>';
                    foreach($subsubitems as $item) {
                        $workplace .= $item;
                    }
                    $workplace .= '</'.str_plural($subcategory).'>';
                } else {
                    $workplace .= $subsubitems;
                }
            }
            $workplace .= "</$category>";
        }

        $workplace .= "</workplace>";

        $workplaceXML = new \SimpleXMLElement($workplace);
        //dd($workplaceXML);*/

        foreach( $xml->xpath('/child::*//*[not(*) and not(text()[normalize-space()])]') as $emptyElement ) {
            unset( $emptyElement[0] );
        }

        return $xml->asXML();
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
                    $workplace[str_plural(strtolower($types[0]))][] = $mainClass->toJSONP($resource->id);
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