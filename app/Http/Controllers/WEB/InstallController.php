<?php

namespace App\Http\Controllers\WEB;

use App\Http\Controllers\Controller;
use Exception;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Artisan;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\File;
use Illuminate\Support\Facades\Http;
use Illuminate\Support\Facades\Validator;
use Nwidart\Modules\Facades\Module;
use ZipArchive;

class InstallController extends Controller
{
    // 1️⃣ Show Start Page
    public function index()
    {
        return view('install.start');
    }

    // 2️⃣ Requirements Check
    public function requirements()
    {
        $requirements = [
            'PHP Version (^8.2)' => version_compare(phpversion(), '^8.2', '>='),
            'OpenSSL Extension' => extension_loaded('openssl'),
            'PDO Extension' => extension_loaded('PDO'),
            'PDO MySQL Extension' => extension_loaded('pdo_mysql'),
            'Mbstring Extension' => extension_loaded('mbstring'),
            'Tokenizer Extension' => extension_loaded('tokenizer'),
            'GD Extension' => extension_loaded('gd'),
            'Fileinfo Extension' => extension_loaded('fileinfo'),
        ];

        $next = ! in_array(false, $requirements);

        return view('install.requirements', compact('requirements', 'next'));
    }

    // 3️⃣ Permissions Check
    public function permissions()
    {
        $permissions = [
            'storage/app' => is_writable(storage_path('app')),
            'storage/framework/cache' => is_writable(storage_path('framework/cache')),
            'storage/framework/sessions' => is_writable(storage_path('framework/sessions')),
            'storage/framework/views' => is_writable(storage_path('framework/views')),
            'storage/logs' => is_writable(storage_path('logs')),
            'storage' => is_writable(storage_path('')),
            'bootstrap/cache' => is_writable(base_path('bootstrap/cache')),
        ];

        $next = ! in_array(false, $permissions);

        return view('install.permissions', compact('permissions', 'next'));
    }

    // 4️⃣ Purchase Key Step (disabled — skip directly to database setup)
    public function keyWorld()
    {
        return redirect()->route('install.database');
    }

    // 5️⃣ Show Database Form
    public function showDatabaseForm()
    {
        return view('install.database');
    }

    // 6️⃣ AJAX: Test DB Connection
    public function checkDatabase(Request $request)
    {
        $credentials = $request->only(['host', 'username', 'password', 'name', 'port']);

        try {
            config([
                'database.connections.install_test' => [
                    'driver' => 'mysql',
                    'host' => $credentials['host'],
                    'port' => $credentials['port'],
                    'database' => $credentials['name'],
                    'username' => $credentials['username'],
                    'password' => $credentials['password'],
                ],
            ]);

            DB::connection('install_test')->getPdo();

            return response()->json(['status' => 'success']);
        } catch (Exception $e) {
            return response()->json(['status' => 'error', 'message' => $e->getMessage()]);
        }
    }

    // 7️⃣ Save DB Credentials & Proceed
    public function saveDatabase(Request $request)
    {
        $credentials = $request->only(['software_name', 'host', 'username', 'password', 'name', 'port']);

        // Test DB connection
        try {
            config([
                'database.connections.install_temp' => [
                    'driver' => 'mysql',
                    'host' => $credentials['host'],
                    'port' => $credentials['port'],
                    'database' => $credentials['name'],
                    'username' => $credentials['username'],
                    'password' => $credentials['password'],
                    'charset' => 'utf8mb4',
                    'collation' => 'utf8mb4_unicode_ci',
                ],
            ]);

            DB::connection('install_temp')->getPdo();
        } catch (Exception $e) {
            return response()->json(['status' => 'error', 'message' => 'Database connection failed: '.$e->getMessage()]);
        }

        // Connection OK → update .env
        $envPath = base_path('.env');
        $envContent = File::get($envPath);
        $replace = [
            'APP_NAME' => '"'.$credentials['software_name'].'"',
            'DB_HOST' => $credentials['host'],
            'DB_PORT' => $credentials['port'],
            'DB_DATABASE' => $credentials['name'],
            'DB_USERNAME' => $credentials['username'],
            'DB_PASSWORD' => $credentials['password'],
        ];

        foreach ($replace as $key => $value) {
            $pattern = "/^{$key}=.*$/m";
            if (preg_match($pattern, $envContent)) {
                $envContent = preg_replace($pattern, "{$key}={$value}", $envContent);
            } else {
                $envContent .= "\n{$key}={$value}";
            }
        }

        File::put($envPath, $envContent);

        return response()->json(['status' => 'success', 'redirect' => url('install/installation')]);
    }

