<?php

namespace TCG\Voyager\Http\Controllers;

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
            'model' => 'App\Patient',
            'group_by_field' => 'created_at',
            'group_by_period' => 'month',
            'chart_type' => 'radar',
        ];
        $chart1 = new LaravelChart($chart_options);
        return view('voyager::statistic', compact('chart1'));
    }
    public function 
}