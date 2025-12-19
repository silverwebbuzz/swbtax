<?php
/**
 * Database Configuration
 * 
 * For Supabase (PostgreSQL):
 * - Use the Supabase connection string
 * 
 * For MySQL:
 * - Update the credentials below
 */

// Database configuration
define('DB_TYPE', 'mysql'); // 'pgsql' for Supabase/PostgreSQL or 'mysql' for MySQL
define('DB_HOST', 'localhost'); // Usually 'localhost' for MySQL
define('DB_NAME', 'silverwebbuzz_in_statutory'); // Your database name
define('DB_USER', 'silverwebbuzz_in_statutory'); // Your MySQL username
define('DB_PASS', 'Silver@1109$1234'); // Your MySQL password
define('DB_PORT', '3306'); // 5432 for PostgreSQL, 3306 for MySQL

// Supabase specific (if using Supabase)
define('SUPABASE_URL', 'your-supabase-url');
define('SUPABASE_KEY', 'your-supabase-anon-key');

class Database {
    private static $instance = null;
    private $conn;

    private function __construct() {
        try {
            if (DB_TYPE === 'pgsql') {
                $dsn = "pgsql:host=" . DB_HOST . ";port=" . DB_PORT . ";dbname=" . DB_NAME;
            } else {
                $dsn = "mysql:host=" . DB_HOST . ";port=" . DB_PORT . ";dbname=" . DB_NAME . ";charset=utf8mb4";
            }
            
            $this->conn = new PDO($dsn, DB_USER, DB_PASS);
            $this->conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
            $this->conn->setAttribute(PDO::ATTR_DEFAULT_FETCH_MODE, PDO::FETCH_ASSOC);
        } catch(PDOException $e) {
            error_log("Database connection failed: " . $e->getMessage());
            die("Database connection failed. Please check your configuration.");
        }
    }

    public static function getInstance() {
        if (self::$instance === null) {
            self::$instance = new self();
        }
        return self::$instance;
    }

    public function getConnection() {
        return $this->conn;
    }

    /**
     * Fetch all service categories (only active ones for frontend)
     */
    public function getCategories() {
        try {
            $stmt = $this->conn->prepare("SELECT * FROM service_categories WHERE status = 'active' ORDER BY display_order ASC");
            $stmt->execute();
            return $stmt->fetchAll();
        } catch(PDOException $e) {
            error_log("Error fetching categories: " . $e->getMessage());
            return [];
        }
    }

    /**
     * Fetch all services
     */
    public function getServices() {
        try {
            $stmt = $this->conn->prepare("SELECT * FROM services ORDER BY display_order ASC");
            $stmt->execute();
            return $stmt->fetchAll();
        } catch(PDOException $e) {
            error_log("Error fetching services: " . $e->getMessage());
            return [];
        }
    }

    /**
     * Fetch services by category
     */
    public function getServicesByCategory($categoryId) {
        try {
            $stmt = $this->conn->prepare("SELECT * FROM services WHERE category_id = :category_id ORDER BY display_order ASC");
            $stmt->bindParam(':category_id', $categoryId, PDO::PARAM_INT);
            $stmt->execute();
            return $stmt->fetchAll();
        } catch(PDOException $e) {
            error_log("Error fetching services by category: " . $e->getMessage());
            return [];
        }
    }

    /**
     * Fetch service by ID
     */
    public function getServiceById($serviceId) {
        try {
            $stmt = $this->conn->prepare("SELECT * FROM services WHERE id = :id");
            $stmt->bindParam(':id', $serviceId, PDO::PARAM_INT);
            $stmt->execute();
            return $stmt->fetch();
        } catch(PDOException $e) {
            error_log("Error fetching service: " . $e->getMessage());
            return null;
        }
    }

    /**
     * Fetch packages for a service
     */
    public function getServicePackages($serviceId) {
        try {
            $stmt = $this->conn->prepare("SELECT * FROM service_packages WHERE service_id = :service_id ORDER BY display_order ASC");
            $stmt->bindParam(':service_id', $serviceId, PDO::PARAM_INT);
            $stmt->execute();
            return $stmt->fetchAll();
        } catch(PDOException $e) {
            error_log("Error fetching packages: " . $e->getMessage());
            return [];
        }
    }

    /**
     * Fetch features for packages
     */
    public function getPackageFeatures($packageIds) {
        if (empty($packageIds)) {
            return [];
        }
        
        try {
            // Convert all IDs to integers
            $packageIds = array_map('intval', $packageIds);
            $placeholders = implode(',', array_fill(0, count($packageIds), '?'));
            $stmt = $this->conn->prepare("SELECT * FROM package_features WHERE package_id IN ($placeholders) ORDER BY display_order ASC");
            $stmt->execute($packageIds);
            return $stmt->fetchAll();
        } catch(PDOException $e) {
            error_log("Error fetching features: " . $e->getMessage());
            return [];
        }
    }
}

// Initialize database connection
$db = Database::getInstance();
