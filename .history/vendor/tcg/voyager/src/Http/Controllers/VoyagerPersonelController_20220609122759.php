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
        var labels = [];
        var rows = jQuery("tr");
        rows.each(function(index){
        if (index != 0)  //we dont need first row of table
        {
        var cols = $(this).find("td");      
        labels.push(cols.first().text());                           
        }
        });
        return view('voyager::statistic', compact('userData'));
    }

}