<?php
// Start output buffering
ob_start();

// Start session before any output
if (session_status() === PHP_SESSION_NONE) {
    session_start();
}

$pageTitle = 'Dashboard Test';
require_once __DIR__ . '/config/database.php';
require_once __DIR__ . '/includes/header.php';

echo "<h1>Dashboard Test - If you see this, header is working</h1>";

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
        echo "<p>Database connection: OK</p>";
        
        $stmt = $conn->query("SELECT COUNT(*) as count FROM service_categories");
        $result = $stmt->fetch();
        $stats['categories'] = $result ? (int)$result['count'] : 0;
        echo "<p>Categories query: OK - Count: " . $stats['categories'] . "</p>";
        
        $stmt = $conn->query("SELECT COUNT(*) as count FROM services");
        $result = $stmt->fetch();
        $stats['services'] = $result ? (int)$result['count'] : 0;
        echo "<p>Services query: OK - Count: " . $stats['services'] . "</p>";
        
        $stmt = $conn->query("SELECT COUNT(*) as count FROM service_packages");
        $result = $stmt->fetch();
        $stats['packages'] = $result ? (int)$result['count'] : 0;
        echo "<p>Packages query: OK - Count: " . $stats['packages'] . "</p>";
        
        $stmt = $conn->query("SELECT COUNT(*) as count FROM package_features");
        $result = $stmt->fetch();
        $stats['features'] = $result ? (int)$result['count'] : 0;
        echo "<p>Features query: OK - Count: " . $stats['features'] . "</p>";
    } else {
        echo "<p style='color:red;'>Database connection: FAILED</p>";
    }
} catch(PDOException $e) {
    echo "<p style='color:red;'>Database Error: " . htmlspecialchars($e->getMessage()) . "</p>";
} catch(Exception $e) {
    echo "<p style='color:red;'>Error: " . htmlspecialchars($e->getMessage()) . "</p>";
}

echo "<h2>Stats Array:</h2>";
echo "<pre>";
print_r($stats);
echo "</pre>";

echo "<h2>Testing Dashboard Content</h2>";
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

<?php require_once __DIR__ . '/includes/footer.php'; ?>

