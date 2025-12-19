<?php
// Set base path if not already set
if (!isset($basePath)) {
    $basePath = '/statutory';
    $scriptPath = dirname($_SERVER['SCRIPT_NAME']);
    if ($scriptPath !== '/' && $scriptPath !== '') {
        $basePath = rtrim($scriptPath, '/');
    }
}

// Fetch categories and services for footer
if (!isset($db)) {
    require_once __DIR__ . '/../config/database.php';
    $db = Database::getInstance();
}
$footerCategories = $db->getCategories();
$footerServices = $db->getServices();

// Group services by category for footer
$footerCategoriesWithServices = [];
foreach ($footerCategories as $category) {
    $categoryServices = array_filter($footerServices, function($service) use ($category) {
        return $service['category_id'] == $category['id'];
    });
    $categoryServicesArray = array_values($categoryServices);
    if (!empty($categoryServicesArray)) {
        $footerCategoriesWithServices[] = [
            'category' => $category,
            'services' => array_slice($categoryServicesArray, 0, 10), // Limit to 10 services per category in footer
            'total_count' => count($categoryServicesArray)
        ];
    }
}

// Get featured services
$featuredServices = array_filter($footerServices, function($service) {
    return !empty($service['is_featured']);
});
$featuredServices = array_slice(array_values($featuredServices), 0, 8);
?>

