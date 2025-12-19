<?php
/**
 * Admin Database Configuration
 * Uses the same database as main application
 */

require_once __DIR__ . '/../../config/database.php';

// Admin database methods
class AdminDatabase {
    private $conn;
    
    public function __construct() {
        $db = Database::getInstance();
        $this->conn = $db->getConnection();
    }
    
    public function getConnection() {
        return $this->conn;
    }
    
    public function getCategories() {
        try {
            $stmt = $this->conn->prepare("SELECT * FROM service_categories ORDER BY display_order");
            $stmt->execute();
            return $stmt->fetchAll();
        } catch(PDOException $e) {
            error_log("Error fetching categories: " . $e->getMessage());
            return [];
        }
    }
    
    public function getServices() {
        try {
            $stmt = $this->conn->prepare("SELECT * FROM services ORDER BY name");
            $stmt->execute();
            return $stmt->fetchAll();
        } catch(PDOException $e) {
            error_log("Error fetching services: " . $e->getMessage());
            return [];
        }
    }
    
    /**
     * Authenticate admin user
     */
    public function authenticateAdmin($username, $password) {
        try {
            $stmt = $this->conn->prepare("SELECT * FROM admin_users WHERE username = :username AND status = 'active'");
            $stmt->bindParam(':username', $username);
            $stmt->execute();
            $admin = $stmt->fetch();
            
            if ($admin && password_verify($password, $admin['password'])) {
                return $admin;
            }
            return null;
        } catch(PDOException $e) {
            error_log("Admin authentication error: " . $e->getMessage());
            return null;
        }
    }
    
