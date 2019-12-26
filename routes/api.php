<?php

$postRoutes = array(
    'cities' => 'AddCityController',
    'cities/{id}/delivery-times' => 'AddCityDeliveryTimeController',
    'cities/{id}/excluded-delivery-times' => 'ExcludeCityDeliveryTimesController',
    'cities/{id}/exclude-delivery-date' => 'ExcludeCityDeliveryDateController',
    'delivery-times' => 'AddDeliveryTimeController',
);

foreach ($postRoutes as $path => $controller)
    addPostPath($path, $controller);

function addPostPath($path, $controller): void
{
    Route::post($path, $controller . '@handle');
}

Route::get('cities/{id}/delivery-dates-times/{days_count}', 'CityDeliveryDateTimesController@handle');
