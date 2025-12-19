<?php
require_once __DIR__ . '/config/database.php';
require_once __DIR__ . '/config/auth.php';

$error = '';

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $username = $_POST['username'] ?? '';
    $password = $_POST['password'] ?? '';
    
    if (!empty($username) && !empty($password)) {
        $admin = $adminDb->authenticateAdmin($username, $password);
        
        if ($admin) {
            $_SESSION['admin_id'] = $admin['id'];
            $_SESSION['admin_username'] = $admin['username'];
            $_SESSION['admin_email'] = $admin['email'] ?? '';
            header('Location: dashboard.php');
            exit;
        } else {
            $error = 'Invalid username or password';
        }
    } else {
        $error = 'Please enter both username and password';
    }
}

// Redirect if already logged in
if (isAdminLoggedIn()) {
    header('Location: dashboard.php');
    exit;
}
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Login - SilverWebBuzz</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
</head>
<body class="bg-gradient-to-br from-emerald-50 to-blue-50 min-h-screen flex items-center justify-center">
    <div class="bg-white rounded-2xl shadow-2xl p-8 w-full max-w-md">
        <div class="text-center mb-8">
            <i class="fas fa-shield-alt text-emerald-600 text-5xl mb-4"></i>
            <h1 class="text-3xl font-bold text-gray-900">Admin Login</h1>
            <p class="text-gray-600 mt-2">SilverWebBuzz Admin Panel</p>
        </div>
        
        <?php if ($error): ?>
            <div class="bg-red-50 border border-red-200 text-red-700 px-4 py-3 rounded mb-4">
                <i class="fas fa-exclamation-circle mr-2"></i><?php echo htmlspecialchars($error); ?>
            </div>
        <?php endif; ?>
        
        <form method="POST" action="" class="space-y-6">
            <div>
                <label for="username" class="block text-sm font-medium text-gray-700 mb-2">
                    <i class="fas fa-user mr-2 text-emerald-600"></i>Username
                </label>
                <input type="text" id="username" name="username" required
                       class="w-full px-4 py-3 border border-gray-300 rounded-lg focus:ring-2 focus:ring-emerald-500 focus:border-emerald-500"
                       placeholder="Enter your username">
            </div>
            
            <div>
                <label for="password" class="block text-sm font-medium text-gray-700 mb-2">
                    <i class="fas fa-lock mr-2 text-emerald-600"></i>Password
                </label>
                <input type="password" id="password" name="password" required
                       class="w-full px-4 py-3 border border-gray-300 rounded-lg focus:ring-2 focus:ring-emerald-500 focus:border-emerald-500"
                       placeholder="Enter your password">
            </div>
            
            <button type="submit" 
                    class="w-full bg-emerald-600 text-white py-3 rounded-lg hover:bg-emerald-700 transition-colors font-semibold text-lg">
                <i class="fas fa-sign-in-alt mr-2"></i>Login
            </button>
        </form>
        
        <div class="mt-6 text-center text-sm text-gray-600">
            <a href="../" class="text-emerald-600 hover:text-emerald-700">
                <i class="fas fa-arrow-left mr-2"></i>Back to Website
            </a>
        </div>
    </div>
</body>
</html>

