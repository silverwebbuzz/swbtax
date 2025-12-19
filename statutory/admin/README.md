# Admin Panel - SilverWebBuzz

## Setup Instructions

### 1. Create Admin User Table

Run the SQL from `database_schema.sql` (admin section) to create the `admin_users` table:

```sql
CREATE TABLE IF NOT EXISTS admin_users (
  id CHAR(36) PRIMARY KEY,
  username VARCHAR(100) UNIQUE NOT NULL,
  email VARCHAR(255),
  password VARCHAR(255) NOT NULL,
  status ENUM('active', 'inactive') DEFAULT 'active',
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
```

### 2. Create Default Admin User

The default credentials are:
- **Username:** `admin`
- **Password:** `admin123`

**IMPORTANT:** Change this password immediately after first login!

To create the admin user manually:
```sql
INSERT INTO admin_users (id, username, email, password, status) VALUES
('admin-001', 'admin', 'admin@silverwebbuzz.in', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'active');
```

To create a new admin user with a custom password:
```php
<?php
$password = password_hash('your_password_here', PASSWORD_DEFAULT);
// Then insert into database
?>
```

### 3. Access Admin Panel

Navigate to: `http://your-domain.com/statutory/admin/login.php`

## Features

### Dashboard
- Overview statistics (categories, services, packages, features)
- Quick action buttons

### Services Management
- View all services
- Add new services
- Edit existing services
- Delete services
- Filter by category

### Packages Management
- View all packages
- Add new packages
- Edit packages
- Manage package features
- Mark packages as popular
- Delete packages

### Categories
- View all categories
- (Categories are managed through database)

## File Structure

```
admin/
├── config/
│   ├── auth.php          # Authentication functions
│   └── database.php     # Database operations
├── includes/
│   ├── header.php       # Admin header with sidebar
│   └── footer.php       # Admin footer
├── pages/               # (Future: additional pages)
├── assets/              # CSS and JS files
├── login.php            # Admin login page
├── logout.php           # Logout handler
├── dashboard.php        # Admin dashboard
├── services.php         # Services management
├── packages.php         # Packages management
└── categories.php       # Categories view
```

## Security Notes

1. **Change Default Password:** Immediately change the default admin password
2. **HTTPS:** Use HTTPS in production
3. **Session Security:** Sessions are managed via PHP sessions
4. **Password Hashing:** Passwords are hashed using `password_hash()` with bcrypt
5. **SQL Injection:** All queries use prepared statements

## Adding New Admin Users

To add a new admin user, insert into the database:

```sql
INSERT INTO admin_users (id, username, email, password, status) 
VALUES (UUID(), 'newadmin', 'email@example.com', ?, 'active');
```

Where `?` is the hashed password generated using:
```php
password_hash('your_password', PASSWORD_DEFAULT)
```

