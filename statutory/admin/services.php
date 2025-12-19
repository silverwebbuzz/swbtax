<?php
// Start output buffering
ob_start();

// Start session before any output
if (session_status() === PHP_SESSION_NONE) {
    session_start();
}

$pageTitle = 'Manage Services';
require_once __DIR__ . '/config/database.php';
require_once __DIR__ . '/includes/header.php';

$action = $_GET['action'] ?? 'list';
$serviceId = $_GET['id'] ?? null;
$message = '';
$messageType = '';

// Handle form submissions
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $action = $_POST['action'] ?? 'list';
    
    if ($action === 'save') {
        $data = [
            'id' => $_POST['id'] ?? '',
            'category_id' => $_POST['category_id'] ?? '',
            'name' => $_POST['name'] ?? '',
            'description' => $_POST['description'] ?? '',
            'price' => !empty($_POST['price']) ? $_POST['price'] : null,
            'price_text' => $_POST['price_text'] ?? null,
            'is_featured' => isset($_POST['is_featured']) ? 1 : 0,
            'display_order' => $_POST['display_order'] ?? 0
        ];
        
        if ($adminDb->saveService($data)) {
            $message = 'Service saved successfully!';
            $messageType = 'success';
            $action = 'list';
        } else {
            $message = 'Error saving service. Please try again.';
            $messageType = 'error';
        }
    } elseif ($action === 'delete' && $serviceId) {
        if ($adminDb->deleteService($serviceId)) {
            $message = 'Service deleted successfully!';
            $messageType = 'success';
        } else {
            $message = 'Error deleting service. Please try again.';
            $messageType = 'error';
        }
        $action = 'list';
    }
}

// Get categories for dropdown
$categories = $adminDb->getCategories();
$services = $adminDb->getAllServicesWithCategory();
$service = null;

if ($action === 'edit' && $serviceId) {
    $service = $adminDb->getServiceById($serviceId);
    if (!$service) {
        $action = 'list';
        $message = 'Service not found.';
        $messageType = 'error';
    }
}
?>

<?php if ($message): ?>
    <div class="mb-4 p-4 rounded-lg <?php echo $messageType === 'success' ? 'bg-green-50 text-green-700 border border-green-200' : 'bg-red-50 text-red-700 border border-red-200'; ?>">
        <i class="fas <?php echo $messageType === 'success' ? 'fa-check-circle' : 'fa-exclamation-circle'; ?> mr-2"></i>
        <?php echo htmlspecialchars($message); ?>
    </div>
<?php endif; ?>

<?php if ($action === 'list'): ?>
    <div class="bg-white rounded-lg shadow-md p-6">
        <div class="flex justify-between items-center mb-6">
            <h3 class="text-2xl font-bold text-gray-900">All Services</h3>
            <a href="?action=add" class="bg-emerald-600 text-white px-4 py-2 rounded-lg hover:bg-emerald-700 transition-colors">
                <i class="fas fa-plus mr-2"></i>Add New Service
            </a>
        </div>
        
        <div class="overflow-x-auto">
            <table class="min-w-full divide-y divide-gray-200">
                <thead class="bg-gray-50">
                    <tr>
                        <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Name</th>
                        <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Category</th>
                        <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Price</th>
                        <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Featured</th>
                        <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Order</th>
                        <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Actions</th>
                    </tr>
                </thead>
                <tbody class="bg-white divide-y divide-gray-200">
                    <?php foreach ($services as $svc): ?>
                        <tr>
                            <td class="px-6 py-4 whitespace-nowrap">
                                <div class="text-sm font-medium text-gray-900"><?php echo htmlspecialchars($svc['name']); ?></div>
                            </td>
                            <td class="px-6 py-4 whitespace-nowrap">
                                <div class="text-sm text-gray-500"><?php echo htmlspecialchars($svc['category_name'] ?? 'N/A'); ?></div>
                            </td>
                            <td class="px-6 py-4 whitespace-nowrap">
                                <div class="text-sm text-gray-900">
                                    <?php 
                                    if (!empty($svc['price_text'])) {
                                        echo htmlspecialchars($svc['price_text']);
                                    } elseif (!empty($svc['price'])) {
                                        echo '₹' . number_format($svc['price'], 2);
                                    } else {
                                        echo 'Contact Us';
                                    }
                                    ?>
                                </div>
                            </td>
                            <td class="px-6 py-4 whitespace-nowrap">
                                <?php if ($svc['is_featured']): ?>
                                    <span class="px-2 py-1 text-xs font-semibold rounded-full bg-emerald-100 text-emerald-800">Yes</span>
                                <?php else: ?>
                                    <span class="px-2 py-1 text-xs font-semibold rounded-full bg-gray-100 text-gray-800">No</span>
                                <?php endif; ?>
                            </td>
                            <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-500">
                                <?php echo $svc['display_order']; ?>
                            </td>
                            <td class="px-6 py-4 whitespace-nowrap text-sm font-medium">
                                <a href="?action=edit&id=<?php echo $svc['id']; ?>" class="text-blue-600 hover:text-blue-900 mr-4">
                                    <i class="fas fa-edit"></i> Edit
                                </a>
                                <a href="?action=delete&id=<?php echo $svc['id']; ?>" 
                                   onclick="return confirm('Are you sure you want to delete this service?');"
                                   class="text-red-600 hover:text-red-900">
                                    <i class="fas fa-trash"></i> Delete
                                </a>
                            </td>
                        </tr>
                    <?php endforeach; ?>
                </tbody>
            </table>
        </div>
    </div>
