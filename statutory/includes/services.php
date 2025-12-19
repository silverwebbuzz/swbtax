<?php
require_once __DIR__ . '/../config/database.php';

$db = Database::getInstance();
$categories = $db->getCategories();
$allServices = $db->getServices();

// Group services by category
$categoriesWithServices = [];
foreach ($categories as $category) {
    $categoryServices = array_filter($allServices, function($service) use ($category) {
        return $service['category_id'] === $category['id'];
    });
    $categoriesWithServices[] = [
        'category' => $category,
        'services' => array_values($categoryServices)
    ];
}

// Icon mapping
$categoryIcons = [
    'For Indian Entrepreneur' => 'fa-building',
    'Tax Registrations' => 'fa-file-alt',
    'Returns' => 'fa-calculator',
    'Annual Filings' => 'fa-folder-open',
    'Change Services' => 'fa-edit',
    'Closure' => 'fa-times-circle',
    'Legal Drafting' => 'fa-file-edit',
    'Special' => 'fa-star',
    'Trademark' => 'fa-award',
    'Copyright' => 'fa-copyright',
    'Patent' => 'fa-lightbulb',
    'Accounting' => 'fa-book-open',
    'Payroll' => 'fa-users',
    'Digital Presence' => 'fa-globe',
];
?>

<section id="services" class="py-20 bg-white">
    <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
        <div class="text-center mb-16">
            <h2 class="text-4xl font-bold text-gray-900 mb-4">Our Services</h2>
            <p class="text-xl text-gray-600 max-w-3xl mx-auto">
                Comprehensive compliance and taxation solutions tailored for Indian businesses
            </p>
        </div>

        <div class="space-y-12">
            <?php if (empty($categoriesWithServices)): ?>
                <div class="text-center py-12">
                    <p class="text-gray-600">No services available at the moment. Please check back later.</p>
                </div>
            <?php else: ?>
                <?php foreach ($categoriesWithServices as $item): 
                    $category = $item['category'];
                    $services = $item['services'];
                    $iconClass = $categoryIcons[$category['name']] ?? 'fa-file-alt';
                ?>
                    <div class="bg-gradient-to-br from-gray-50 to-white rounded-2xl p-8 shadow-lg">
                        <div class="flex items-center mb-6">
                            <div class="bg-emerald-100 p-3 rounded-lg mr-4 text-emerald-600">
                                <i class="fas <?php echo $iconClass; ?> text-2xl"></i>
                            </div>
                            <div>
                                <h3 class="text-2xl font-bold text-gray-900"><?php echo htmlspecialchars($category['name']); ?></h3>
                                <?php if (!empty($category['description'])): ?>
                                    <p class="text-gray-600 mt-1"><?php echo htmlspecialchars($category['description']); ?></p>
                                <?php endif; ?>
                            </div>
                        </div>

                        <?php if (!empty($services)): ?>
                            <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-4">
                                <?php foreach ($services as $service): ?>
                                    <a href="/statutory/service.php?id=<?php echo urlencode($service['id']); ?>" 
                                       class="bg-white p-5 rounded-lg border border-gray-200 hover:border-emerald-500 hover:shadow-md transition-all group cursor-pointer block">
                                        <h4 class="font-semibold text-gray-900 mb-2 group-hover:text-emerald-600 transition-colors">
                                            <?php echo htmlspecialchars($service['name']); ?>
                                        </h4>
                                        <p class="text-emerald-600 font-medium text-sm">
                                            <?php 
                                            if (!empty($service['price_text'])) {
                                                echo htmlspecialchars($service['price_text']);
                                            } elseif (!empty($service['price'])) {
                                                echo '₹' . number_format($service['price'], 2);
                                            } else {
                                                echo 'Contact Us';
                                            }
                                            ?>
                                        </p>
                                    </a>
                                <?php endforeach; ?>
                            </div>
                        <?php else: ?>
                            <p class="text-gray-500 text-sm">No services available in this category.</p>
                        <?php endif; ?>
                    </div>
                <?php endforeach; ?>
            <?php endif; ?>
        </div>

        <div class="mt-16 text-center">
            <p class="text-gray-600 mb-6">
                Can't find what you're looking for? We offer customized solutions too!
            </p>
            <button class="bg-emerald-600 text-white px-8 py-3 rounded-lg hover:bg-emerald-700 transition-colors font-semibold">
                Request Custom Quote
            </button>
        </div>
    </div>
</section>

