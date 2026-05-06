<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>{{ env('APP_NAME', 'Mighty School') }} — API Backend</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-gray-50 min-h-screen flex items-center justify-center p-6">
    <div class="max-w-2xl w-full">

        {{-- Header --}}
        <div class="text-center mb-8">
            <div class="inline-flex items-center justify-center w-16 h-16 bg-blue-600 rounded-2xl mb-4">
                <svg class="w-8 h-8 text-white" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                        d="M12 6.253v13m0-13C10.832 5.477 9.246 5 7.5 5S4.168 5.477 3 6.253v13C4.168 18.477 5.754 18 7.5 18s3.332.477 4.5 1.253m0-13C13.168 5.477 14.754 5 16.5 5c1.747 0 3.332.477 4.5 1.253v13C19.832 18.477 18.247 18 16.5 18c-1.746 0-3.332.477-4.5 1.253" />
                </svg>
            </div>
            <h1 class="text-3xl font-bold text-gray-900">{{ env('APP_NAME', 'Mighty School') }}</h1>
            <p class="text-gray-500 mt-1">School ERP — REST API Backend is running</p>
        </div>

        {{-- Status Card --}}
        <div class="bg-white rounded-2xl shadow-sm border border-gray-100 p-6 mb-4">
            <div class="flex items-center gap-3 mb-4">
                <span class="w-3 h-3 bg-green-500 rounded-full animate-pulse"></span>
                <span class="font-semibold text-gray-800">Server Status: Online</span>
            </div>
            <div class="grid grid-cols-2 gap-3 text-sm">
                <div class="bg-gray-50 rounded-lg p-3">
                    <div class="text-gray-400 text-xs mb-1">Environment</div>
                    <div class="font-medium text-gray-700">{{ env('APP_ENV', 'local') }}</div>
                </div>
                <div class="bg-gray-50 rounded-lg p-3">
                    <div class="text-gray-400 text-xs mb-1">Laravel Version</div>
                    <div class="font-medium text-gray-700">{{ app()->version() }}</div>
                </div>
                <div class="bg-gray-50 rounded-lg p-3">
                    <div class="text-gray-400 text-xs mb-1">PHP Version</div>
                    <div class="font-medium text-gray-700">{{ phpversion() }}</div>
                </div>
                <div class="bg-gray-50 rounded-lg p-3">
                    <div class="text-gray-400 text-xs mb-1">API Base URL</div>
                    <div class="font-medium text-gray-700">{{ url('/api') }}</div>
                </div>
            </div>
        </div>

        {{-- Login Info --}}
        <div class="bg-white rounded-2xl shadow-sm border border-gray-100 p-6 mb-4">
            <h2 class="font-semibold text-gray-800 mb-3">Login via API</h2>
            <div class="bg-gray-900 rounded-lg p-4 text-sm font-mono text-green-400 overflow-x-auto">
                <div class="text-gray-400 mb-1">POST {{ url('/api/login') }}</div>
                <div>{</div>
                <div class="pl-4">"email": "superadmin@gmail.com",</div>
                <div class="pl-4">"password": "123456"</div>
                <div>}</div>
            </div>
            <p class="text-xs text-gray-400 mt-2">Use the returned <code class="bg-gray-100 px-1 rounded">access_token</code> as <code class="bg-gray-100 px-1 rounded">Authorization: Bearer &lt;token&gt;</code> header.</p>
        </div>

        {{-- Default Accounts --}}
        <div class="bg-white rounded-2xl shadow-sm border border-gray-100 p-6">
            <h2 class="font-semibold text-gray-800 mb-3">Default Accounts (password: <code class="bg-gray-100 px-1 rounded text-blue-600">123456</code>)</h2>
            <div class="space-y-2 text-sm">
                @foreach([
                    ['SAAS Admin',   'saasadmin@gmail.com'],
                    ['Super Admin',  'superadmin@gmail.com'],
                    ['System Admin', 'systemadmin@gmail.com'],
                    ['Accountant',   'accountant@gmail.com'],
                    ['Librarian',    'librarian@gmail.com'],
                ] as [$role, $email])
                <div class="flex items-center justify-between bg-gray-50 rounded-lg px-3 py-2">
                    <span class="text-gray-500 w-32">{{ $role }}</span>
                    <span class="font-medium text-gray-800">{{ $email }}</span>
                </div>
                @endforeach
            </div>
        </div>

        <p class="text-center text-xs text-gray-400 mt-6">
            Connect your frontend app to <strong>{{ url('/api') }}</strong>
        </p>
    </div>
</body>
</html>
