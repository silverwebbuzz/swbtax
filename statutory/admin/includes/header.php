<?php
// Ensure session is started before including auth
if (session_status() === PHP_SESSION_NONE) {
    session_start();
}

require_once __DIR__ . '/../config/auth.php';
requireAdminLogin();

$adminInfo = getAdminInfo();
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title><?php echo isset($pageTitle) ? $pageTitle . ' - ' : ''; ?>Admin Panel - SilverWebBuzz</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        .sidebar-active {
            background-color: #059669;
            color: white;
        }
    </style>
</head>
<body class="bg-gray-100">
    <!-- Sidebar -->
    <div class="fixed inset-y-0 left-0 w-64 bg-gray-900 text-white">
        <div class="flex items-center justify-center h-16 bg-gray-800">
            <h1 class="text-xl font-bold">
                <i class="fas fa-shield-alt mr-2"></i>Admin Panel
            </h1>
        </div>
        
        <nav class="mt-8">
            <a href="dashboard.php" class="flex items-center px-6 py-3 hover:bg-gray-800 transition-colors <?php echo basename($_SERVER['PHP_SELF']) == 'dashboard.php' ? 'sidebar-active' : ''; ?>">
                <i class="fas fa-tachometer-alt w-6"></i>
                <span class="ml-3">Dashboard</span>
            </a>
            
            <a href="services.php" class="flex items-center px-6 py-3 hover:bg-gray-800 transition-colors <?php echo basename($_SERVER['PHP_SELF']) == 'services.php' ? 'sidebar-active' : ''; ?>">
                <i class="fas fa-briefcase w-6"></i>
                <span class="ml-3">Services</span>
            </a>
            
            <a href="packages.php" class="flex items-center px-6 py-3 hover:bg-gray-800 transition-colors <?php echo basename($_SERVER['PHP_SELF']) == 'packages.php' ? 'sidebar-active' : ''; ?>">
                <i class="fas fa-box w-6"></i>
                <span class="ml-3">Packages</span>
            </a>
            
            <a href="categories.php" class="flex items-center px-6 py-3 hover:bg-gray-800 transition-colors <?php echo basename($_SERVER['PHP_SELF']) == 'categories.php' ? 'sidebar-active' : ''; ?>">
                <i class="fas fa-folder w-6"></i>
                <span class="ml-3">Categories</span>
            </a>
        </nav>
        
        <div class="absolute bottom-0 w-full p-4 border-t border-gray-800">
            <div class="flex items-center mb-4">
                <i class="fas fa-user-circle text-2xl mr-3"></i>
                <div>
                    <p class="font-semibold"><?php echo htmlspecialchars($adminInfo['username'] ?? 'Admin'); ?></p>
                    <p class="text-sm text-gray-400">Super Admin</p>
                </div>
            </div>
            <a href="logout.php" class="flex items-center text-red-400 hover:text-red-300 transition-colors">
                <i class="fas fa-sign-out-alt mr-2"></i>
                <span>Logout</span>
            </a>
        </div>
    </div>
    
    <!-- Main Content -->
    <div class="ml-64">
        <!-- Top Bar -->
        <header class="bg-white shadow-sm h-16 flex items-center justify-between px-8">
            <h2 class="text-2xl font-bold text-gray-800"><?php echo isset($pageTitle) ? $pageTitle : 'Dashboard'; ?></h2>
            <div class="flex items-center space-x-4">
                <a href="../" target="_blank" class="text-emerald-600 hover:text-emerald-700">
                    <i class="fas fa-external-link-alt mr-2"></i>View Website
                </a>
            </div>
        </header>
        
        <!-- Page Content -->
        <main class="p-8">

