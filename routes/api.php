<?php

use App\Http\Controllers\LanguageController;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Route;

Route::prefix('languages')->group(function () {
    Route::get('/', [LanguageController::class, 'index']);
    Route::post('/', [LanguageController::class, 'store']);
    Route::get('/export/{name}', [LanguageController::class, 'export']);
    Route::post('/update-key/{name}', [LanguageController::class, 'updateKey']);
    Route::post('/import/{name}', [LanguageController::class, 'import']);
    Route::post('/set-default/{name}', [LanguageController::class, 'setDefault']);
});

Route::get('/check-status', function () {
    try {
        DB::connection()->getPdo(); // test DB

        return response()->json([
            'status' => true,
            'message' => 'API and Database are working perfectly',
        ]);
    } catch (Exception $e) {
        return response()->json([
            'status' => false,
            'message' => $e->getMessage(),
        ]);
    }
});
