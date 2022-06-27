<?php

namespace TCG\Voyager\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use LaravelDaily\LaravelCharts\Classes\LaravelChart;
use TCG\Voyager\Models\DataType;

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
        'model' => 'App\Models\User',
        'group_by_field' => 'created_at',
        'group_by_period' => 'month',
        'chart_type' => 'bar',
    ];
    $chart1 = new LaravelChart($chart_options);
    return view('voyager::statistic', compact('chart1'));   
    }

    public function chart(Request $request)
   
    {     
        $tab = explode("\\", $request->dropdown1);
        $chart_options = [
            'chart_title' => $tab[sizeof($tab)-1].' by months',            
            'report_type' => 'group_by_date',
            'model' => $request->dropdown1,
            /* 'group_by_period' => $request->date1,
            'group_by_period' => $request->date2, */
            'group_by_field' => 'created_at',
            'filter_field' => 'created_at',
            'range_date_start' =
            'group_by_period' => 'month',
            'chart_type' => $request->chart,
        ];
        $chart1 = new LaravelChart($chart_options);
        return view('voyager::statistic', compact('chart1'));   
    }
}