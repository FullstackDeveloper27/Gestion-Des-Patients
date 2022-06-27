<?php

namespace App\Providers;

use Illuminate\Support\ServiceProvider;
use ConsoleTVs\Charts\Registrar as Charts;
use App\Charts\OrdersChart;
use Symfony\Component\Mime\CharacterStream;

class AppServiceProvider extends ServiceProvider
{
    /**
     * Register any application services.
     *
     * @return void
     */
    public function register()
    {
        //
    }

}
