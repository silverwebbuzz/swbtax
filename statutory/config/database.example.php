<?php
/**
 * Database Configuration Example
 * 
 * Copy this file to database.php and update with your actual credentials
 */

// Database configuration
define('DB_TYPE', 'mysql'); // 'pgsql' for Supabase/PostgreSQL or 'mysql' for MySQL
define('DB_HOST', 'localhost'); // Usually 'localhost' for MySQL
define('DB_NAME', 'silverwebbuzz_in_statutory'); // Your database name
define('DB_USER', 'silverwebbuzz_in_statutory'); // Your MySQL username
define('DB_PASS', 'Silver@1109$1234'); // Your MySQL password
define('DB_PORT', '3306'); // 5432 for PostgreSQL, 3306 for MySQL

// Supabase specific (if using Supabase)
define('SUPABASE_URL', 'https://xxxxxxxxxxxxx.supabase.co');
define('SUPABASE_KEY', 'your-supabase-anon-key-here');
?>

