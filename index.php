<?php
$pageTitle = 'India Business Compliance & Tax Services';
// Set base path for assets and links - pointing to statutory folder
$basePath = '/statutory';

require_once __DIR__ . '/statutory/config/database.php';
require_once __DIR__ . '/statutory/includes/header.php';
?>

<div class="min-h-screen bg-white flex flex-col">
    <main class="flex-grow">
        <?php include __DIR__ . '/statutory/includes/hero.php'; ?>
        <?php include __DIR__ . '/statutory/includes/services.php'; ?>
    </main>
    <?php include __DIR__ . '/statutory/includes/footer.php'; ?>
</div>

