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
    
    /**
     * Toggle category status (active/inactive)
     */
    public function toggleCategoryStatus($categoryId) {
        try {
            // Get current status
            $stmt = $this->conn->prepare("SELECT status FROM service_categories WHERE id = :id");
            $stmt->bindParam(':id', $categoryId, PDO::PARAM_INT);
            $stmt->execute();
            $category = $stmt->fetch();
            
            if ($category) {
                $newStatus = $category['status'] === 'active' ? 'inactive' : 'active';
                $updateStmt = $this->conn->prepare("UPDATE service_categories SET status = :status WHERE id = :id");
                $updateStmt->bindParam(':status', $newStatus);
                $updateStmt->bindParam(':id', $categoryId, PDO::PARAM_INT);
                return $updateStmt->execute();
            }
            return false;
        } catch(PDOException $e) {
            error_log("Error toggling category status: " . $e->getMessage());
            return false;
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
            
            if ($admin) {
                // Debug: Log password verification attempt
                error_log("Admin login attempt - Username: " . $username . ", Hash exists: " . (!empty($admin['password']) ? 'Yes' : 'No'));
                
                if (password_verify($password, $admin['password'])) {
                    return $admin;
                } else {
                    error_log("Password verification failed for user: " . $username);
                }
            } else {
                error_log("Admin user not found or inactive: " . $username);
            }
            return null;
        } catch(PDOException $e) {
            error_log("Admin authentication error: " . $e->getMessage());
            throw $e; // Re-throw to show error in login page
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
            $stmt->bindParam(':id', $id, PDO::PARAM_INT);
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
                $stmt = $this->conn->prepare("
                    INSERT INTO services (category_id, name, description, price, price_text, is_featured, display_order) 
                    VALUES (:category_id, :name, :description, :price, :price_text, :is_featured, :display_order)
                ");
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
                $stmt->bindParam(':id', $data['id'], PDO::PARAM_INT);
            }
            
            $stmt->bindParam(':category_id', $data['category_id'], PDO::PARAM_INT);
            $stmt->bindParam(':name', $data['name']);
            $stmt->bindParam(':description', $data['description']);
            $stmt->bindParam(':price', $data['price']);
            $stmt->bindParam(':price_text', $data['price_text']);
            $stmt->bindParam(':is_featured', $data['is_featured'], PDO::PARAM_BOOL);
            $stmt->bindParam(':display_order', $data['display_order'], PDO::PARAM_INT);
            
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
            $stmt->bindParam(':id', $id, PDO::PARAM_INT);
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
            $stmt->bindParam(':service_id', $serviceId, PDO::PARAM_INT);
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
            $stmt->bindParam(':id', $id, PDO::PARAM_INT);
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
                $stmt = $this->conn->prepare("
                    INSERT INTO service_packages (service_id, name, price, description, is_popular, display_order) 
                    VALUES (:service_id, :name, :price, :description, :is_popular, :display_order)
                ");
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
                $stmt->bindParam(':id', $data['id'], PDO::PARAM_INT);
            }
            
            $stmt->bindParam(':service_id', $data['service_id'], PDO::PARAM_INT);
            $stmt->bindParam(':name', $data['name']);
            $stmt->bindParam(':price', $data['price']);
            $stmt->bindParam(':description', $data['description']);
            $stmt->bindParam(':is_popular', $data['is_popular'], PDO::PARAM_BOOL);
            $stmt->bindParam(':display_order', $data['display_order'], PDO::PARAM_INT);
            
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
            $stmt->bindParam(':id', $id, PDO::PARAM_INT);
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
            $stmt->bindParam(':package_id', $packageId, PDO::PARAM_INT);
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
                $stmt = $this->conn->prepare("
                    INSERT INTO package_features (package_id, feature, display_order) 
                    VALUES (:package_id, :feature, :display_order)
                ");
            } else {
                $stmt = $this->conn->prepare("
                    UPDATE package_features SET 
                        package_id = :package_id, 
                        feature = :feature, 
                        display_order = :display_order 
                    WHERE id = :id
                ");
                $stmt->bindParam(':id', $data['id'], PDO::PARAM_INT);
            }
            
            $stmt->bindParam(':package_id', $data['package_id'], PDO::PARAM_INT);
            $stmt->bindParam(':feature', $data['feature']);
            $stmt->bindParam(':display_order', $data['display_order'], PDO::PARAM_INT);
            
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
            $stmt->bindParam(':id', $id, PDO::PARAM_INT);
            return $stmt->execute();
        } catch(PDOException $e) {
            error_log("Error deleting feature: " . $e->getMessage());
            return false;
        }
    }
    
}

$adminDb = new AdminDatabase();
