<?php

namespace App\Http\Controllers;

use App\City;
use Illuminate\Http\Request;

class AddCityController extends Controller
{
    function handle(Request $request)
    {
        $this->addCitySlugToRequestBody($request);

        return $this->saveCity($request);
    }

    private function addCitySlugToRequestBody(Request $request): Request
    {
        return $request->merge(['slug' => $this->slugify($request['name'])]);
    }

    private function slugify($string)
    {
        return strtolower(trim(preg_replace('/[^A-Za-z0-9-]+/', '-', $string), '-'));
    }

    private function saveCity(Request $request)
    {
        return City::create($request->all());
    }
}