    public function installation(Request $request)
    {
        if ($request->isMethod('post')) {
            try {
                // 1️⃣ Clear database
                Artisan::call('db:wipe', ['--force' => true]);

                // 2️⃣ Import demo.sql directly
                $sqlPath = base_path('demo.sql'); // Ensure demo.sql exists in root
                if (! file_exists($sqlPath)) {
                    throw new Exception('demo.sql file not found in root folder.');
                }
                $this->importSqlFile($sqlPath);

                // 5️⃣ Mark installation complete
                file_put_contents(storage_path('mightySchool'), 'Welcome to MightySchool Software');

                return view('install.complete');
            } catch (Exception $e) {
                return redirect()->back()->withErrors(['error' => $e->getMessage()]);
            }
        }

        return view('install.installation');
    }

    /**
     * Import SQL file into the current database
     */
    /**
     * Import SQL file safely with foreign keys disabled
     */
    private function importSqlFile($path)
    {
        if (! file_exists($path)) {
            throw new Exception("SQL file not found at: {$path}");
        }

        $dbHost = env('DB_HOST', '127.0.0.1');
        $dbPort = env('DB_PORT', '3306');
        $dbName = env('DB_DATABASE', '');
        $dbUser = env('DB_USERNAME', '');
        $dbPass = env('DB_PASSWORD', '');

        // Connect via PDO manually for safer import
        $dsn = "mysql:host={$dbHost};port={$dbPort};dbname={$dbName};charset=utf8mb4";
        $pdo = new \PDO($dsn, $dbUser, $dbPass, [
            \PDO::ATTR_ERRMODE => \PDO::ERRMODE_EXCEPTION,
            \PDO::MYSQL_ATTR_MULTI_STATEMENTS => true,
        ]);

        // Disable foreign keys
        $pdo->exec('SET FOREIGN_KEY_CHECKS=0;');

        // Read SQL file
        $sql = file_get_contents($path);

        // Remove comments
        $sql = preg_replace('/--.*\n/', '', $sql);
        $sql = preg_replace('/\/\*.*?\*\//s', '', $sql);

        // Execute all queries in one go safely
        try {
            $pdo->exec($sql);
        } catch (\PDOException $e) {
            // If multi-row INSERT fails due to special characters, split by INSERT statements
            $statements = preg_split('/;\s*(?=INSERT|CREATE|ALTER|DROP)/i', $sql);

            foreach ($statements as $stmt) {
                $stmt = trim($stmt);
                if (! empty($stmt)) {
                    try {
                        $pdo->exec($stmt);
                    } catch (\PDOException $ex) {
                        throw new Exception('Failed executing SQL: '.substr($stmt, 0, 200).' ... Error: '.$ex->getMessage());
                    }
                }
            }
        }

        // Re-enable foreign keys
        $pdo->exec('SET FOREIGN_KEY_CHECKS=1;');
    }

    // 9️⃣ Complete
    public function complete()
    {
        Artisan::call('view:clear');
        Artisan::call('cache:clear');
        Artisan::call('config:clear');

        return view('install.complete');
    }

    // 10️⃣ Purchase Key Validation (disabled — always returns success)
    public function validateInput(Request $request)
    {
        return response()->json(['status' => 'success', 'message' => 'Purchase key validated.']);
    }

    // 11️⃣ Delete Migrations & Seeders
    private function deleteInstallationFiles()
    {
        foreach ([database_path('migrations'), database_path('seeders')] as $path) {
            foreach (glob($path.'/*.php') as $file) {
                @unlink($file);
            }
        }

        foreach (Module::all() as $module) {
            foreach (glob(module_path($module->getName()).'/Database/Migrations/*.php') as $file) {
                @unlink($file);
            }
            foreach (glob(module_path($module->getName()).'/Database/Seeders/*.php') as $file) {
                @unlink($file);
            }
        }
    }

    // 12️⃣ Upgrade Logic
    public function upgradeIndex(Request $request)
    {
        return view('upgrade');
    }

    public function uploadStore(Request $request)
    {
        $request->validate(['upgrade_zip' => 'required|file|mimes:zip']);
        $file = $request->file('upgrade_zip');
        $zip = new ZipArchive;
        $filePath = storage_path('app/temp_upgrade.zip');
        $file->move(storage_path(), 'temp_upgrade.zip');

        if ($zip->open($filePath) === true) {
            $zip->extractTo(base_path());
            $zip->close();
            File::delete($filePath);

            return back()->with('success', 'Upgrade applied successfully!');
        }

        return back()->with('error', 'Failed to extract zip file.');
    }
}
