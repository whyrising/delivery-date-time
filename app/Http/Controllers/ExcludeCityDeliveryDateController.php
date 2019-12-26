<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class ExcludeCityDeliveryDateController extends Controller
{
    function handle(Request $request, $cityId)
    {
        $cityDeliveryTimes = $this->getCityDeliveryTimes($cityId);

        $excludedCityDeliveryTimes = array();
        foreach ($cityDeliveryTimes as $cityDeliveryTime)
            $excludedCityDeliveryTimes[] = [
                'delivery_date' => $request->input('delivery_date'),
                'city_delivery_time_id' => $cityDeliveryTime->id
            ];

        $this->saveExcludedCityDeliverTimes($excludedCityDeliveryTimes);
    }

    private function getCityDeliveryTimes($cityId)
    {
        return DB::table('city_delivery_times')
            ->select('id')
            ->where('city_id', '=', $cityId)
            ->get();
    }

    public function saveExcludedCityDeliverTimes(array $excludedCityDeliveryTimes): bool
    {
        return DB::table('excluded_city_delivery_times')->insert($excludedCityDeliveryTimes);
    }
}
