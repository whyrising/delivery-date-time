<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class AddCityDeliveryTimeController extends Controller
{
    function handle(Request $request, $cityId)
    {
        $data = $request->json()->all();
        $deliveryTimes = $data ['delivery_times'];
        $cityDeliveryTimes = array();

        foreach ($deliveryTimes as $deliveryTime) {
            $cityDeliveryTimes[] = [
                'city_id' => $cityId,
                'delivery_time_id' => $deliveryTime['delivery_time_id']
            ];
        }

        $this->saveCityDeliveryTime($cityDeliveryTimes);
    }

    private function saveCityDeliveryTime(array $cityDeliveryTimes): bool
    {
        return DB::table('city_delivery_times')->insert($cityDeliveryTimes);
    }
}