<?php else: ?>
    <div class="bg-white rounded-lg shadow-md p-6">
        <div class="flex justify-between items-center mb-6">
            <h3 class="text-2xl font-bold text-gray-900">
                <?php echo $service ? 'Edit Service' : 'Add New Service'; ?>
            </h3>
            <a href="services.php" class="text-gray-600 hover:text-gray-900">
                <i class="fas fa-arrow-left mr-2"></i>Back to List
            </a>
        </div>
        
        <form method="POST" action="" class="space-y-6">
            <input type="hidden" name="action" value="save">
            <input type="hidden" name="id" value="<?php echo $service['id'] ?? ''; ?>">
            
            <div class="grid grid-cols-1 md:grid-cols-2 gap-6">
                <div>
                    <label class="block text-sm font-medium text-gray-700 mb-2">Category *</label>
                    <select name="category_id" required class="w-full px-4 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-emerald-500">
                        <option value="">Select Category</option>
                        <?php foreach ($categories as $cat): ?>
                            <option value="<?php echo $cat['id']; ?>" 
                                    <?php echo ($service['category_id'] ?? '') === $cat['id'] ? 'selected' : ''; ?>>
                                <?php echo htmlspecialchars($cat['name']); ?>
                            </option>
                        <?php endforeach; ?>
                    </select>
                </div>
                
                <div>
                    <label class="block text-sm font-medium text-gray-700 mb-2">Service Name *</label>
                    <input type="text" name="name" required 
                           value="<?php echo htmlspecialchars($service['name'] ?? ''); ?>"
                           class="w-full px-4 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-emerald-500">
                </div>
                
                <div class="md:col-span-2">
                    <label class="block text-sm font-medium text-gray-700 mb-2">Description</label>
                    <textarea name="description" rows="3"
                              class="w-full px-4 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-emerald-500"><?php echo htmlspecialchars($service['description'] ?? ''); ?></textarea>
                </div>
                
                <div>
                    <label class="block text-sm font-medium text-gray-700 mb-2">Price</label>
                    <input type="number" name="price" step="0.01"
                           value="<?php echo $service['price'] ?? ''; ?>"
                           class="w-full px-4 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-emerald-500"
                           placeholder="Leave empty if using price_text">
                </div>
                
                <div>
                    <label class="block text-sm font-medium text-gray-700 mb-2">Price Text</label>
                    <input type="text" name="price_text"
                           value="<?php echo htmlspecialchars($service['price_text'] ?? ''); ?>"
                           class="w-full px-4 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-emerald-500"
                           placeholder="e.g., Starting from ₹999">
                </div>
                
                <div>
                    <label class="block text-sm font-medium text-gray-700 mb-2">Display Order</label>
                    <input type="number" name="display_order" 
                           value="<?php echo $service['display_order'] ?? 0; ?>"
                           class="w-full px-4 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-emerald-500">
                </div>
                
                <div class="flex items-center">
                    <input type="checkbox" name="is_featured" id="is_featured" value="1"
                           <?php echo ($service['is_featured'] ?? 0) ? 'checked' : ''; ?>
                           class="h-4 w-4 text-emerald-600 focus:ring-emerald-500 border-gray-300 rounded">
                    <label for="is_featured" class="ml-2 block text-sm text-gray-700">
                        Featured Service
                    </label>
                </div>
            </div>
            
            <div class="flex justify-end space-x-4">
                <a href="services.php" class="px-6 py-2 border border-gray-300 rounded-lg text-gray-700 hover:bg-gray-50">
                    Cancel
                </a>
                <button type="submit" class="px-6 py-2 bg-emerald-600 text-white rounded-lg hover:bg-emerald-700">
                    <i class="fas fa-save mr-2"></i>Save Service
                </button>
            </div>
        </form>
    </div>
<?php endif; ?>

<?php require_once __DIR__ . '/includes/footer.php'; ?>

