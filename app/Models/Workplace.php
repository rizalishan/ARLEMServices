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

        Header('Content-type: text/xml');
        $workplaceXML = new \SimpleXMLElement($workplace);
        //dd($workplaceXML);
        print($workplaceXML->asXML());

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