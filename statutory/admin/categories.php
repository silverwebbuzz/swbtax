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

$message = '';
$messageType = '';

// Handle status toggle
if ($_SERVER['REQUEST_METHOD'] === 'POST' && isset($_POST['action']) && $_POST['action'] === 'toggle_status') {
    $categoryId = $_POST['category_id'] ?? '';
    if ($categoryId && $adminDb->toggleCategoryStatus($categoryId)) {
        $message = 'Category status updated successfully!';
        $messageType = 'success';
    } else {
        $message = 'Error updating category status. Please try again.';
        $messageType = 'error';
    }
}

// Get all categories (including inactive)
$conn = $adminDb->getConnection();
try {
    $stmt = $conn->prepare("SELECT * FROM service_categories ORDER BY display_order");
    $stmt->execute();
    $categories = $stmt->fetchAll();
} catch(PDOException $e) {
    error_log("Error fetching categories: " . $e->getMessage());
    $categories = [];
}
?>

<?php if ($message): ?>
    <div class="mb-4 p-4 rounded-lg <?php echo $messageType === 'success' ? 'bg-green-50 text-green-700 border border-green-200' : 'bg-red-50 text-red-700 border border-red-200'; ?>">
        <i class="fas <?php echo $messageType === 'success' ? 'fa-check-circle' : 'fa-exclamation-circle'; ?> mr-2"></i>
        <?php echo htmlspecialchars($message); ?>
    </div>
<?php endif; ?>

<div class="bg-white rounded-lg shadow-md p-6">
    <div class="flex justify-between items-center mb-6">
        <h3 class="text-2xl font-bold text-gray-900">Service Categories</h3>
    </div>
    
    <div class="overflow-x-auto">
        <table class="min-w-full divide-y divide-gray-200">
            <thead class="bg-gray-50">
                <tr>
                    <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Category Name</th>
                    <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Description</th>
                    <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Display Order</th>
                    <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Status</th>
                    <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Actions</th>
                </tr>
            </thead>
            <tbody class="bg-white divide-y divide-gray-200">
                <?php foreach ($categories as $category): 
                    $status = $category['status'] ?? 'active';
                    $isActive = $status === 'active';
                ?>
                    <tr>
                        <td class="px-6 py-4 whitespace-nowrap">
                            <div class="text-sm font-medium text-gray-900"><?php echo htmlspecialchars($category['name']); ?></div>
                        </td>
                        <td class="px-6 py-4">
                            <div class="text-sm text-gray-500"><?php echo htmlspecialchars($category['description'] ?? 'N/A'); ?></div>
                        </td>
                        <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-500">
                            <?php echo $category['display_order']; ?>
                        </td>
                        <td class="px-6 py-4 whitespace-nowrap">
                            <?php if ($isActive): ?>
                                <span class="px-2 py-1 text-xs font-semibold rounded-full bg-green-100 text-green-800">Active</span>
                            <?php else: ?>
                                <span class="px-2 py-1 text-xs font-semibold rounded-full bg-red-100 text-red-800">Inactive</span>
                            <?php endif; ?>
                        </td>
                        <td class="px-6 py-4 whitespace-nowrap text-sm font-medium">
                            <form method="POST" action="" class="inline">
                                <input type="hidden" name="action" value="toggle_status">
                                <input type="hidden" name="category_id" value="<?php echo $category['id']; ?>">
                                <button type="submit" 
                                        class="<?php echo $isActive ? 'text-orange-600 hover:text-orange-900' : 'text-green-600 hover:text-green-900'; ?>">
                                    <i class="fas <?php echo $isActive ? 'fa-toggle-on' : 'fa-toggle-off'; ?> mr-1"></i>
                                    <?php echo $isActive ? 'Deactivate' : 'Activate'; ?>
                                </button>
                            </form>
                        </td>
                    </tr>
                <?php endforeach; ?>
            </tbody>
        </table>
    </div>
    
    <div class="mt-6 p-4 bg-blue-50 rounded-lg">
        <p class="text-sm text-blue-800">
            <i class="fas fa-info-circle mr-2"></i>
            <strong>Note:</strong> Inactive categories will not be displayed on the frontend website. Only active categories and their services will be visible to visitors.
        </p>
    </div>
</div>

<?php require_once __DIR__ . '/includes/footer.php'; ?>

