<?php
/**
 * Debug file - DELETE AFTER USE
 * Access: https://silverwebbuzz.in/statutory/admin/debug.php
 */

error_reporting(E_ALL);
ini_set('display_errors', 1);

echo "<h1>Admin Panel Debug</h1>";

// Test 1: Session
echo "<h2>1. Session Test</h2>";
session_start();
echo "Session ID: " . session_id() . "<br>";
echo "Session Data: <pre>";
print_r($_SESSION);
echo "</pre>";

// Test 2: Database Connection
echo "<h2>2. Database Connection Test</h2>";
try {
    require_once __DIR__ . '/config/database.php';
    echo "✓ Database config loaded<br>";
    
    $conn = $adminDb->getConnection();
    echo "✓ Database connection successful<br>";
    
    // Test query
    $stmt = $conn->query("SELECT COUNT(*) as count FROM service_categories");
    $result = $stmt->fetch();
    echo "✓ Query successful. Categories: " . $result['count'] . "<br>";
} catch (Exception $e) {
    echo "✗ Error: " . $e->getMessage() . "<br>";
}

// Test 3: Auth
echo "<h2>3. Auth Test</h2>";
require_once __DIR__ . '/config/auth.php';
echo "✓ Auth config loaded<br>";
echo "Is logged in: " . (isAdminLoggedIn() ? 'Yes' : 'No') . "<br>";
$info = getAdminInfo();
echo "Admin info: <pre>";
print_r($info);
echo "</pre>";

// Test 4: File Includes
echo "<h2>4. File Includes Test</h2>";
$files = [
    'config/database.php',
    'config/auth.php',
    'includes/header.php',
    'includes/footer.php'
];

foreach ($files as $file) {
    $path = __DIR__ . '/' . $file;
    if (file_exists($path)) {
        echo "✓ $file exists<br>";
    } else {
        echo "✗ $file NOT FOUND<br>";
    }
}

echo "<hr>";
echo "<p><strong>If you see this page, PHP is working. Check the errors above.</strong></p>";
echo "<p><a href='login.php'>Go to Login</a> | <a href='dashboard.php'>Go to Dashboard</a></p>";
?>