    /**
     * Get all services with category info
     */
    public function getAllServicesWithCategory() {
        try {
            $stmt = $this->conn->prepare("
                SELECT s.*, sc.name as category_name 
                FROM services s 
                LEFT JOIN service_categories sc ON s.category_id = sc.id 
                ORDER BY sc.display_order, s.display_order
            ");
            $stmt->execute();
            return $stmt->fetchAll();
        } catch(PDOException $e) {
            error_log("Error fetching services: " . $e->getMessage());
            return [];
        }
    }
    
    /**
     * Get service by ID
     */
    public function getServiceById($id) {
        try {
            $stmt = $this->conn->prepare("SELECT * FROM services WHERE id = :id");
            $stmt->bindParam(':id', $id);
            $stmt->execute();
            return $stmt->fetch();
        } catch(PDOException $e) {
            error_log("Error fetching service: " . $e->getMessage());
            return null;
        }
    }
    
    /**
     * Create or update service
     */
    public function saveService($data) {
        try {
            if (empty($data['id'])) {
                // Create new service
                $id = $this->generateUUID();
                $stmt = $this->conn->prepare("
                    INSERT INTO services (id, category_id, name, description, price, price_text, is_featured, display_order) 
                    VALUES (:id, :category_id, :name, :description, :price, :price_text, :is_featured, :display_order)
                ");
                $stmt->bindParam(':id', $id);
            } else {
                // Update existing service
                $stmt = $this->conn->prepare("
                    UPDATE services SET 
                        category_id = :category_id, 
                        name = :name, 
                        description = :description, 
                        price = :price, 
                        price_text = :price_text, 
                        is_featured = :is_featured, 
                        display_order = :display_order 
                    WHERE id = :id
                ");
                $stmt->bindParam(':id', $data['id']);
            }
            
            $stmt->bindParam(':category_id', $data['category_id']);
            $stmt->bindParam(':name', $data['name']);
            $stmt->bindParam(':description', $data['description']);
            $stmt->bindParam(':price', $data['price']);
            $stmt->bindParam(':price_text', $data['price_text']);
            $stmt->bindParam(':is_featured', $data['is_featured']);
            $stmt->bindParam(':display_order', $data['display_order']);
            
            return $stmt->execute();
        } catch(PDOException $e) {
            error_log("Error saving service: " . $e->getMessage());
            return false;
        }
    }
    
    /**
     * Delete service
     */
    public function deleteService($id) {
        try {
            $stmt = $this->conn->prepare("DELETE FROM services WHERE id = :id");
            $stmt->bindParam(':id', $id);
            return $stmt->execute();
        } catch(PDOException $e) {
            error_log("Error deleting service: " . $e->getMessage());
            return false;
        }
    }
    
    /**
     * Get all packages for a service
     */
    public function getPackagesByServiceId($serviceId) {
        try {
            $stmt = $this->conn->prepare("SELECT * FROM service_packages WHERE service_id = :service_id ORDER BY display_order");
            $stmt->bindParam(':service_id', $serviceId);
            $stmt->execute();
            return $stmt->fetchAll();
        } catch(PDOException $e) {
            error_log("Error fetching packages: " . $e->getMessage());
            return [];
        }
    }
    
    /**
     * Get package by ID
     */
    public function getPackageById($id) {
        try {
            $stmt = $this->conn->prepare("SELECT * FROM service_packages WHERE id = :id");
            $stmt->bindParam(':id', $id);
            $stmt->execute();
            return $stmt->fetch();
        } catch(PDOException $e) {
            error_log("Error fetching package: " . $e->getMessage());
            return null;
        }
    }
    
    /**
     * Save package
     */
    public function savePackage($data) {
        try {
            if (empty($data['id'])) {
                $id = $this->generateUUID();
                $stmt = $this->conn->prepare("
                    INSERT INTO service_packages (id, service_id, name, price, description, is_popular, display_order) 
                    VALUES (:id, :service_id, :name, :price, :description, :is_popular, :display_order)
                ");
                $stmt->bindParam(':id', $id);
            } else {
                $stmt = $this->conn->prepare("
                    UPDATE service_packages SET 
                        service_id = :service_id, 
                        name = :name, 
                        price = :price, 
                        description = :description, 
                        is_popular = :is_popular, 
                        display_order = :display_order 
                    WHERE id = :id
                ");
                $stmt->bindParam(':id', $data['id']);
            }
            
            $stmt->bindParam(':service_id', $data['service_id']);
            $stmt->bindParam(':name', $data['name']);
            $stmt->bindParam(':price', $data['price']);
            $stmt->bindParam(':description', $data['description']);
            $stmt->bindParam(':is_popular', $data['is_popular']);
            $stmt->bindParam(':display_order', $data['display_order']);
            
            return $stmt->execute();
        } catch(PDOException $e) {
            error_log("Error saving package: " . $e->getMessage());
            return false;
        }
    }
    
    /**
     * Delete package
     */
    public function deletePackage($id) {
        try {
            $stmt = $this->conn->prepare("DELETE FROM service_packages WHERE id = :id");
            $stmt->bindParam(':id', $id);
            return $stmt->execute();
        } catch(PDOException $e) {
            error_log("Error deleting package: " . $e->getMessage());
            return false;
        }
    }
    
    /**
     * Get features for a package
     */
    public function getPackageFeatures($packageId) {
        try {
            $stmt = $this->conn->prepare("SELECT * FROM package_features WHERE package_id = :package_id ORDER BY display_order");
            $stmt->bindParam(':package_id', $packageId);
            $stmt->execute();
            return $stmt->fetchAll();
        } catch(PDOException $e) {
            error_log("Error fetching features: " . $e->getMessage());
            return [];
        }
    }
    
    /**
     * Save package feature
     */
    public function savePackageFeature($data) {
        try {
            if (empty($data['id'])) {
                $id = $this->generateUUID();
                $stmt = $this->conn->prepare("
                    INSERT INTO package_features (id, package_id, feature, display_order) 
                    VALUES (:id, :package_id, :feature, :display_order)
                ");
                $stmt->bindParam(':id', $id);
            } else {
                $stmt = $this->conn->prepare("
                    UPDATE package_features SET 
                        package_id = :package_id, 
                        feature = :feature, 
                        display_order = :display_order 
                    WHERE id = :id
                ");
                $stmt->bindParam(':id', $data['id']);
            }
            
            $stmt->bindParam(':package_id', $data['package_id']);
            $stmt->bindParam(':feature', $data['feature']);
            $stmt->bindParam(':display_order', $data['display_order']);
            
            return $stmt->execute();
        } catch(PDOException $e) {
            error_log("Error saving feature: " . $e->getMessage());
            return false;
        }
    }
    
    /**
     * Delete package feature
     */
    public function deletePackageFeature($id) {
        try {
            $stmt = $this->conn->prepare("DELETE FROM package_features WHERE id = :id");
            $stmt->bindParam(':id', $id);
            return $stmt->execute();
        } catch(PDOException $e) {
            error_log("Error deleting feature: " . $e->getMessage());
            return false;
        }
    }
    
    /**
     * Generate UUID (simple version for MySQL)
     */
    private function generateUUID() {
        return sprintf('%04x%04x-%04x-%04x-%04x-%04x%04x%04x',
            mt_rand(0, 0xffff), mt_rand(0, 0xffff),
            mt_rand(0, 0xffff),
            mt_rand(0, 0x0fff) | 0x4000,
            mt_rand(0, 0x3fff) | 0x8000,
            mt_rand(0, 0xffff), mt_rand(0, 0xffff), mt_rand(0, 0xffff)
        );
    }
}

$adminDb = new AdminDatabase();
?>

