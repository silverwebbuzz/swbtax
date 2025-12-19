# SilverWebBuzz PHP Application

This is a PHP version of the SilverWebBuzz compliance and taxation services website.

## Project Structure

```
statutory/
├── assets/
│   ├── css/
│   │   └── style.css          # Custom CSS styles
│   └── js/                     # JavaScript files (if needed)
├── config/
│   └── database.php            # Database configuration and connection
├── includes/
│   ├── header.php              # Site header/navigation
│   ├── footer.php              # Site footer
│   ├── hero.php                # Hero section
│   └── services.php            # Services listing section
├── pages/
│   └── service-detail.php      # Service detail page
├── .htaccess                   # Apache URL rewriting rules
├── index.php                   # Home page
├── service.php                 # Service detail router
└── README.md                   # This file
```

## Setup Instructions

### 1. Database Configuration

Edit `config/database.php` and update the database credentials:

```php
define('DB_TYPE', 'pgsql'); // or 'mysql'
define('DB_HOST', 'your-db-host');
define('DB_NAME', 'your-db-name');
define('DB_USER', 'your-db-user');
define('DB_PASS', 'your-db-password');
define('DB_PORT', '5432'); // 5432 for PostgreSQL, 3306 for MySQL
```

### 2. Database Setup

Run the SQL migrations from the `supabase/migrations/` folder to create the necessary tables:
- `service_categories`
- `services`
- `service_packages`
- `package_features`
- `service_details`

### 3. Web Server Configuration

#### Apache
- Ensure `mod_rewrite` is enabled
- The `.htaccess` file is already configured for clean URLs

#### Nginx
If using Nginx, add this to your server block:

```nginx
location /php {
    try_files $uri $uri/ /statutory/index.php?$query_string;
}
```

### 4. File Permissions

Ensure PHP has read access to all files:
```bash
chmod -R 755 statutory/
```

## Features

- ✅ Responsive design with Tailwind CSS
- ✅ Clean URL routing
- ✅ Database-driven content
- ✅ Service categories and listings
- ✅ Service detail pages with packages
- ✅ Modular PHP structure
- ✅ Separate includes for reusable components

## Pages

- **Home Page** (`index.php`): Displays hero section and all services
- **Service Detail** (`service.php` or `pages/service-detail.php`): Shows service details and packages

## Customization

### Styling
- Main styles are in `assets/css/style.css`
- Tailwind CSS is loaded via CDN in `includes/header.php`
- You can customize colors, fonts, and layouts as needed

### Content
- All content is pulled from the database
- Update the database to change displayed content
- Service categories, services, packages, and features are all database-driven

## Requirements

- PHP 7.4 or higher
- PDO extension enabled
- PostgreSQL or MySQL database
- Apache with mod_rewrite (or Nginx with proper configuration)

## Notes

- The application uses prepared statements to prevent SQL injection
- All user input is sanitized using `htmlspecialchars()`
- Error logging is enabled for debugging (check PHP error logs)

## Support

For issues or questions, please contact the development team.

