<?php

namespace App\Http\Controllers;

use App\DeliveryTime;
use Illuminate\Http\Request;

class AddDeliveryTimeController extends Controller
{
    function handle(Request $request)
    {
        return DeliveryTime::create($request->all());
    }
}