<footer class="bg-gray-900 text-gray-300">
    <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 py-12">
        <!-- Main Footer Content -->
        <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-8 mb-12">
            <!-- Company Info -->
            <div>
                <div class="flex items-center space-x-3 mb-4">
                    <i class="fas fa-building text-emerald-500 text-2xl"></i>
                    <div>
                        <h3 class="text-xl font-bold text-white">SilverWebBuzz</h3>
                        <p class="text-xs text-gray-400">silverwebbuzz.in</p>
                    </div>
                </div>
                <p class="text-sm mb-4">
                    Smart Compliance Solutions For Modern Businesses. One-stop solution for all your business compliance and tax needs across India.
                </p>
                <div class="flex space-x-4">
                    <a href="#" class="hover:text-emerald-500 transition-colors" aria-label="Facebook">
                        <i class="fab fa-facebook h-5 w-5"></i>
                    </a>
                    <a href="#" class="hover:text-emerald-500 transition-colors" aria-label="Twitter">
                        <i class="fab fa-twitter h-5 w-5"></i>
                    </a>
                    <a href="#" class="hover:text-emerald-500 transition-colors" aria-label="LinkedIn">
                        <i class="fab fa-linkedin h-5 w-5"></i>
                    </a>
                    <a href="#" class="hover:text-emerald-500 transition-colors" aria-label="Instagram">
                        <i class="fab fa-instagram h-5 w-5"></i>
                    </a>
                </div>
            </div>

            <!-- Popular Services -->
            <div>
                <h4 class="text-white font-semibold mb-4">Popular Services</h4>
                <ul class="space-y-2 text-sm">
                    <?php if (!empty($featuredServices)): ?>
                        <?php foreach ($featuredServices as $service): ?>
                            <li>
                                <a href="<?php echo $basePath; ?>/service.php?id=<?php echo $service['id']; ?>" 
                                   class="hover:text-emerald-500 transition-colors">
                                    <?php echo htmlspecialchars($service['name']); ?>
                                </a>
                            </li>
                        <?php endforeach; ?>
                    <?php else: ?>
                        <li><a href="<?php echo $basePath; ?>/service.php?id=1" class="hover:text-emerald-500 transition-colors">Private Limited Company Registration</a></li>
                        <li><a href="<?php echo $basePath; ?>/service.php?id=14" class="hover:text-emerald-500 transition-colors">GST Registration</a></li>
                        <li><a href="<?php echo $basePath; ?>/service.php?id=25" class="hover:text-emerald-500 transition-colors">Annual Filing</a></li>
                        <li><a href="<?php echo $basePath; ?>/service.php?id=37" class="hover:text-emerald-500 transition-colors">Trademark Registration</a></li>
                    <?php endif; ?>
                </ul>
            </div>

            <!-- Quick Links -->
            <div>
                <h4 class="text-white font-semibold mb-4">Quick Links</h4>
                <ul class="space-y-2 text-sm">
                    <li><a href="/#services" class="hover:text-emerald-500 transition-colors">All Services</a></li>
                    <li><a href="/#about" class="hover:text-emerald-500 transition-colors">About Us</a></li>
                    <li><a href="/#services" class="hover:text-emerald-500 transition-colors">Pricing</a></li>
                    <li><a href="#" class="hover:text-emerald-500 transition-colors">Resources</a></li>
                    <li><a href="#" class="hover:text-emerald-500 transition-colors">Blog</a></li>
                    <li><a href="#" class="hover:text-emerald-500 transition-colors">FAQs</a></li>
                    <li><a href="#" class="hover:text-emerald-500 transition-colors">Help Center</a></li>
                </ul>
            </div>

            <!-- Contact Us -->
            <div>
                <h4 class="text-white font-semibold mb-4">Contact Us</h4>
                <ul class="space-y-3 text-sm">
                    <li class="flex items-start">
                        <i class="fas fa-map-marker-alt h-5 w-5 mr-2 flex-shrink-0 text-emerald-500 mt-0.5"></i>
                        <span>India</span>
                    </li>
                    <li class="flex items-center">
                        <i class="fas fa-phone h-5 w-5 mr-2 text-emerald-500"></i>
                        <a href="tel:+91" class="hover:text-emerald-500 transition-colors">+91 XXX XXX XXXX</a>
                    </li>
                    <li class="flex items-center">
                        <i class="fas fa-envelope h-5 w-5 mr-2 text-emerald-500"></i>
                        <a href="mailto:info@silverwebbuzz.in" class="hover:text-emerald-500 transition-colors">
                            info@silverwebbuzz.in
                        </a>
                    </li>
                </ul>
            </div>
        </div>

        <!-- Services by Category -->
        <div class="border-t border-gray-800 pt-8 mb-8">
            <h4 class="text-white font-semibold mb-6 text-lg">All Services</h4>
            <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 xl:grid-cols-4 gap-8">
                <?php foreach ($footerCategoriesWithServices as $item): 
                    $category = $item['category'];
                    $services = $item['services'];
                ?>
                    <div>
                        <h5 class="text-white font-medium mb-3 text-sm">
                            <?php echo htmlspecialchars($category['name']); ?>
                        </h5>
                        <ul class="space-y-2 text-sm">
                            <?php foreach ($services as $service): ?>
                                <li>
                                    <a href="<?php echo $basePath; ?>/service.php?id=<?php echo $service['id']; ?>" 
                                       class="hover:text-emerald-500 transition-colors text-gray-400">
                                        <?php echo htmlspecialchars($service['name']); ?>
                                    </a>
                                </li>
                            <?php endforeach; ?>
                            <?php if (isset($item['total_count']) && $item['total_count'] > 10): ?>
                                <li>
                                    <a href="/#services" class="text-emerald-500 hover:text-emerald-400 transition-colors text-xs font-medium">
                                        View All →
                                    </a>
                                </li>
                            <?php endif; ?>
                        </ul>
                    </div>
                <?php endforeach; ?>
            </div>
        </div>

        <!-- Resources & Tools -->
        <div class="border-t border-gray-800 pt-8 mb-8">
            <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-8">
                <div>
                    <h5 class="text-white font-medium mb-3 text-sm">Resources</h5>
                    <ul class="space-y-2 text-sm text-gray-400">
                        <li><a href="#" class="hover:text-emerald-500 transition-colors">GST Resources</a></li>
                        <li><a href="#" class="hover:text-emerald-500 transition-colors">ITR Resources</a></li>
                        <li><a href="#" class="hover:text-emerald-500 transition-colors">Company Registration Guide</a></li>
                        <li><a href="#" class="hover:text-emerald-500 transition-colors">Tax Planning</a></li>
                        <li><a href="#" class="hover:text-emerald-500 transition-colors">Compliance Calendar</a></li>
                    </ul>
                </div>
                <div>
                    <h5 class="text-white font-medium mb-3 text-sm">Tools</h5>
                    <ul class="space-y-2 text-sm text-gray-400">
                        <li><a href="#" class="hover:text-emerald-500 transition-colors">GST Calculator</a></li>
                        <li><a href="#" class="hover:text-emerald-500 transition-colors">Tax Calculator</a></li>
                        <li><a href="#" class="hover:text-emerald-500 transition-colors">HSN Code Finder</a></li>
                        <li><a href="#" class="hover:text-emerald-500 transition-colors">GST Number Search</a></li>
                        <li><a href="#" class="hover:text-emerald-500 transition-colors">PAN Verification</a></li>
                    </ul>
                </div>
                <div>
                    <h5 class="text-white font-medium mb-3 text-sm">Company</h5>
                    <ul class="space-y-2 text-sm text-gray-400">
                        <li><a href="#" class="hover:text-emerald-500 transition-colors">About Us</a></li>
                        <li><a href="#" class="hover:text-emerald-500 transition-colors">Careers</a></li>
                        <li><a href="#" class="hover:text-emerald-500 transition-colors">Media & Press</a></li>
                        <li><a href="#" class="hover:text-emerald-500 transition-colors">Trust & Safety</a></li>
                        <li><a href="#" class="hover:text-emerald-500 transition-colors">Contact Us</a></li>
                    </ul>
                </div>
                <div>
                    <h5 class="text-white font-medium mb-3 text-sm">Support</h5>
                    <ul class="space-y-2 text-sm text-gray-400">
                        <li><a href="#" class="hover:text-emerald-500 transition-colors">Help Center</a></li>
                        <li><a href="#" class="hover:text-emerald-500 transition-colors">FAQs</a></li>
                        <li><a href="#" class="hover:text-emerald-500 transition-colors">Product Support</a></li>
                        <li><a href="#" class="hover:text-emerald-500 transition-colors">Live Chat</a></li>
                        <li><a href="#" class="hover:text-emerald-500 transition-colors">Ticket Support</a></li>
                    </ul>
                </div>
            </div>
        </div>

        <!-- Bottom Bar -->
        <div class="border-t border-gray-800 pt-8">
            <div class="flex flex-col md:flex-row justify-between items-center">
                <div class="mb-4 md:mb-0">
                    <p class="text-sm text-gray-400">
                        &copy; <?php echo date('Y'); ?> SilverWebBuzz. All rights reserved.
                    </p>
                    <p class="text-xs text-gray-500 mt-1">
                        Smart Compliance Solutions For Modern Businesses | 17 Categories | 80+ Services
                    </p>
                </div>
                <div class="flex flex-wrap gap-4 text-sm">
                    <a href="<?php echo $basePath; ?>/privacy-policy.php" class="hover:text-emerald-500 transition-colors text-gray-400">Privacy Policy</a>
                    <a href="<?php echo $basePath; ?>/terms-and-conditions.php" class="hover:text-emerald-500 transition-colors text-gray-400">Terms of Service</a>
                    <a href="<?php echo $basePath; ?>/refund-policy.php" class="hover:text-emerald-500 transition-colors text-gray-400">Refund Policy</a>
                </div>
            </div>
        </div>
    </div>
</footer>
</body>
</html>

