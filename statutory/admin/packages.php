<?php
$pageTitle = 'Manage Packages';
require_once __DIR__ . '/includes/header.php';
require_once __DIR__ . '/config/database.php';

$action = $_GET['action'] ?? 'list';
$packageId = $_GET['id'] ?? null;
$serviceId = $_GET['service_id'] ?? null;
$message = '';
$messageType = '';

// Handle form submissions
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $action = $_POST['action'] ?? 'list';
    
    if ($action === 'save') {
        $data = [
            'id' => $_POST['id'] ?? '',
            'service_id' => $_POST['service_id'] ?? '',
            'name' => $_POST['name'] ?? '',
            'price' => $_POST['price'] ?? 0,
            'description' => $_POST['description'] ?? null,
            'is_popular' => isset($_POST['is_popular']) ? 1 : 0,
            'display_order' => $_POST['display_order'] ?? 0
        ];
        
        if ($adminDb->savePackage($data)) {
            $message = 'Package saved successfully!';
            $messageType = 'success';
            $packageId = $data['id'] ?: $packageId;
            $action = 'edit';
        } else {
            $message = 'Error saving package. Please try again.';
            $messageType = 'error';
        }
    } elseif ($action === 'delete' && $packageId) {
        if ($adminDb->deletePackage($packageId)) {
            $message = 'Package deleted successfully!';
            $messageType = 'success';
        } else {
            $message = 'Error deleting package. Please try again.';
            $messageType = 'error';
        }
        $action = 'list';
    } elseif ($action === 'save_feature') {
        $data = [
            'id' => $_POST['feature_id'] ?? '',
            'package_id' => $_POST['package_id'] ?? '',
            'feature' => $_POST['feature'] ?? '',
            'display_order' => $_POST['feature_order'] ?? 0
        ];
        
        if ($adminDb->savePackageFeature($data)) {
            $message = 'Feature saved successfully!';
            $messageType = 'success';
            $packageId = $data['package_id'];
            $action = 'edit';
        } else {
            $message = 'Error saving feature. Please try again.';
            $messageType = 'error';
        }
    } elseif ($action === 'delete_feature') {
        $featureId = $_POST['feature_id'] ?? '';
        $packageId = $_POST['package_id'] ?? '';
        if ($adminDb->deletePackageFeature($featureId)) {
            $message = 'Feature deleted successfully!';
            $messageType = 'success';
            $action = 'edit';
        } else {
            $message = 'Error deleting feature. Please try again.';
            $messageType = 'error';
        }
    }
}

// Get all services for dropdown
$services = $adminDb->getServices();
$packages = [];
$package = null;
$features = [];

