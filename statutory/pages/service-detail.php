<?php
require_once __DIR__ . '/../config/database.php';

// Set base path for assets and links
$basePath = '/statutory';
$scriptPath = dirname(dirname($_SERVER['SCRIPT_NAME']));
if ($scriptPath !== '/' && $scriptPath !== '') {
    $basePath = rtrim($scriptPath, '/');
}

$serviceId = $_GET['id'] ?? null;

if (!$serviceId) {
    header('Location: /');
    exit;
}

$db = Database::getInstance();
$service = $db->getServiceById($serviceId);

if (!$service) {
    header('Location: /');
    exit;
}

$packages = $db->getServicePackages($serviceId);
$packageIds = array_column($packages, 'id');
$allFeatures = $db->getPackageFeatures($packageIds);

// Group features by package
$packagesWithFeatures = [];
foreach ($packages as $pkg) {
    $pkgFeatures = array_filter($allFeatures, function($feature) use ($pkg) {
        return $feature['package_id'] === $pkg['id'];
    });
    $packagesWithFeatures[] = [
        'package' => $pkg,
        'features' => array_values($pkgFeatures)
    ];
}

$pageTitle = htmlspecialchars($service['name']) . ' - SilverWebBuzz';
require_once __DIR__ . '/../includes/header.php';
?>

<div class="min-h-screen bg-white">
    <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 py-12">
        <a href="/" class="flex items-center text-emerald-600 hover:text-emerald-700 mb-8">
            <i class="fas fa-arrow-left h-5 w-5 mr-2"></i>
            Back to Services
        </a>

        <div class="mb-12">
            <h1 class="text-5xl font-bold text-gray-900 mb-4"><?php echo htmlspecialchars($service['name']); ?></h1>
            <p class="text-xl text-gray-600 max-w-3xl">
                Get complete compliance and tax solutions tailored for your business needs
            </p>
        </div>

        <div class="grid grid-cols-1 lg:grid-cols-3 gap-8 mb-16">
            <?php if (!empty($packagesWithFeatures)): ?>
                <?php foreach ($packagesWithFeatures as $item): 
                    $pkg = $item['package'];
                    $features = $item['features'];
                    $isPopular = !empty($pkg['is_popular']);
                ?>
                    <div class="rounded-2xl overflow-hidden shadow-lg transition-all transform hover:scale-105 <?php echo $isPopular ? 'border-4 border-emerald-500 lg:scale-105 lg:shadow-2xl' : 'border border-gray-200'; ?>">
                        <?php if ($isPopular): ?>
                            <div class="bg-emerald-600 text-white text-center py-2 font-semibold">
                                Most Popular
                            </div>
                        <?php endif; ?>

                        <div class="p-8 bg-white">
                            <h3 class="text-2xl font-bold text-gray-900 mb-2"><?php echo htmlspecialchars($pkg['name']); ?></h3>
                            <?php if (!empty($pkg['description'])): ?>
                                <p class="text-gray-600 text-sm mb-4"><?php echo htmlspecialchars($pkg['description']); ?></p>
                            <?php endif; ?>

                            <div class="mb-8">
                                <div class="flex items-baseline">
                                    <span class="text-5xl font-bold text-gray-900">₹<?php echo number_format($pkg['price'], 0); ?></span>
                                </div>
                                <p class="text-gray-600 text-sm mt-2">All inclusive pricing</p>
                            </div>

                            <button class="w-full py-3 px-6 rounded-lg font-semibold transition-colors mb-8 <?php echo $isPopular ? 'bg-emerald-600 text-white hover:bg-emerald-700' : 'bg-gray-100 text-gray-900 hover:bg-gray-200'; ?>">
                                Choose This Plan
                            </button>

                            <div class="space-y-4">
                                <p class="font-semibold text-gray-900 mb-4">Package Includes:</p>
                                <?php if (!empty($features)): ?>
                                    <?php foreach ($features as $feature): ?>
                                        <div class="flex items-start">
                                            <i class="fas fa-check text-emerald-600 h-5 w-5 mr-3 flex-shrink-0 mt-0.5"></i>
                                            <span class="text-gray-700"><?php echo htmlspecialchars($feature['feature']); ?></span>
                                        </div>
                                    <?php endforeach; ?>
                                <?php else: ?>
                                    <p class="text-gray-500 text-sm">No features listed</p>
                                <?php endif; ?>
                            </div>
                        </div>
                    </div>
                <?php endforeach; ?>
            <?php else: ?>
                <div class="col-span-3 text-center py-12">
                    <p class="text-gray-600 mb-4">No packages available for this service yet.</p>
                    <p class="text-gray-500">Contact us for custom pricing</p>
                </div>
            <?php endif; ?>
        </div>

        <div class="bg-gradient-to-r from-emerald-50 to-blue-50 rounded-2xl p-12 text-center">
            <h2 class="text-3xl font-bold text-gray-900 mb-4">Still have questions?</h2>
            <p class="text-gray-600 mb-8 text-lg">Our expert team is here to help you choose the right package</p>
            <button class="bg-emerald-600 text-white px-8 py-4 rounded-lg hover:bg-emerald-700 transition-colors font-semibold inline-flex items-center">
                <i class="fas fa-phone h-5 w-5 mr-2"></i>
                Schedule a Consultation
            </button>
        </div>
    </div>
</div>

<?php include __DIR__ . '/../includes/footer.php'; ?>

