<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class ExcludeCityDeliveryTimesController extends Controller
{
    function handle(Request $request)
    {
        $data = $request->json()->all();
        $deliveryDate = $data ['delivery_date'];
        $excludedDeliveryTimes = $data ['excluded_delivery_times'];
        $cityDeliveryTimes = array();

        foreach ($excludedDeliveryTimes as $excludedDeliveryTime)
            $cityDeliveryTimes[] = [
                'delivery_date' => $deliveryDate,
                'city_delivery_time_id' => $excludedDeliveryTime['city_delivery_time_id']
            ];

        $this->excludeCityDeliveryTimes($cityDeliveryTimes);
    }

    private function excludeCityDeliveryTimes(array $cityDeliveryTimes): void
    {
        DB::table('excluded_city_delivery_times')->insert($cityDeliveryTimes);
    }
}
