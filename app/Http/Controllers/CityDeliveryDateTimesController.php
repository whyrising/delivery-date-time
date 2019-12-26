<?php

namespace App\Http\Controllers;

use Illuminate\Support\Collection;
use Illuminate\Support\Facades\DB;

class CityDeliveryDateTimesController extends Controller
{
    function handle($cityId, $daysCount)
    {
        $dates = array();
        for ($i = 1; $i <= $daysCount; $i++) {
            $date = $this->daysFromNow($i);
            $deliveryDateTimes = $this->getDeliveryTimes($cityId, $date);

            if ($this->isEmpty($deliveryDateTimes))
                continue;

            $list = $this->deliveryDates($date, $deliveryDateTimes);
            $dates[] = $list;
        }

        $response["dates"] = $dates;

        return $response;
    }

    private function daysFromNow(int $numberOfDays)
    {
        return date("Y-m-d", strtotime('+' . $numberOfDays . 'day'));
    }

    private function getDeliveryTimes($cityId, string $date): Collection
    {
        return DB::table('city_delivery_times')
            ->join(
                'delivery_times',
                'city_delivery_times.delivery_time_id',
                '=',
                'delivery_times.id'
            )
            ->leftjoin('excluded_city_delivery_times', function ($join) use ($date) {
                $join->on('city_delivery_times.id', '=', 'excluded_city_delivery_times.city_delivery_time_id')
                    ->where('excluded_city_delivery_times.delivery_date', '=', $date);
            })
            ->select(
                'delivery_times.id',
                'delivery_times.span',
                'delivery_times.created_at',
                'delivery_times.updated_at'
            )
            ->where('city_id', '=', $cityId)
            ->where('excluded_city_delivery_times.city_delivery_time_id', '=', null)
            ->get();
    }

    private function isEmpty(Collection $deliveryDateTimes): bool
    {
        return count($deliveryDateTimes) == 0;
    }
    
    private function deliveryDates(string $date, Collection $deliveryDateTimes)
    {
        $list['day_name'] = date('l', strtotime($date));
        $list['date'] = $date;
        $list['delivery_times'] = $deliveryDateTimes;

        return $list;
    }
}
