<?php

namespace App\Exports;

use App\Visite;
use Illuminate\Support\Facades\Session;
use Maatwebsite\Excel\Concerns\WithHeadings;
use Maatwebsite\Excel\Concerns\FromCollection;

class PatientsExport implements FromCollection, WithHeadings
{
    
    /**
    * @return \Illuminate\Support\Collection
    */
    public function collection()
    {
        session_start();
        $branche_id = Session::get('branche_id');
        $service_id = Session::get('service_id');
        $annee = Session::get('created_at');

        if ($service_id != null && $branche_id != null && $annee != null ) {
            //echo "3 are selected";
            $data = Visite::join('dossiers','visites.dossier_id','dossiers.id')
                ->where('dossiers.branche_id' , $branche_id)
                ->where('dossiers.service_id' , $service_id )
                ->whereYear('visites.created_at', $annee)
                ->select('visites.*')
                ->get();
                
        }elseif ($branche_id != null && $service_id == null && $annee == null ) {
            //echo "branche is selected";
            $data = Visite::join('dossiers','visites.dossier_id','dossiers.id')
                ->where('dossiers.branche_id' , $branche_id)
                ->select('visites.*')
                ->get();

        }elseif ($service_id != null && $branche_id == null && $annee == null) {
            //echo "service is selected";
            $data = Visite::join('dossiers','visites.dossier_id', 'dossiers.id')
                ->where('dossiers.service_id', $service_id)
                ->select('visites.*')
                ->get();
             
        }elseif ( $annee != null && $service_id == null && $branche_id == null ) {
            //echo "annee is selected";
            $data = Visite::whereYear('visites.created_at', $annee)
            ->select('visites.*')
            ->get();

        }elseif ($service_id != null && $branche_id != null && $annee == null) {
            //echo "branche&&service is selected";
            $data = Visite::join('dossiers','dossiers.id','visites.dossier_id')
                ->where('dossiers.service_id', $service_id)
                ->where('dossiers.branche_id', $branche_id)
                ->select('visites.*')
                ->get();

        }elseif ($branche_id != "" && $service_id == null && $annee != null) {
            //echo "branche&&annee is selected";
           $data = Visite::join('dossiers','dossiers.id','visites.dossier_id')
                ->where('dossiers.branche_id', $branche_id)
                ->whereYear('visites.created_at', $annee)
                ->select('visites.*')
                ->get();

        } elseif ($branche_id == "" && $service_id != null && $annee != null) {
            //echo "service&&annee is selected";
            $data = Visite::join('dossiers','dossiers.id','visites.dossier_id')
                ->where('dossiers.service_id', $service_id)
                ->whereYear('visites.created_at', $annee)
                ->select('visites.*')
                ->get();
        }
        else{
            //echo "No data in the session";
            return Visite::all();
        }
        session_destroy();
        return $data;
    }

    public function headings(): array
    {
        return [
            'id',
            'Motifs',
            'Analyses',
            'Avis Medecin',
            'Date de Création',
            'Nom de Dossier',
        ];
    }
}
