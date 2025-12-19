<?php
// Set base path for assets and links
if (!isset($basePath)) {
    $basePath = '/statutory';
    // Auto-detect base path if possible
    $scriptPath = dirname($_SERVER['SCRIPT_NAME']);
    if ($scriptPath !== '/' && $scriptPath !== '') {
        $basePath = rtrim($scriptPath, '/');
    }
}
?>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title><?php echo isset($pageTitle) ? $pageTitle : 'India Business Compliance & Tax Services'; ?></title>
    <meta name="description" content="Expert compliance and taxation services for Indian businesses. Company registration, GST, ITR, trademark, and more." />
    <meta property="og:image" content="https://bolt.new/static/og_default.png" />
    <meta name="twitter:card" content="summary_large_image" />
    <meta name="twitter:image" content="https://bolt.new/static/og_default.png" />
    
    <!-- Tailwind CSS CDN -->
    <script src="https://cdn.tailwindcss.com"></script>
    
    <!-- Custom CSS -->
    <link rel="stylesheet" href="<?php echo $basePath; ?>/assets/css/style.css">
    
    <!-- Lucide Icons (using CDN alternative) -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
</head>
<body>
    <header class="bg-white shadow-sm sticky top-0 z-50">
        <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
            <div class="flex justify-between items-center py-4">
                <a href="/" class="flex items-center space-x-3 cursor-pointer hover:opacity-80 transition-opacity">
                    <i class="fas fa-building text-emerald-600 text-2xl"></i>
                    <div>
                        <h1 class="text-2xl font-bold text-gray-900">SilverWebBuzz</h1>
                        <p class="text-xs text-gray-600">Compliance & Taxation Services</p>
                    </div>
                </a>

                <div class="hidden md:flex items-center space-x-6">
                    <a href="/#services" class="text-gray-700 hover:text-emerald-600 transition-colors">
                        Services
                    </a>
                    <a href="/#about" class="text-gray-700 hover:text-emerald-600 transition-colors">
                        About Us
                    </a>
                    <a href="/#contact" class="text-gray-700 hover:text-emerald-600 transition-colors">
                        Contact
                    </a>
                </div>

                <div class="flex items-center space-x-4">
                    <a href="tel:+91" class="hidden sm:flex items-center text-sm text-gray-700 hover:text-emerald-600">
                        <i class="fas fa-phone h-4 w-4 mr-1"></i>
                        <span>Call Us</span>
                    </a>
                    <button class="bg-emerald-600 text-white px-4 py-2 rounded-lg hover:bg-emerald-700 transition-colors text-sm font-medium">
                        Get Started
                    </button>
                </div>
            </div>
        </div>
    </header>

