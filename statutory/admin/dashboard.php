<?php
// Start output buffering
ob_start();

// Start session before any output
if (session_status() === PHP_SESSION_NONE) {
    session_start();
}

$pageTitle = 'Dashboard';
require_once __DIR__ . '/config/database.php';
require_once __DIR__ . '/includes/header.php';

// Get statistics
$stats = [
    'categories' => 0,
    'services' => 0,
    'packages' => 0,
    'features' => 0
];

try {
    $conn = $adminDb->getConnection();
    
    if ($conn) {
        $stmt = $conn->query("SELECT COUNT(*) as count FROM service_categories");
        $result = $stmt->fetch();
        $stats['categories'] = $result ? (int)$result['count'] : 0;
        
        $stmt = $conn->query("SELECT COUNT(*) as count FROM services");
        $result = $stmt->fetch();
        $stats['services'] = $result ? (int)$result['count'] : 0;
        
        $stmt = $conn->query("SELECT COUNT(*) as count FROM service_packages");
        $result = $stmt->fetch();
        $stats['packages'] = $result ? (int)$result['count'] : 0;
        
        $stmt = $conn->query("SELECT COUNT(*) as count FROM package_features");
        $result = $stmt->fetch();
        $stats['features'] = $result ? (int)$result['count'] : 0;
    }
} catch(PDOException $e) {
    error_log("Error fetching stats: " . $e->getMessage());
    // Keep default values on error
} catch(Exception $e) {
    error_log("Error in dashboard: " . $e->getMessage());
    // Keep default values on error
}
?>

<div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-6 mb-8">
    <div class="bg-white rounded-lg shadow-md p-6 border-l-4 border-emerald-600">
        <div class="flex items-center justify-between">
            <div>
                <p class="text-gray-600 text-sm font-medium">Categories</p>
                <p class="text-3xl font-bold text-gray-900 mt-2"><?php echo $stats['categories']; ?></p>
            </div>
            <i class="fas fa-folder text-emerald-600 text-4xl"></i>
        </div>
    </div>
    
    <div class="bg-white rounded-lg shadow-md p-6 border-l-4 border-blue-600">
        <div class="flex items-center justify-between">
            <div>
                <p class="text-gray-600 text-sm font-medium">Services</p>
                <p class="text-3xl font-bold text-gray-900 mt-2"><?php echo $stats['services']; ?></p>
            </div>
            <i class="fas fa-briefcase text-blue-600 text-4xl"></i>
        </div>
    </div>
    
    <div class="bg-white rounded-lg shadow-md p-6 border-l-4 border-purple-600">
        <div class="flex items-center justify-between">
            <div>
                <p class="text-gray-600 text-sm font-medium">Packages</p>
                <p class="text-3xl font-bold text-gray-900 mt-2"><?php echo $stats['packages']; ?></p>
            </div>
            <i class="fas fa-box text-purple-600 text-4xl"></i>
        </div>
    </div>
    
    <div class="bg-white rounded-lg shadow-md p-6 border-l-4 border-orange-600">
        <div class="flex items-center justify-between">
            <div>
                <p class="text-gray-600 text-sm font-medium">Package Features</p>
                <p class="text-3xl font-bold text-gray-900 mt-2"><?php echo $stats['features']; ?></p>
            </div>
            <i class="fas fa-list text-orange-600 text-4xl"></i>
        </div>
    </div>
</div>

<div class="bg-white rounded-lg shadow-md p-6">
    <h3 class="text-xl font-bold text-gray-900 mb-4">Quick Actions</h3>
    <div class="grid grid-cols-1 md:grid-cols-3 gap-4">
        <a href="services.php?action=add" class="flex items-center p-4 border border-gray-200 rounded-lg hover:border-emerald-500 hover:bg-emerald-50 transition-colors">
            <i class="fas fa-plus-circle text-emerald-600 text-2xl mr-4"></i>
            <div>
                <p class="font-semibold text-gray-900">Add New Service</p>
                <p class="text-sm text-gray-600">Create a new service</p>
            </div>
        </a>
        
        <a href="packages.php?action=add" class="flex items-center p-4 border border-gray-200 rounded-lg hover:border-blue-500 hover:bg-blue-50 transition-colors">
            <i class="fas fa-box text-blue-600 text-2xl mr-4"></i>
            <div>
                <p class="font-semibold text-gray-900">Add New Package</p>
                <p class="text-sm text-gray-600">Create a new package</p>
            </div>
        </a>
        
        <a href="categories.php" class="flex items-center p-4 border border-gray-200 rounded-lg hover:border-purple-500 hover:bg-purple-50 transition-colors">
            <i class="fas fa-folder text-purple-600 text-2xl mr-4"></i>
            <div>
                <p class="font-semibold text-gray-900">Manage Categories</p>
                <p class="text-sm text-gray-600">View and edit categories</p>
            </div>
        </a>
    </div>
</div>

<?php require_once __DIR__ . '/includes/footer.php'; ?>
