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

class VoyagerPersonelController extends VoyagerBaseController
{
    /**
     * The attributes that are mass assignable.
     *
     * @var array 
     */
    public function statistic()
   
    {
        $userData = User::select(DB::raw("COUNT(*) as count"))
        ->whereYear('created_at', date('Y'))
        ->groupBy(DB::raw("Month(created_at)"))
        ->pluck('count');

        return view('voyager::statistic', compact('users'));
    }

}