<?php

namespace TCG\Voyager\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
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
            'chart_type' => 'pie',
        ];
        $chart1 = new LaravelChart($chart_options);
        return view('voyager::statistic', compact('chart1'));   
    }

    public function chart(Request $request)
   
    {     
        $table = DB::select('data_types')->get();

        $chart_options = [
            'chart_title' => 'Users by months',            
            'report_type' => 'group_by_date',
            'model' => $request-> $table->model_name,
            'group_by_field' => 'created_at',
            'group_by_period' => 'month',
            'chart_type' => $request->chart,
        ];
        $chart1 = new LaravelChart($chart_options);
        return view('voyager::statistic', compact('chart1'));   
    }
}