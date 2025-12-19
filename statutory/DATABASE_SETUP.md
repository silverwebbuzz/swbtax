# MySQL Database Setup Instructions

## Quick Setup Steps

### 1. Create Database
```sql
CREATE DATABASE silverwebbuzz_in_statutory;
USE silverwebbuzz_in_statutory;
```

### 2. Run the Schema File
Open the file `database_schema.sql` and copy all its contents, then paste and execute it in your MySQL server (phpMyAdmin, MySQL Workbench, or command line).

### 3. Configure PHP Connection
Edit `config/database.php` and update these values:
```php
define('DB_HOST', 'localhost');                    // Your MySQL host
define('DB_NAME', 'silverwebbuzz_in_statutory');   // Your database name
define('DB_USER', 'silverwebbuzz_in_statutory');   // Your MySQL username
define('DB_PASS', 'Silver@1109$1234');             // Your MySQL password
```

### 4. Test Connection
Visit your website - if the database connection works, you'll see the services page. If not, check your credentials.

## Database Structure

The schema includes 5 main tables:
- **service_categories** - Service categories (e.g., "Tax Registrations", "Returns")
- **services** - Individual services within categories
- **service_packages** - Pricing packages for each service
- **package_features** - Features included in each package
- **service_details** - Detailed descriptions for services

## Sample Data

The SQL file includes sample data to help you get started. You can:
- Keep the sample data to test the website
- Delete the sample data and add your own
- Modify the sample data to match your needs

## Adding Your Own Data

When inserting new records, you'll need to generate UUIDs. You can use MySQL's UUID() function:
```sql
INSERT INTO service_categories (id, name, display_order) 
VALUES (UUID(), 'Your Category Name', 1);
```

Or let PHP generate them (the application handles this automatically when using the database class).

## Notes

- All tables use UTF8MB4 encoding for full Unicode support
- Foreign keys ensure data integrity
- Indexes are added for better query performance
- The schema includes sample data you can use for testing