if ($action === 'list') {
    // Get all packages with service info
    $conn = $adminDb->getConnection();
    try {
        $stmt = $conn->prepare("
            SELECT p.*, s.name as service_name 
            FROM service_packages p 
            LEFT JOIN services s ON p.service_id = s.id 
            ORDER BY s.name, p.display_order
        ");
        $stmt->execute();
        $packages = $stmt->fetchAll();
    } catch(PDOException $e) {
        error_log("Error fetching packages: " . $e->getMessage());
    }
} elseif ($action === 'edit' && $packageId) {
    $package = $adminDb->getPackageById($packageId);
    if ($package) {
        $features = $adminDb->getPackageFeatures($packageId);
    } else {
        $action = 'list';
        $message = 'Package not found.';
        $messageType = 'error';
    }
} elseif ($action === 'add' && $serviceId) {
    // Pre-select service when adding
    $package = ['service_id' => $serviceId];
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
            <h3 class="text-2xl font-bold text-gray-900">All Packages</h3>
            <a href="?action=add" class="bg-emerald-600 text-white px-4 py-2 rounded-lg hover:bg-emerald-700 transition-colors">
                <i class="fas fa-plus mr-2"></i>Add New Package
            </a>
        </div>
        
        <div class="overflow-x-auto">
            <table class="min-w-full divide-y divide-gray-200">
                <thead class="bg-gray-50">
                    <tr>
                        <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Package Name</th>
                        <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Service</th>
                        <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Price</th>
                        <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Popular</th>
                        <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Order</th>
                        <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Actions</th>
                    </tr>
                </thead>
                <tbody class="bg-white divide-y divide-gray-200">
                    <?php foreach ($packages as $pkg): ?>
                        <tr>
                            <td class="px-6 py-4 whitespace-nowrap">
                                <div class="text-sm font-medium text-gray-900"><?php echo htmlspecialchars($pkg['name']); ?></div>
                            </td>
                            <td class="px-6 py-4 whitespace-nowrap">
                                <div class="text-sm text-gray-500"><?php echo htmlspecialchars($pkg['service_name'] ?? 'N/A'); ?></div>
                            </td>
                            <td class="px-6 py-4 whitespace-nowrap">
                                <div class="text-sm text-gray-900">₹<?php echo number_format($pkg['price'], 2); ?></div>
                            </td>
                            <td class="px-6 py-4 whitespace-nowrap">
                                <?php if ($pkg['is_popular']): ?>
                                    <span class="px-2 py-1 text-xs font-semibold rounded-full bg-emerald-100 text-emerald-800">Yes</span>
                                <?php else: ?>
                                    <span class="px-2 py-1 text-xs font-semibold rounded-full bg-gray-100 text-gray-800">No</span>
                                <?php endif; ?>
                            </td>
                            <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-500">
                                <?php echo $pkg['display_order']; ?>
                            </td>
                            <td class="px-6 py-4 whitespace-nowrap text-sm font-medium">
                                <a href="?action=edit&id=<?php echo $pkg['id']; ?>" class="text-blue-600 hover:text-blue-900 mr-4">
                                    <i class="fas fa-edit"></i> Edit
                                </a>
                                <a href="?action=delete&id=<?php echo $pkg['id']; ?>" 
                                   onclick="return confirm('Are you sure you want to delete this package?');"
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
    <div class="grid grid-cols-1 lg:grid-cols-2 gap-6">
        <!-- Package Form -->
        <div class="bg-white rounded-lg shadow-md p-6">
            <div class="flex justify-between items-center mb-6">
                <h3 class="text-xl font-bold text-gray-900">
                    <?php echo $package && isset($package['id']) ? 'Edit Package' : 'Add New Package'; ?>
                </h3>
                <a href="packages.php" class="text-gray-600 hover:text-gray-900">
                    <i class="fas fa-arrow-left mr-2"></i>Back
                </a>
            </div>
            
            <form method="POST" action="" class="space-y-4">
                <input type="hidden" name="action" value="save">
                <input type="hidden" name="id" value="<?php echo $package['id'] ?? ''; ?>">
                
                <div>
                    <label class="block text-sm font-medium text-gray-700 mb-2">Service *</label>
                    <select name="service_id" required class="w-full px-4 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-emerald-500">
                        <option value="">Select Service</option>
                        <?php foreach ($services as $svc): ?>
                            <option value="<?php echo $svc['id']; ?>" 
                                    <?php echo ($package['service_id'] ?? '') === $svc['id'] ? 'selected' : ''; ?>>
                                <?php echo htmlspecialchars($svc['name']); ?>
                            </option>
                        <?php endforeach; ?>
                    </select>
                </div>
                
                <div>
                    <label class="block text-sm font-medium text-gray-700 mb-2">Package Name *</label>
                    <input type="text" name="name" required 
                           value="<?php echo htmlspecialchars($package['name'] ?? ''); ?>"
                           class="w-full px-4 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-emerald-500">
                </div>
                
                <div>
                    <label class="block text-sm font-medium text-gray-700 mb-2">Price *</label>
                    <input type="number" name="price" required step="0.01"
                           value="<?php echo $package['price'] ?? ''; ?>"
                           class="w-full px-4 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-emerald-500">
                </div>
                
                <div>
                    <label class="block text-sm font-medium text-gray-700 mb-2">Description</label>
                    <textarea name="description" rows="3"
                              class="w-full px-4 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-emerald-500"><?php echo htmlspecialchars($package['description'] ?? ''); ?></textarea>
                </div>
                
                <div>
                    <label class="block text-sm font-medium text-gray-700 mb-2">Display Order</label>
                    <input type="number" name="display_order" 
                           value="<?php echo $package['display_order'] ?? 0; ?>"
                           class="w-full px-4 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-emerald-500">
                </div>
                
                <div class="flex items-center">
                    <input type="checkbox" name="is_popular" id="is_popular" value="1"
                           <?php echo ($package['is_popular'] ?? 0) ? 'checked' : ''; ?>
                           class="h-4 w-4 text-emerald-600 focus:ring-emerald-500 border-gray-300 rounded">
                    <label for="is_popular" class="ml-2 block text-sm text-gray-700">
                        Mark as Popular
                    </label>
                </div>
                
                <button type="submit" class="w-full px-6 py-2 bg-emerald-600 text-white rounded-lg hover:bg-emerald-700">
                    <i class="fas fa-save mr-2"></i>Save Package
                </button>
            </form>
        </div>
        
        <!-- Package Features (only show when editing) -->
        <?php if ($action === 'edit' && $package && isset($package['id'])): ?>
            <div class="bg-white rounded-lg shadow-md p-6">
                <h3 class="text-xl font-bold text-gray-900 mb-4">Package Features</h3>
                
                <!-- Add Feature Form -->
                <form method="POST" action="" class="mb-6 p-4 bg-gray-50 rounded-lg">
                    <input type="hidden" name="action" value="save_feature">
                    <input type="hidden" name="package_id" value="<?php echo $package['id']; ?>">
                    <input type="hidden" name="feature_id" value="" id="feature_id">
                    
                    <div class="space-y-3">
                        <div>
                            <label class="block text-sm font-medium text-gray-700 mb-1">Feature</label>
                            <input type="text" name="feature" id="feature_input" required
                                   class="w-full px-3 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-emerald-500">
                        </div>
                        <div>
                            <label class="block text-sm font-medium text-gray-700 mb-1">Order</label>
                            <input type="number" name="feature_order" id="feature_order" value="0"
                                   class="w-full px-3 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-emerald-500">
                        </div>
                        <button type="submit" class="w-full px-4 py-2 bg-blue-600 text-white rounded-lg hover:bg-blue-700">
                            <i class="fas fa-plus mr-2"></i>Add Feature
                        </button>
                    </div>
                </form>
                
                <!-- Features List -->
                <div class="space-y-2">
                    <?php foreach ($features as $feature): ?>
                        <div class="flex items-center justify-between p-3 bg-gray-50 rounded-lg">
                            <div class="flex-1">
                                <p class="text-sm font-medium text-gray-900"><?php echo htmlspecialchars($feature['feature']); ?></p>
                                <p class="text-xs text-gray-500">Order: <?php echo $feature['display_order']; ?></p>
                            </div>
                            <form method="POST" action="" class="inline">
                                <input type="hidden" name="action" value="delete_feature">
                                <input type="hidden" name="package_id" value="<?php echo $package['id']; ?>">
                                <input type="hidden" name="feature_id" value="<?php echo $feature['id']; ?>">
                                <button type="submit" onclick="return confirm('Delete this feature?');"
                                        class="text-red-600 hover:text-red-900">
                                    <i class="fas fa-trash"></i>
                                </button>
                            </form>
                        </div>
                    <?php endforeach; ?>
                    
                    <?php if (empty($features)): ?>
                        <p class="text-sm text-gray-500 text-center py-4">No features added yet. Add features above.</p>
                    <?php endif; ?>
                </div>
            </div>
        <?php endif; ?>
    </div>
<?php endif; ?>

<?php require_once __DIR__ . '/includes/footer.php'; ?>

