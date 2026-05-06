<?php

namespace App\Providers;

use Illuminate\Database\Eloquent\Factories\Factory;
use Illuminate\Database\Eloquent\Relations\Relation;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Schema;
use Illuminate\Support\ServiceProvider;
use Laravel\Passport\Passport;
use Modules\Elearning\Models\Lesson;
use Modules\QuestionBank\Models\Quiz;

class AppServiceProvider extends ServiceProvider
{
    /**
     * Register any application services.
     */
    public function register(): void
    {
        //
    }

    /**
     * Bootstrap any application services.
     */
    public function boot(): void
    {
        Relation::morphMap([
            'lesson' => Lesson::class,
            // 'quiz' => Quiz::class,
            // 'assignment' => Assignment::class,
            // 'pdf' => Pdf::class,
            // 'offline' => Offline::class,
        ]);

        Passport::personalAccessTokensExpireIn(now()->addMonths(1));

        // Ensure database is configured before running queries
        try {
            if (DB::connection()->getPdo()) {
                // Register factory namespace for the modular structure
                Factory::guessFactoryNamesUsing(function (string $modelName) {
                    return 'Modules\\Authentication\\Database\\Factories\\'.class_basename($modelName).'Factory';
                });
            }
        } catch (\Exception $e) {
            // ❌ Prevent crash when DB is not set up
        }

        Schema::defaultStringLength(191);
    }
}
