<?php

namespace App\Http\Controllers;

use App\Charts\UserChart;
use App\Models\User;
use Illuminate\Support\Facades\DB;

class StatisticsController extends Controller
{
    public function index()
    {
        $users = User::select(DB::raw("COUNT(*) as count"))
                    ->whereYear('created_at', date('Y'))
                    ->groupBy(DB::raw("Month(created_at)"))
                    ->pluck('count');

        $months = User::select(DB::raw("Month(created_at) as month"))
                    ->whereYear('created_at', date('Y'))
                    ->groupBy(DB::raw("Month(created_at)"))
                    ->pluck('month');
        $datas = array(0,0,0,0,0,0,0,0,0,0,0,0);
        foreach ($months as $index => $month)
        {
            $datas[$months] = $users[$index];
        } 

        return view('statistics', compact('datas'));
    }
    public function __invoke()
    {
      //
    }
}
