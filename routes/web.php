<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\Auth\RegisterController;
use App\Http\Controllers\Auth\LoginController;
use App\Http\Controllers\WelcomeController;
use App\Http\Controllers\SettingController;
use App\Http\Controllers\AmazonController;
use App\Http\Controllers\QooController;
use App\Http\Controllers\MypageController;
use App\Http\Controllers\DownloadController;


// Homepage Route
Route::get('/', [WelcomeController::class, 'index'])->name('welcome');

// Authentication Routes
Route::get('/signup/{role?}', [RegisterController::class, 'index']);
Route::post('/register', [RegisterController::class, 'register'])->name('register');
Route::post('/login', [LoginController::class, 'login']);
Route::get('/loginview', [LoginController::class, 'loginview']);
Route::get('/logout', [LoginController::class, 'logout'])->name('logout');

// Main Routes
Route::group(['middleware' => ['auth']], function ()
{
    // exhibition setting
    Route::match(['get', 'post'], 'setting', [SettingController::class, 'index'])->name('setting');

    // Amazon products
    Route::get('amazon/view', [AmazonController::class, 'index'])->name('amazon.view');
    Route::get('amazon/list', [AmazonController::class, 'list'])->name('amazon.list');
    Route::post('amazon/destroy', [AmazonController::class, 'destroy'])->name('amazon.destroy');


    // Qoo10 products
    Route::get('qoo10/view', [QooController::class, 'index'])->name("qoo10.view");
    Route::get('qoo10/list', [QooController::class, 'list'])->name("qoo10.list");
    
    // User
    Route::post('change_pwd', [MypageController::class, 'change_pwd'])->name('change_pwd');
    Route::get('user/profile', [MypageController::class, 'profile'])->name("user.profile");

    // Python tool download
    Route::get('/download-zip', [DownloadController::class, 'download_zip'])->name('download.zip');
});

Route::middleware(['cors'])->group(function () {
    Route::get('http://localhost:32768/');
});
