<?php
// Start output buffering
ob_start();

// Start session before any output
if (session_status() === PHP_SESSION_NONE) {
    session_start();
}

$pageTitle = 'Manage Categories';
require_once __DIR__ . '/config/database.php';
require_once __DIR__ . '/includes/header.php';

$categories = $adminDb->getCategories();
?>

<div class="bg-white rounded-lg shadow-md p-6">
    <h3 class="text-2xl font-bold text-gray-900 mb-6">Service Categories</h3>
    
    <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-4">
        <?php foreach ($categories as $category): ?>
            <div class="border border-gray-200 rounded-lg p-4 hover:shadow-md transition-shadow">
                <h4 class="font-semibold text-gray-900 mb-2"><?php echo htmlspecialchars($category['name']); ?></h4>
                <?php if ($category['description']): ?>
                    <p class="text-sm text-gray-600 mb-2"><?php echo htmlspecialchars($category['description']); ?></p>
                <?php endif; ?>
                <p class="text-xs text-gray-500">Display Order: <?php echo $category['display_order']; ?></p>
            </div>
        <?php endforeach; ?>
    </div>
    
    <div class="mt-6 p-4 bg-blue-50 rounded-lg">
        <p class="text-sm text-blue-800">
            <i class="fas fa-info-circle mr-2"></i>
            Categories are managed through the database. To add or modify categories, please update the database directly or contact the system administrator.
        </p>
    </div>
</div>

<?php require_once __DIR__ . '/includes/footer.php'; ?>

