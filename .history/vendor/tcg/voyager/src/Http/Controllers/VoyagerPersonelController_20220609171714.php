<?php

namespace TCG\Voyager\Http\Controllers;

use App\Branch;
use App\Models\User;
use App\Patient;
use App\Service;
use TCG\Voyager\Facades\Voyager;
use App\Visite;
use Carbon\Carbon;
use Illuminate\Support\Facades\DB;
use Illuminate\Http\Request;
use LaravelDaily\LaravelCharts\Classes\LaravelChart;


class VoyagerPersonelController extends VoyagerBaseController
{
    /**
     * The attributes that are mass assignable.
     *
     * @var array 
     */
    public function statistic()
   
    {
        
        $chart_options = [
            'chart_title' => 'Users by months',
            'report_type' => 'group_by_date',
            'model' => 'Models\Patient',
            'group_by_field' => 'created_at',
            'group_by_period' => 'month',
            'chart_type' => 'bar',
            'filter_field' => 'created_at',
            'filter_days' => 30, // show only last 30 days
        ];
    
        $chart1 = new LaravelChart($chart_options);
    
    
        $chart_options = [
            'chart_title' => 'Users by names',
            'report_type' => 'group_by_string',
            'model' => 'Models\Patient',
            'group_by_field' => 'name',
            'chart_type' => 'pie',
            'filter_field' => 'created_at',
            'filter_period' => 'month', // show users only registered this month
        ];
    
        $chart2 = new LaravelChart($chart_options);
    
        $chart_options = [
            'chart_title' => 'Transactions by dates',
            'report_type' => 'group_by_date',
            'model' => 'Models\Patient',
            'group_by_field' => 'transaction_date',
            'group_by_period' => 'day',
            'aggregate_function' => 'sum',
            'aggregate_field' => 'amount',
            'chart_type' => 'line',
        ];
    
        $chart3 = new LaravelChart($chart_options);
    

        return view('voyager::statistic', compact('chart1','chart2','chart3'));
    }

}