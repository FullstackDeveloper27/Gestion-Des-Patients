<?php

use App\Http\Controllers\VisiteController;
use Illuminate\Support\Facades\Route;
use TCG\Voyager\Facades\Voyager;
/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/', function () {
    return view('welcome');
});


Route::group(['prefix' => 'admin'], function () {
    Voyager::routes();
});

//Route::get('export-fichiers', [VisiteController::class, 'ExportView']);
Route::post('filtre' , [VisiteController::class , 'filtrage'])->name('filtre');
Route::post('export', [VisiteController::class, 'export'])->name('export');
Route::get('statistiques/{year}', [StatisticsController::class , '__invoke']); 
Route::get('/chart', [StatisticsController::class , 'index']);
