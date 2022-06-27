<?php

namespace App\Http\Controllers;

use App\Exports\PatientsExport;
use App\Visite;
use Illuminate\Support\Facades\Session;
use Illuminate\Http\Request;
use Maatwebsite\Excel\Facades\Excel;

class VisiteController extends Controller
{
    public function filtrage(Request $request)
    {
     
        $branche_id = $request->branche_id;
        $service_id = $request->service_id;
        $annee = $request->created_at;
        
        if ($service_id != null && $branche_id != null && $annee != null ) {
            //echo "3 are selected";
            
            $data = Visite::join('dossiers','visites.dossier_id','dossiers.id')
                ->where('dossiers.branche_id' , $branche_id)
                ->where('dossiers.service_id' , $service_id )
                ->whereYear('visites.created_at', $annee)
                ->select('visites.*')
                ->paginate(7);
                
        } 
        elseif ( $annee != null && $service_id == null && $branche_id == null ) {
            //echo "annee is selected";
            $data = Visite::whereYear('visites.created_at', $annee)
            ->select('visites.*')
            ->paginate(7);
        }
        elseif ($service_id != null && $branche_id == null && $annee == null) {
            //echo "service is selected";
            $data = Visite::join('dossiers','visites.dossier_id', 'dossiers.id')
                ->where('dossiers.service_id', $service_id)
                ->select('visites.*')
                ->paginate(7);
             //   dd($data);
        }elseif ($service_id != null && $branche_id != null && $annee == null) {
            //echo "branche&&service is selected";
            $data = Visite::join('dossiers','dossiers.id','visites.dossier_id')
                ->where('dossiers.service_id', $service_id)
                ->where('dossiers.branche_id', $branche_id)
                ->select('visites.*')
                ->paginate(7);
        }

      elseif ($branche_id != null && $service_id == null && $annee == null) {
            //echo "branche is selected";
            $data = Visite::join('dossiers','visites.dossier_id','dossiers.id')
                ->where('dossiers.branche_id' , $branche_id)
                ->select('visites.*')
                ->paginate(7);
        }
        elseif ($branche_id == "" && $service_id != null && $annee != null) {
            //echo "service&&annee is selected";
            $data = Visite::join('dossiers','dossiers.id','visites.dossier_id')
                ->where('dossiers.service_id', $service_id)
                ->whereYear('visites.created_at', $annee)
                ->select('visites.*')
                ->paginate(7);
        } elseif ($branche_id != "" && $service_id == null && $annee != null) {
            //echo "branche&&annee is selected";
           $data = Visite::join('dossiers','dossiers.id','visites.dossier_id')
                ->where('dossiers.branche_id', $branche_id)
                ->whereYear('visites.created_at', $annee)
                ->select('visites.*')
                ->paginate(7);
        }
        else {
            //echo "nothing is slected";
            return back();    
        }
     /*    if ($data->count() == 0) {
            echo "<h1 align='center'>Dossier introuvable</h1>";
        } else { */
            return back()->with(
                ['branche' => $branche_id,
                'dataa' => $data,
                'service' =>$service_id,
                'annee' =>$annee]

            );
        //}
    }

    /**
    * @return \Illuminate\Support\Collection
    */
    public function export(Request $request) 
    {
        // $data = $request->session()->all();
        /** set session in laravel */
        $branche_id = $request->branche_id;
        $service_id = $request->service_id;
        $annee = $request->annee;
        Session::put('service_id', $service_id);
        Session::put('branche_id', $branche_id);
        Session::put('created_at', $annee);

        return Excel::download(new PatientsExport(), 'patient.xlsx');
    }

    
    /**
    * @return \Illuminate\Support\Collection
    */
    public function ExportView()
    {
        return redirect()->route('voyager.visites.index')->with([
            'message'    => 'Message de réussite',
            'alert-type' => 'success',
        ]);
    }    
}
