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
        /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    public function index()
    {
        $users = User::select(\DB::raw("COUNT(*) as count"))
                    ->whereYear('created_at', date('Y'))
                    ->groupBy(\DB::raw("Month(created_at)"))
                    ->pluck('count');
           
        return view('highchart', compact('users'));
    }
      

    /* 
      $labels = array();                  //month
        $data = array();                    //nbrs patients
       // $patients = Patient::all();
       for ($i = 0 ; $i < 12; $i++) {
            $nb = Patient::/* select(DB::raw("COUNT(*) as count ")) */
            whereYear('created_at', date('Y'))
            ->whereMonth('created_at', $i+1)
            ->get()->count();/* 
            ->groupBy(DB::raw("Month(created_at)"))
            ->pluck('count' );  */
            array_push($labels, "$i");
            array_push($data, "$nb");
        }
        

    // dd($labels);
       // dd($data);
       
        return view('voyager::statistic', [
            "data" => json_encode($data),
            "labels" => json_encode($labels),
            
        ]);
    }
    */
}