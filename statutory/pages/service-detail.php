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
$serviceDetails = $db->getServiceDetails($serviceId);

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

// Parse documents, benefits, and FAQs
$documents = !empty($serviceDetails) && !empty($serviceDetails['documents_required']) ? explode('|', $serviceDetails['documents_required']) : [];
$benefits = !empty($serviceDetails) && !empty($serviceDetails['benefits']) ? explode('|', $serviceDetails['benefits']) : [];
$faqs = !empty($serviceDetails) && !empty($serviceDetails['faqs']) ? explode('|', $serviceDetails['faqs']) : [];
$faqPairs = [];
for ($i = 0; $i < count($faqs); $i += 2) {
    if (isset($faqs[$i + 1])) {
        $faqPairs[] = ['question' => $faqs[$i], 'answer' => $faqs[$i + 1]];
    }
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
            <?php if (!empty($serviceDetails) && !empty($serviceDetails['overview'])): ?>
                <p class="text-xl text-gray-600 max-w-3xl mb-6">
                    <?php echo htmlspecialchars($serviceDetails['overview']); ?>
                </p>
            <?php else: ?>
                <p class="text-xl text-gray-600 max-w-3xl mb-6">
                    Get complete compliance and tax solutions tailored for your business needs
                </p>
            <?php endif; ?>
            
            <?php if (!empty($serviceDetails) && !empty($serviceDetails['processing_time'])): ?>
                <div class="inline-flex items-center bg-emerald-50 text-emerald-700 px-6 py-3 rounded-lg border border-emerald-200">
                    <i class="fas fa-clock h-5 w-5 mr-2"></i>
                    <span class="font-semibold">Processing Time: </span>
                    <span class="ml-2"><?php echo htmlspecialchars($serviceDetails['processing_time']); ?></span>
                </div>
            <?php endif; ?>
        </div>

        <?php if (!empty($serviceDetails) && !empty($serviceDetails['full_description'])): ?>
        <div class="bg-white rounded-2xl shadow-lg p-8 mb-12">
            <h2 class="text-3xl font-bold text-gray-900 mb-6">About This Service</h2>
            <div class="prose max-w-none text-gray-700 leading-relaxed">
                <p class="text-lg"><?php echo nl2br(htmlspecialchars($serviceDetails['full_description'])); ?></p>
            </div>
        </div>
        <?php endif; ?>

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

        <?php if (!empty($benefits)): ?>
        <div class="bg-gradient-to-br from-emerald-50 to-blue-50 rounded-2xl shadow-lg p-8 mb-12">
            <h2 class="text-3xl font-bold text-gray-900 mb-6 flex items-center">
                <i class="fas fa-star text-emerald-600 h-8 w-8 mr-3"></i>
                Key Benefits
            </h2>
            <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-4">
                <?php foreach ($benefits as $benefit): ?>
                    <div class="flex items-start bg-white p-4 rounded-lg shadow-sm">
                        <i class="fas fa-check-circle text-emerald-600 h-5 w-5 mr-3 flex-shrink-0 mt-0.5"></i>
                        <span class="text-gray-700 font-medium"><?php echo htmlspecialchars(trim($benefit)); ?></span>
                    </div>
                <?php endforeach; ?>
            </div>
        </div>
        <?php endif; ?>

        <?php if (!empty($documents)): ?>
        <div class="bg-white rounded-2xl shadow-lg p-8 mb-12">
            <h2 class="text-3xl font-bold text-gray-900 mb-6 flex items-center">
                <i class="fas fa-file-alt text-blue-600 h-8 w-8 mr-3"></i>
                Documents Required
            </h2>
            <div class="grid grid-cols-1 md:grid-cols-2 gap-4">
                <?php foreach ($documents as $index => $doc): ?>
                    <div class="flex items-start bg-gray-50 p-4 rounded-lg">
                        <span class="flex-shrink-0 w-8 h-8 bg-blue-100 text-blue-600 rounded-full flex items-center justify-center font-semibold mr-3"><?php echo $index + 1; ?></span>
                        <span class="text-gray-700"><?php echo htmlspecialchars(trim($doc)); ?></span>
                    </div>
                <?php endforeach; ?>
            </div>
        </div>
        <?php endif; ?>

        <?php if (!empty($faqPairs)): ?>
        <div class="bg-white rounded-2xl shadow-lg p-8 mb-12">
            <h2 class="text-3xl font-bold text-gray-900 mb-6 flex items-center">
                <i class="fas fa-question-circle text-purple-600 h-8 w-8 mr-3"></i>
                Frequently Asked Questions
            </h2>
            <div class="space-y-4">
                <?php foreach ($faqPairs as $index => $faq): ?>
                    <div class="border border-gray-200 rounded-lg overflow-hidden">
                        <button class="faq-toggle w-full text-left p-5 bg-gray-50 hover:bg-gray-100 transition-colors flex items-center justify-between" onclick="toggleFaq(<?php echo $index; ?>)">
                            <span class="font-semibold text-gray-900 pr-4"><?php echo htmlspecialchars($faq['question']); ?></span>
                            <i class="fas fa-chevron-down faq-icon text-emerald-600 flex-shrink-0 transition-transform" id="faq-icon-<?php echo $index; ?>"></i>
                        </button>
                        <div class="faq-answer hidden p-5 bg-white border-t border-gray-200" id="faq-answer-<?php echo $index; ?>">
                            <p class="text-gray-700 leading-relaxed"><?php echo nl2br(htmlspecialchars($faq['answer'])); ?></p>
                        </div>
                    </div>
                <?php endforeach; ?>
            </div>
        </div>
        <?php endif; ?>

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

<script>
function toggleFaq(index) {
    const answer = document.getElementById('faq-answer-' + index);
    const icon = document.getElementById('faq-icon-' + index);
    
    if (answer.classList.contains('hidden')) {
        answer.classList.remove('hidden');
        icon.classList.add('rotate-180');
    } else {
        answer.classList.add('hidden');
        icon.classList.remove('rotate-180');
    }
}
</script>
    </div>
</div>

<?php include __DIR__ . '/../includes/footer.php'; ?>

