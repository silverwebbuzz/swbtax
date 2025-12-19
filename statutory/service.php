<?php
// Service detail page router
$basePath = '/statutory';
$scriptPath = dirname($_SERVER['SCRIPT_NAME']);
if ($scriptPath !== '/' && $scriptPath !== '') {
    $basePath = rtrim($scriptPath, '/');
}

$serviceId = $_GET['id'] ?? null;

if (!$serviceId) {
    header('Location: /');
    exit;
}

require_once __DIR__ . '/pages/service-detail.php';
?>

