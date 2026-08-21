<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\ChatController;/

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
*/

// Existing user route (default Laravel)
Route::get('/user', function (Request $request) {
    return $request->user();
})->middleware('auth:sanctum');

// 🟢 YOUR CHATBOT ROUTE
// This is the "door" your Flutter app will knock on
Route::post('/chat', [ChatController::class, 'sendMessage']);