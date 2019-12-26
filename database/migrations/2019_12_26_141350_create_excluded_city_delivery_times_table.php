<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Schema;

class CreateExcludedCityDeliveryTimesTable extends Migration
{
    public function up()
    {
        Schema::create('excluded_city_delivery_times', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->unsignedBigInteger('city_delivery_time_id')->unique();
            $table->foreign('city_delivery_time_id')->references('id')->on('city_delivery_times');
            $table->date('delivery_date');
            $table->timestamp('created_at')->default(DB::raw('CURRENT_TIMESTAMP'));
            $table->timestamp('updated_at')->default(DB::raw('CURRENT_TIMESTAMP'));
        });
    }

    public function down()
    {
        Schema::dropIfExists('excluded_city_delivery_times');
    }
}
