<?php

use App\Http\Controllers\SettingController;
use App\Http\Controllers\AmazonController;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

Route::prefix('v1')->group(function() {
    Route::post('get_setting_value', [SettingController::class, 'get_setting_value']);
    Route::post('get_products', [AmazonController::class, 'get_products']);
    Route::post('save_products', [AmazonController::class, 'save_products']);
});
