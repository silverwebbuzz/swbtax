-- =====================================================
-- MySQL Database Schema for SilverWebBuzz
-- Based on ebizfiling.com services structure
-- =====================================================
-- 
-- Instructions:
-- 1. Create a database first: CREATE DATABASE silverwebbuzz_in_statutory;
-- 2. Use the database: USE silverwebbuzz_in_statutory;
-- 3. Paste and run this entire SQL script
-- =====================================================

-- Create service_categories table
CREATE TABLE IF NOT EXISTS service_categories (
  id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(255) UNIQUE NOT NULL,
  description TEXT,
  display_order INT NOT NULL DEFAULT 0,
  status ENUM('active', 'inactive') DEFAULT 'active',
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Create services table
CREATE TABLE IF NOT EXISTS services (
  id INT AUTO_INCREMENT PRIMARY KEY,
  category_id INT NOT NULL,
  name VARCHAR(255) NOT NULL,
  description TEXT,
  price DECIMAL(10, 2) NULL,
  price_text VARCHAR(255) NULL,
  is_featured BOOLEAN DEFAULT FALSE,
  display_order INT NOT NULL DEFAULT 0,
  status ENUM('active', 'inactive') DEFAULT 'active',
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (category_id) REFERENCES service_categories(id) ON DELETE CASCADE,
  INDEX idx_category_id (category_id),
  INDEX idx_display_order (display_order),
  INDEX idx_status (status)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Create service_packages table
CREATE TABLE IF NOT EXISTS service_packages (
  id INT AUTO_INCREMENT PRIMARY KEY,
  service_id INT NOT NULL,
  name VARCHAR(255) NOT NULL,
  price DECIMAL(10, 2) NOT NULL,
  description TEXT,
  is_popular BOOLEAN DEFAULT FALSE,
  display_order INT NOT NULL DEFAULT 0,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (service_id) REFERENCES services(id) ON DELETE CASCADE,
  INDEX idx_service_id (service_id),
  INDEX idx_display_order (display_order)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Create package_features table
CREATE TABLE IF NOT EXISTS package_features (
  id INT AUTO_INCREMENT PRIMARY KEY,
  package_id INT NOT NULL,
  feature TEXT NOT NULL,
  display_order INT NOT NULL DEFAULT 0,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (package_id) REFERENCES service_packages(id) ON DELETE CASCADE,
  INDEX idx_package_id (package_id),
  INDEX idx_display_order (display_order)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Create service_details table
CREATE TABLE IF NOT EXISTS service_details (
  id INT AUTO_INCREMENT PRIMARY KEY,
  service_id INT UNIQUE NOT NULL,
  full_description TEXT,
  overview TEXT,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (service_id) REFERENCES services(id) ON DELETE CASCADE,
  INDEX idx_service_id (service_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- =====================================================
-- Insert Service Categories
-- =====================================================

INSERT INTO service_categories (name, description, display_order, status) VALUES
('For Indian Entrepreneur', 'Company registration services for Indian entrepreneurs and businesses', 1, 'active'),
('For Foreign Entrepreneur', 'Company registration services for foreign entrepreneurs', 2, 'active'),
('Special Entities', 'Special entity registrations like NPO, Nidhi Company, Producer Company', 3, 'active'),
('Tax Registrations', 'GST, PAN, TAN and other tax registrations', 4, 'active'),
('Other Registration', 'IEC, ESIC, Digital Signature, DIN, EPF, MSME registrations', 5, 'active'),
('Returns', 'GST Returns, Income Tax Returns, TDS Returns, PF Returns, ESI Returns', 6, 'active'),
('Annual Filings', 'Annual compliance and filing services for companies and LLPs', 7, 'active'),
('Change Services', 'Services for changes in company structure, directors, capital, etc.', 8, 'active'),
('Closure', 'Strike off and dissolution services for companies and LLPs', 9, 'active'),
('Legal Drafting', 'Legal document drafting and download library services', 10, 'active'),
('Special', 'Special services like GST LUT, GST Cancellation, DIR 3 KYC, etc.', 11, 'active'),
('Trademark', 'Trademark registration and related services', 12, 'active'),
('Copyright', 'Copyright application and protection services', 13, 'active'),
('Patent', 'Patent registration and application services', 14, 'active'),
('Accounting', 'Accounting and bookkeeping services', 15, 'active'),
('Payroll', 'Payroll setup and processing services', 16, 'active'),
('Digital Presence', 'Logo design, digital marketing, and web development services', 17, 'active');

-- =====================================================
-- Insert Services - For Indian Entrepreneur (Category ID: 1)
-- =====================================================

INSERT INTO services (category_id, name, description, price, price_text, is_featured, display_order) VALUES
(1, 'Private Limited Company Registration', 'Complete private limited company registration in India with DSC, DIN, name approval, incorporation certificate, MOA, AOA, PAN, and TAN', 7399.00, NULL, TRUE, 1),
(1, 'Public Limited Company', 'Public limited company registration with complete documentation and compliance support', NULL, 'Contact Us', FALSE, 2),
(1, 'Limited Liability Partnership', 'LLP registration services including DSC, DIN, name approval, incorporation certificate, LLP agreement, PAN, and TAN', 6399.00, NULL, TRUE, 3),
(1, 'One Person Company (OPC)', 'OPC registration for single person businesses with complete support', NULL, 'Starting from ₹5999', FALSE, 4),
(1, 'Sole Proprietorship', 'Sole proprietorship firm registration and documentation', NULL, 'Contact Us', FALSE, 5),
(1, 'Partnership', 'Partnership firm registration with partnership deed drafting', NULL, 'Starting from ₹2999', FALSE, 6),
(1, 'Hindu Undivided Family (HUF)', 'HUF deed preparation and registration services', NULL, 'Starting from ₹1999', FALSE, 7),
(1, 'E-Commerce Business', 'E-commerce business registration and compliance services', NULL, 'Contact Us', FALSE, 8);

-- =====================================================
-- Insert Services - For Foreign Entrepreneur (Category ID: 2)
-- =====================================================

INSERT INTO services (category_id, name, description, price, price_text, is_featured, display_order) VALUES
(2, 'Indian Subsidiary', 'Indian subsidiary company registration for foreign companies', NULL, 'Contact Us', FALSE, 1),
(2, 'Company Registration by Foreigner', 'Complete company registration process for foreign nationals in India', NULL, 'Contact Us', FALSE, 2);

-- =====================================================
-- Insert Services - Special Entities (Category ID: 3)
-- =====================================================

INSERT INTO services (category_id, name, description, price, price_text, is_featured, display_order) VALUES
(3, 'Non Profit Organization', 'NPO/Section 8 company registration for non-profit organizations', NULL, 'Starting from ₹8999', FALSE, 1),
(3, 'Nidhi Company', 'Nidhi company registration for mutual benefit societies', NULL, 'Contact Us', FALSE, 2),
(3, 'Producer Company', 'Producer company registration for agricultural and related activities', NULL, 'Contact Us', FALSE, 3);

-- =====================================================
-- Insert Services - Tax Registrations (Category ID: 4)
-- =====================================================

INSERT INTO services (category_id, name, description, price, price_text, is_featured, display_order) VALUES
(4, 'GST Registration', 'GST registration for your business with complete documentation support', 1499.00, NULL, TRUE, 1),
(4, 'GST Modification', 'Modification of existing GST registration details', NULL, 'Starting from ₹999', FALSE, 2),
(4, 'PAN Application', 'Permanent Account Number (PAN) application and processing', 499.00, NULL, FALSE, 3),
(4, 'TAN Application', 'Tax Deduction and Collection Account Number (TAN) application', 499.00, NULL, FALSE, 4);

-- =====================================================
-- Insert Services - Other Registration (Category ID: 5)
-- =====================================================

INSERT INTO services (category_id, name, description, price, price_text, is_featured, display_order) VALUES
(5, 'IEC Registration', 'Import Export Code (IEC) registration for international trade', NULL, 'Starting from ₹1999', FALSE, 1),
(5, 'IEC Modification', 'Modification of existing IEC registration', NULL, 'Starting from ₹999', FALSE, 2),
(5, 'ESIC Registration', 'Employee State Insurance Corporation (ESIC) registration', NULL, 'Starting from ₹999', FALSE, 3),
(5, 'Digital Signature', 'Digital Signature Certificate (DSC) application and processing', 1999.00, NULL, FALSE, 4),
(5, 'DIN Application', 'Director Identification Number (DIN) application', NULL, 'Starting from ₹499', FALSE, 5),
(5, 'EPF Registration', 'Employee Provident Fund (EPF) registration', NULL, 'Starting from ₹999', FALSE, 6),
(5, 'SSI/MSME/Udyog Aadhar Registration', 'MSME/Udyog Aadhar registration for small and medium enterprises', NULL, 'Starting from ₹999', FALSE, 7);

-- =====================================================
-- Insert Services - Returns (Category ID: 6)
-- =====================================================

INSERT INTO services (category_id, name, description, price, price_text, is_featured, display_order) VALUES
(6, 'GST Returns', 'GST return filing services including GSTR-1, GSTR-3B, GSTR-9, and GSTR-9C', NULL, 'Starting from ₹599', FALSE, 1),
(6, 'Income Tax Returns', 'Income tax return filing for individuals and businesses', NULL, 'Starting from ₹999', FALSE, 2),
(6, 'TDS Returns', 'TDS return filing and revision services', NULL, 'Starting from ₹999', FALSE, 3),
(6, 'TDS Returns Revision', 'Revision of filed TDS returns', NULL, 'Starting from ₹1499', FALSE, 4),
(6, 'PF Returns', 'Provident Fund return filing services', NULL, 'Starting from ₹999', FALSE, 5),
(6, 'ESI Returns', 'Employee State Insurance return filing services', NULL, 'Starting from ₹999', FALSE, 6);

-- =====================================================
-- Insert Services - Annual Filings (Category ID: 7)
-- =====================================================

INSERT INTO services (category_id, name, description, price, price_text, is_featured, display_order) VALUES
(7, 'Private Limited Company Annual Filing', 'ROC annual compliance for private limited companies including AOC-4, MGT-7, ADT-1', 3999.00, NULL, TRUE, 1),
(7, 'LLP Annual Filing', 'LLP annual return filing including Form 8 and Form 11', NULL, 'Starting from ₹2999', FALSE, 2),
(7, 'Public Limited Company Annual Filing', 'Annual filing for public limited companies', NULL, 'Contact Us', FALSE, 3),
(7, 'OPC Annual Filing', 'One Person Company annual filing and compliance', NULL, 'Starting from ₹2999', FALSE, 4),
(7, 'NPO/Section 8 Company Annual Filing', 'Annual filing for non-profit organizations', NULL, 'Starting from ₹2999', FALSE, 5),
(7, 'Nidhi Company Annual Filing', 'Annual filing for Nidhi companies', NULL, 'Contact Us', FALSE, 6),
(7, 'Producer Company Annual Filing', 'Annual filing for producer companies', NULL, 'Contact Us', FALSE, 7),
(7, 'Trust Annual Filing', 'Annual filing for trusts', NULL, 'Contact Us', FALSE, 8);

-- =====================================================
-- Insert Services - Change Services (Category ID: 8)
-- =====================================================

INSERT INTO services (category_id, name, description, price, price_text, is_featured, display_order) VALUES
(8, 'Add A Director', 'Add a new director to your company', NULL, 'Starting from ₹1999', FALSE, 1),
(8, 'Removal/Resignation of Director', 'Remove or process resignation of a director', NULL, 'Starting from ₹1999', FALSE, 2),
(8, 'Add/Remove a Partner in LLP', 'Add or remove partners in Limited Liability Partnership', NULL, 'Starting from ₹1999', FALSE, 3),
(8, 'Change in LLP Agreement', 'Modify LLP agreement and file necessary forms', NULL, 'Starting from ₹2999', FALSE, 4),
(8, 'Change of Registered Office Address', 'Change registered office address of company or LLP', NULL, 'Starting from ₹1999', FALSE, 5),
(8, 'Increase in Authorized Capital', 'Increase authorized capital of the company', NULL, 'Starting from ₹2999', FALSE, 6),
(8, 'Change in DIN', 'Change Director Identification Number details', NULL, 'Starting from ₹999', FALSE, 7),
(8, 'Surrender Your DIN', 'Surrender Director Identification Number', NULL, 'Starting from ₹999', FALSE, 8),
(8, 'Appointment of Auditors', 'Appoint auditors for the company', NULL, 'Starting from ₹1999', FALSE, 9),
(8, 'Share Transfer & Transmission', 'Transfer or transmission of company shares', NULL, 'Starting from ₹1999', FALSE, 10),
(8, 'Company Name Change', 'Change company name and update all documents', NULL, 'Starting from ₹3999', FALSE, 11),
(8, 'LLP Name Change', 'Change LLP name and update registration', NULL, 'Starting from ₹2999', FALSE, 12),
(8, 'MOA/AOA Amendment', 'Amend Memorandum and Articles of Association', NULL, 'Starting from ₹2999', FALSE, 13),
(8, 'MOA/AOA Printing', 'Printing services for MOA and AOA documents', NULL, 'Starting from ₹999', FALSE, 14);

-- =====================================================
-- Insert Services - Closure (Category ID: 9)
-- =====================================================

INSERT INTO services (category_id, name, description, price, price_text, is_featured, display_order) VALUES
(9, 'Strike Off Company', 'Strike off private limited company', NULL, 'Starting from ₹3999', FALSE, 1),
(9, 'Strike Off LLP', 'Strike off Limited Liability Partnership', NULL, 'Starting from ₹2999', FALSE, 2),
(9, 'Dissolution of Firms', 'Dissolution of partnership firms', NULL, 'Starting from ₹1999', FALSE, 3),
(9, 'Strike Off OPC', 'Strike off One Person Company', NULL, 'Starting from ₹2999', FALSE, 4);

-- =====================================================
-- Insert Services - Legal Drafting (Category ID: 10)
-- =====================================================

INSERT INTO services (category_id, name, description, price, price_text, is_featured, display_order) VALUES
(10, 'Download Library', 'Access to legal document templates and forms', NULL, 'Contact Us', FALSE, 1),
(10, 'Customized Drafting', 'Custom legal document drafting services', NULL, 'Contact Us', FALSE, 2);

-- =====================================================
-- Insert Services - Special (Category ID: 11)
-- =====================================================

INSERT INTO services (category_id, name, description, price, price_text, is_featured, display_order) VALUES
(11, 'GST LUT Letter of Undertaking', 'GST LUT filing for export businesses', NULL, 'Starting from ₹999', FALSE, 1),
(11, 'GST Cancellation', 'Cancel GST registration', NULL, 'Starting from ₹1499', FALSE, 2),
(11, 'DIR 3 KYC', 'Director KYC filing (DIR-3 KYC)', NULL, 'Starting from ₹999', FALSE, 3),
(11, 'ROC Search Report', 'ROC search report and due diligence services', NULL, 'Contact Us', FALSE, 4),
(11, 'Commencement of Business (INC 20A)', 'File INC-20A for commencement of business', NULL, 'Starting from ₹1999', FALSE, 5);

-- =====================================================
-- Insert Services - Trademark (Category ID: 12)
-- =====================================================

INSERT INTO services (category_id, name, description, price, price_text, is_featured, display_order) VALUES
(12, 'Trademark Registration', 'Complete trademark registration process with expert guidance', 6399.00, NULL, TRUE, 1),
(12, 'Trademark Objections', 'Handle trademark objections and responses', NULL, 'Starting from ₹2999', FALSE, 2),
(12, 'Trademark Assignment', 'Transfer trademark ownership', NULL, 'Starting from ₹3999', FALSE, 3),
(12, 'Trademark Renewal', 'Renew existing trademark registration', NULL, 'Starting from ₹4999', FALSE, 4),
(12, 'Trademark Opposition', 'Handle trademark opposition proceedings', NULL, 'Starting from ₹4999', FALSE, 5),
(12, 'Trademark Withdrawal', 'Withdraw trademark application', NULL, 'Starting from ₹1999', FALSE, 6),
(12, 'Trademark Rectification', 'Rectify trademark registration details', NULL, 'Starting from ₹3999', FALSE, 7),
(12, 'Trademark Watch Services', 'Monitor trademark applications and registrations', NULL, 'Contact Us', FALSE, 8),
(12, 'International Trademark Registration', 'International trademark registration under Madrid Protocol', NULL, 'Contact Us', FALSE, 9);

-- =====================================================
-- Insert Services - Copyright (Category ID: 13)
-- =====================================================

INSERT INTO services (category_id, name, description, price, price_text, is_featured, display_order) VALUES
(13, 'Copyright Application', 'Copyright registration application and processing', NULL, 'Starting from ₹4999', FALSE, 1);

-- =====================================================
-- Insert Services - Patent (Category ID: 14)
-- =====================================================

INSERT INTO services (category_id, name, description, price, price_text, is_featured, display_order) VALUES
(14, 'Patent Registration', 'Patent application and registration services', NULL, 'Contact Us', FALSE, 1),
(14, 'Patent Search', 'Patent search and prior art analysis', NULL, 'Contact Us', FALSE, 2),
(14, 'Provisional Patent', 'Provisional patent application filing', NULL, 'Contact Us', FALSE, 3);

-- =====================================================
-- Insert Services - Accounting (Category ID: 15)
-- =====================================================

INSERT INTO services (category_id, name, description, price, price_text, is_featured, display_order) VALUES
(15, 'Accounting', 'Bookkeeping and accounting services for businesses', NULL, 'Starting from ₹1999/month', FALSE, 1),
(15, 'Tax Consultancy Services', 'Expert tax consultancy for compliance and planning', 1499.00, NULL, TRUE, 2);

-- =====================================================
-- Insert Services - Payroll (Category ID: 16)
-- =====================================================

INSERT INTO services (category_id, name, description, price, price_text, is_featured, display_order) VALUES
(16, 'Payroll', 'Payroll setup and processing services', NULL, 'Starting from ₹49/employee/month', FALSE, 1);

-- =====================================================
-- Insert Services - Digital Presence (Category ID: 17)
-- =====================================================

INSERT INTO services (category_id, name, description, price, price_text, is_featured, display_order) VALUES
(17, 'Logo Design Services', 'Professional logo design with multiple concepts', NULL, 'Starting from ₹4499', FALSE, 1),
(17, 'Digital Marketing', 'Digital marketing and online presence services', NULL, 'Contact Us', FALSE, 2),
(17, 'Web Development', 'Website development and design services', NULL, 'Contact Us', FALSE, 3);

-- =====================================================
-- Insert Packages for Private Limited Company Registration (Service ID: 1)
-- =====================================================

INSERT INTO service_packages (service_id, name, price, description, is_popular, display_order) VALUES
(1, 'Basic Package', 7399.00, 'Essential company registration with all mandatory documents', FALSE, 1),
(1, 'Standard Package', 9999.00, 'Company registration with additional compliance support', TRUE, 2),
(1, 'Premium Package', 14999.00, 'Complete registration with 3 months post-incorporation support', FALSE, 3);

-- Features for Private Limited Company Packages
-- Package ID 1 (Basic Package)
INSERT INTO package_features (package_id, feature, display_order) VALUES
(1, 'Digital Signature Certificate (DSC) - 2 Directors', 1),
(1, 'Director Identification Number (DIN) - 2 Directors', 2),
(1, 'Company Name Approval (RUN)', 3),
(1, 'Incorporation Certificate', 4),
(1, 'Memorandum of Association (MOA)', 5),
(1, 'Articles of Association (AOA)', 6),
(1, 'PAN Application', 7),
(1, 'TAN Application', 8);

-- Package ID 2 (Standard Package)
INSERT INTO package_features (package_id, feature, display_order) VALUES
(2, 'Digital Signature Certificate (DSC) - 2 Directors', 1),
(2, 'Director Identification Number (DIN) - 2 Directors', 2),
(2, 'Company Name Approval (RUN)', 3),
(2, 'Incorporation Certificate', 4),
(2, 'Memorandum of Association (MOA)', 5),
(2, 'Articles of Association (AOA)', 6),
(2, 'PAN Application', 7),
(2, 'TAN Application', 8),
(2, 'Bank Account Opening Support', 9),
(2, 'GST Registration Support', 10);

-- Package ID 3 (Premium Package)
INSERT INTO package_features (package_id, feature, display_order) VALUES
(3, 'Digital Signature Certificate (DSC) - 2 Directors', 1),
(3, 'Director Identification Number (DIN) - 2 Directors', 2),
(3, 'Company Name Approval (RUN)', 3),
(3, 'Incorporation Certificate', 4),
(3, 'Memorandum of Association (MOA)', 5),
(3, 'Articles of Association (AOA)', 6),
(3, 'PAN Application', 7),
(3, 'TAN Application', 8),
(3, 'Bank Account Opening Support', 9),
(3, 'GST Registration Support', 10),
(3, '3 Months Post-Incorporation Compliance Support', 11),
(3, 'Dedicated Account Manager', 12);

-- =====================================================
-- Insert Packages for Limited Liability Partnership (Service ID: 3)
-- =====================================================

INSERT INTO service_packages (service_id, name, price, description, is_popular, display_order) VALUES
(3, 'Basic Package', 6399.00, 'Essential LLP registration with all mandatory documents', FALSE, 1),
(3, 'Standard Package', 8999.00, 'LLP registration with additional compliance support', TRUE, 2),
(3, 'Premium Package', 12999.00, 'Complete registration with 3 months post-incorporation support', FALSE, 3);

-- Features for LLP Packages
-- Package ID 4 (Basic Package)
INSERT INTO package_features (package_id, feature, display_order) VALUES
(4, 'Digital Signature Certificate (DSC) - 2 Partners', 1),
(4, 'Director Identification Number (DIN) - 2 Partners', 2),
(4, 'LLP Name Approval (RUN)', 3),
(4, 'LLP Incorporation Certificate', 4),
(4, 'LLP Agreement Drafting', 5),
(4, 'PAN Application', 6),
(4, 'TAN Application', 7);

-- Package ID 5 (Standard Package)
INSERT INTO package_features (package_id, feature, display_order) VALUES
(5, 'Digital Signature Certificate (DSC) - 2 Partners', 1),
(5, 'Director Identification Number (DIN) - 2 Partners', 2),
(5, 'LLP Name Approval (RUN)', 3),
(5, 'LLP Incorporation Certificate', 4),
(5, 'LLP Agreement Drafting', 5),
(5, 'PAN Application', 6),
(5, 'TAN Application', 7),
(5, 'Bank Account Opening Support', 8),
(5, 'GST Registration Support', 9);

-- Package ID 6 (Premium Package)
INSERT INTO package_features (package_id, feature, display_order) VALUES
(6, 'Digital Signature Certificate (DSC) - 2 Partners', 1),
(6, 'Director Identification Number (DIN) - 2 Partners', 2),
(6, 'LLP Name Approval (RUN)', 3),
(6, 'LLP Incorporation Certificate', 4),
(6, 'LLP Agreement Drafting', 5),
(6, 'PAN Application', 6),
(6, 'TAN Application', 7),
(6, 'Bank Account Opening Support', 8),
(6, 'GST Registration Support', 9),
(6, '3 Months Post-Incorporation Compliance Support', 10),
(6, 'Dedicated Account Manager', 11);

-- =====================================================
-- Insert Packages for GST Registration (Service ID: 14)
-- =====================================================

INSERT INTO service_packages (service_id, name, price, description, is_popular, display_order) VALUES
(14, 'Basic Package', 1499.00, 'Essential GST registration service', FALSE, 1),
(14, 'Standard Package', 2499.00, 'GST registration with consultation and support', TRUE, 2),
(14, 'Premium Package', 3999.00, 'Complete GST registration with ongoing support', FALSE, 3);

-- Features for GST Registration Packages
-- Package ID 7 (Basic Package)
INSERT INTO package_features (package_id, feature, display_order) VALUES
(7, 'GST Registration Certificate', 1),
(7, 'GSTIN Number', 2),
(7, 'Application Filing', 3);

-- Package ID 8 (Standard Package)
INSERT INTO package_features (package_id, feature, display_order) VALUES
(8, 'GST Registration Certificate', 1),
(8, 'GSTIN Number', 2),
(8, 'Application Filing', 3),
(8, 'Expert Consultation', 4),
(8, 'Document Preparation Support', 5);

-- Package ID 9 (Premium Package)
INSERT INTO package_features (package_id, feature, display_order) VALUES
(9, 'GST Registration Certificate', 1),
(9, 'GSTIN Number', 2),
(9, 'Application Filing', 3),
(9, 'Expert Consultation', 4),
(9, 'Document Preparation Support', 5),
(9, '3 Months Post-Registration Support', 6),
(9, 'GST Return Filing Assistance', 7);

-- =====================================================
-- Insert Packages for ROC Annual Compliance (Service ID: 25)
-- =====================================================

INSERT INTO service_packages (service_id, name, price, description, is_popular, display_order) VALUES
(25, 'Basic Package', 3999.00, 'Essential annual compliance filing', FALSE, 1),
(25, 'Standard Package', 5999.00, 'Annual compliance with additional support', TRUE, 2),
(25, 'Premium Package', 8999.00, 'Complete annual compliance with ongoing support', FALSE, 3);

-- Features for ROC Annual Compliance Packages
-- Package ID 10 (Basic Package)
INSERT INTO package_features (package_id, feature, display_order) VALUES
(10, 'AOC-4 Filing (Annual Return)', 1),
(10, 'MGT-7 Filing (Annual Return)', 2),
(10, 'ADT-1 Filing (Auditor Appointment)', 3);

-- Package ID 11 (Standard Package)
INSERT INTO package_features (package_id, feature, display_order) VALUES
(11, 'AOC-4 Filing (Annual Return)', 1),
(11, 'MGT-7 Filing (Annual Return)', 2),
(11, 'ADT-1 Filing (Auditor Appointment)', 3),
(11, 'Board Meeting Minutes Drafting', 4),
(11, 'AGM Minutes Drafting', 5);

-- Package ID 12 (Premium Package)
INSERT INTO package_features (package_id, feature, display_order) VALUES
(12, 'AOC-4 Filing (Annual Return)', 1),
(12, 'MGT-7 Filing (Annual Return)', 2),
(12, 'ADT-1 Filing (Auditor Appointment)', 3),
(12, 'Board Meeting Minutes Drafting', 4),
(12, 'AGM Minutes Drafting', 5),
(12, 'Quarterly Compliance Support', 6),
(12, 'Dedicated Compliance Manager', 7);

-- =====================================================
-- Insert Packages for Trademark Registration (Service ID: 37)
-- =====================================================

INSERT INTO service_packages (service_id, name, price, description, is_popular, display_order) VALUES
(37, 'Basic Package', 6399.00, 'Essential trademark registration for one class', FALSE, 1),
(37, 'Standard Package', 8999.00, 'Trademark registration with search and monitoring', TRUE, 2),
(37, 'Premium Package', 12999.00, 'Complete trademark registration with objection handling', FALSE, 3);

-- Features for Trademark Registration Packages
-- Package ID 13 (Basic Package)
INSERT INTO package_features (package_id, feature, display_order) VALUES
(13, 'Trademark Search (1 Class)', 1),
(13, 'Trademark Application Filing', 2),
(13, 'Government Fees (1 Class)', 3),
(13, 'Application Tracking', 4);

-- Package ID 14 (Standard Package)
INSERT INTO package_features (package_id, feature, display_order) VALUES
(14, 'Trademark Search (1 Class)', 1),
(14, 'Trademark Application Filing', 2),
(14, 'Government Fees (1 Class)', 3),
(14, 'Application Tracking', 4),
(14, 'Trademark Watch Service (6 Months)', 5),
(14, 'Expert Consultation', 6);

-- Package ID 15 (Premium Package)
INSERT INTO package_features (package_id, feature, display_order) VALUES
(15, 'Trademark Search (1 Class)', 1),
(15, 'Trademark Application Filing', 2),
(15, 'Government Fees (1 Class)', 3),
(15, 'Application Tracking', 4),
(15, 'Trademark Watch Service (12 Months)', 5),
(15, 'Expert Consultation', 6),
(15, 'Objection Response Handling', 7),
(15, 'Registration Certificate', 8);

-- =====================================================
-- Insert Packages for Tax Consultancy Services (Service ID: 46)
-- =====================================================

INSERT INTO service_packages (service_id, name, price, description, is_popular, display_order) VALUES
(46, 'Basic Consultation', 1499.00, 'One-time tax consultation session', FALSE, 1),
(46, 'Standard Package', 2999.00, 'Quarterly tax consultation and planning', TRUE, 2),
(46, 'Premium Package', 5999.00, 'Annual tax consultancy with ongoing support', FALSE, 3);

-- Features for Tax Consultancy Packages
-- Package ID 16 (Basic Consultation)
INSERT INTO package_features (package_id, feature, display_order) VALUES
(16, 'One-time Tax Consultation (1 Hour)', 1),
(16, 'Tax Planning Advice', 2);

-- Package ID 17 (Standard Package)
INSERT INTO package_features (package_id, feature, display_order) VALUES
(17, 'Quarterly Tax Consultation (4 Sessions)', 1),
(17, 'Tax Planning and Optimization', 2),
(17, 'Compliance Review', 3);

-- Package ID 18 (Premium Package)
INSERT INTO package_features (package_id, feature, display_order) VALUES
(18, 'Annual Tax Consultation (12 Sessions)', 1),
(18, 'Tax Planning and Optimization', 2),
(18, 'Compliance Review', 3),
(18, 'Dedicated Tax Advisor', 4),
(18, 'Priority Support', 5);

-- =====================================================
-- Admin Users Table (for admin panel)
-- =====================================================

CREATE TABLE IF NOT EXISTS admin_users (
  id INT AUTO_INCREMENT PRIMARY KEY,
  username VARCHAR(100) UNIQUE NOT NULL,
  email VARCHAR(255),
  password VARCHAR(255) NOT NULL,
  status ENUM('active', 'inactive') DEFAULT 'active',
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Insert default superadmin user
-- Username: admin
-- Password: admin123 (change this immediately after first login!)
INSERT INTO admin_users (username, email, password, status) VALUES
('admin', 'admin@silverwebbuzz.in', '$2y$10$N9qo8uLOickgx2ZMRZoMyeIjZAgcfl7p92ldGxad68LJZdL17lhWy', 'active');

-- Note: The default password is 'admin123'
-- Please change this password immediately after first login!

-- =====================================================
-- End of Schema
-- =====================================================
