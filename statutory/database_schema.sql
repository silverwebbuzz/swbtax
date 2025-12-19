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
  overview TEXT,
  full_description TEXT,
  processing_time VARCHAR(255),
  documents_required TEXT,
  faqs TEXT,
  benefits TEXT,
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
-- Insert Service Details
-- =====================================================

-- Service Details for Private Limited Company Registration (Service ID: 1)
INSERT INTO service_details (service_id, overview, full_description, processing_time, documents_required, benefits, faqs) VALUES
(1, 
'Private Limited Company is the most popular business structure in India. It offers limited liability protection, separate legal entity status, and easier access to funding.',
'Private Limited Company registration in India provides a robust foundation for your business with limited liability protection, perpetual succession, and enhanced credibility. Our comprehensive service includes DSC, DIN, name approval, incorporation certificate, MOA, AOA, PAN, and TAN.',
'10-15 business days',
'PAN Card of Directors|Aadhaar Card of Directors|Address Proof (Electricity Bill/Rent Agreement)|Passport Size Photos|Registered Office Address Proof|NOC from Property Owner (if rented)',
'Limited Liability Protection|Separate Legal Entity|Easy Fundraising|Perpetual Succession|Enhanced Credibility|Tax Benefits|Easy Transfer of Shares',
'What is a Private Limited Company?|A Private Limited Company is a business structure where shareholders have limited liability and the company is a separate legal entity.|What is the minimum capital required?|There is no minimum capital requirement. You can start with any amount.|Can a single person form a Private Limited Company?|No, minimum 2 directors and 2 shareholders are required. For single person, consider OPC.|What are the compliance requirements?|Annual filing of financial statements, annual returns, and board meetings are mandatory.|Is foreign investment allowed?|Yes, subject to FDI guidelines and sectoral caps.'
);

-- Service Details for Limited Liability Partnership (Service ID: 3)
INSERT INTO service_details (service_id, overview, full_description, processing_time, documents_required, benefits, faqs) VALUES
(3,
'LLP combines the benefits of partnership and company structure. It offers limited liability with operational flexibility.',
'Limited Liability Partnership (LLP) registration provides the flexibility of a partnership with the protection of limited liability. Ideal for professionals and service businesses.',
'12-18 business days',
'PAN Card of Partners|Aadhaar Card of Partners|Address Proof|Passport Size Photos|Registered Office Address Proof|LLP Agreement Draft',
'Limited Liability|Operational Flexibility|Less Compliance|No Minimum Capital|Tax Benefits|Easy to Dissolve',
'What is an LLP?|LLP is a hybrid structure combining features of partnership and company.|What is the minimum number of partners?|Minimum 2 partners are required. At least one must be resident in India.|What are the compliance requirements?|LLP needs to file Form 8 and Form 11 annually.|Can LLP raise funds?|LLP cannot issue shares but can raise funds through partners capital.'
);

-- Service Details for GST Registration (Service ID: 14)
INSERT INTO service_details (service_id, overview, full_description, processing_time, documents_required, benefits, faqs) VALUES
(14,
'GST Registration is mandatory for businesses with turnover exceeding ₹20 lakh (₹10 lakh for special states). Essential for legal business operations.',
'GST (Goods and Services Tax) registration enables your business to collect and remit GST, claim input tax credit, and operate legally in India.',
'5-7 business days',
'PAN Card|Aadhaar Card|Business Address Proof|Bank Account Details|Digital Signature Certificate|Photographs|Business Registration Certificate',
'Legal Business Operations|Input Tax Credit|Wider Customer Base|Online Business Eligibility|Compliance with Law',
'Who needs GST registration?|Businesses with annual turnover above ₹20 lakh (₹10 lakh for special states) must register.|What is the penalty for not registering?|Penalty of 10% of tax due or ₹10,000, whichever is higher.|Can I register voluntarily?|Yes, businesses below threshold can register voluntarily.|Is GST registration free?|No, government fees apply. Our service includes all fees.|What documents are needed?|PAN, address proof, bank details, and business registration documents.'
);

-- Service Details for Private Limited Company Annual Filing (Service ID: 25)
INSERT INTO service_details (service_id, overview, full_description, processing_time, documents_required, benefits, faqs) VALUES
(25,
'Annual compliance filing is mandatory for all Private Limited Companies. Includes AOC-4, MGT-7, and ADT-1 forms.',
'Annual filing ensures your company remains compliant with ROC requirements. Includes financial statements, annual return, and auditor appointment.',
'15-20 business days',
'Financial Statements (Balance Sheet, P&L)|Annual Return|Auditor Appointment Details|Board Meeting Minutes|AGM Minutes|Directors Report',
'Maintain Active Status|Avoid Penalties|Legal Compliance|Good Corporate Governance|Business Credibility',
'What is annual filing?|Annual filing includes submission of financial statements and annual return to ROC.|What are the due dates?|AOC-4: 30 days from AGM, MGT-7: 60 days from AGM.|What happens if I miss the deadline?|Late fees and penalties apply. Company status may become inactive.|Is audit mandatory?|Yes, for companies with turnover above ₹1 crore or capital above ₹10 lakh.|Can I file myself?|Yes, but professional assistance ensures accuracy and compliance.'
);

-- Service Details for Trademark Registration (Service ID: 37)
INSERT INTO service_details (service_id, overview, full_description, processing_time, documents_required, benefits, faqs) VALUES
(37,
'Trademark registration protects your brand name, logo, and slogan. Provides exclusive rights and legal protection.',
'Trademark registration gives you exclusive rights to use your brand mark and prevents others from using similar marks. Essential for brand protection.',
'6-12 months (Registration Certificate)',
'Trademark Logo/Word|Applicant Identity Proof|Applicant Address Proof|Power of Attorney|User Affidavit (if claiming prior use)|Business Registration Certificate',
'Exclusive Rights|Brand Protection|Legal Recourse|Business Value|Asset Creation|Global Protection',
'What can be trademarked?|Brand names, logos, slogans, sounds, and even colors can be trademarked.|How long does it take?|6-12 months for registration certificate, but protection starts from application date.|What is trademark validity?|Trademark is valid for 10 years and can be renewed indefinitely.|What if someone uses my trademark?|You can take legal action for infringement once registered.|Is trademark search necessary?|Yes, to check if similar marks exist and avoid objections.'
);

-- Service Details for Tax Consultancy Services (Service ID: 46)
INSERT INTO service_details (service_id, overview, full_description, processing_time, documents_required, benefits, faqs) VALUES
(46,
'Expert tax consultancy helps optimize your tax liability, ensure compliance, and maximize savings through strategic planning.',
'Professional tax consultancy services for individuals and businesses. Includes tax planning, compliance review, and optimization strategies.',
'Ongoing Service',
'Previous Tax Returns|Financial Statements|Investment Proofs|Salary Slips|Form 16|Bank Statements',
'Tax Optimization|Compliance Assurance|Expert Guidance|Savings Maximization|Risk Mitigation',
'What is tax consultancy?|Professional advice on tax planning, compliance, and optimization.|How can it help me?|Reduces tax liability, ensures compliance, and maximizes savings.|When should I consult?|Before financial year end for planning, and during year for compliance.|Is it only for businesses?|No, individuals and businesses both can benefit from tax consultancy.|What documents are needed?|Financial statements, tax returns, and investment proofs.'
);

-- Service Details for PAN Application (Service ID: 16)
INSERT INTO service_details (service_id, overview, full_description, processing_time, documents_required, benefits, faqs) VALUES
(16,
'PAN (Permanent Account Number) is mandatory for financial transactions, tax filing, and business operations in India.',
'PAN is a 10-character alphanumeric identifier issued by Income Tax Department. Required for all financial and tax-related transactions.',
'7-10 business days',
'Identity Proof (Aadhaar/Passport/Voter ID)|Address Proof|Date of Birth Proof|Passport Size Photo|Form 49A (for Indian citizens)',
'Mandatory for Tax Filing|Required for Bank Accounts|Needed for Investments|Business Operations|Financial Transactions',
'Who needs PAN?|All individuals and entities earning taxable income or conducting financial transactions.|What documents are accepted?|Aadhaar, Passport, Voter ID, Driving License for identity proof.|Can I apply online?|Yes, online application is available through NSDL or UTIITSL.|What is the fee?|₹107 for Indian communication address, ₹989 for foreign address.|How long is PAN valid?|PAN is permanent and valid for lifetime.'
);

-- Service Details for TAN Application (Service ID: 17)
INSERT INTO service_details (service_id, overview, full_description, processing_time, documents_required, benefits, faqs) VALUES
(17,
'TAN (Tax Deduction and Collection Account Number) is mandatory for entities deducting or collecting tax at source.',
'TAN is required for filing TDS/TCS returns. Mandatory for employers, businesses making payments subject to TDS, and entities collecting tax.',
'7-10 business days',
'PAN Card|Address Proof|Business Registration Certificate|Form 49B|Authorized Signatory Details',
'Mandatory for TDS Filing|Legal Compliance|Smooth Tax Operations|Required for Employers|Business Requirement',
'Who needs TAN?|All entities deducting or collecting tax at source must have TAN.|Is TAN different from PAN?|Yes, TAN is for TDS/TCS operations, PAN is for income tax.|Can one entity have multiple TAN?|No, one entity can have only one TAN.|What is the penalty for not having TAN?|Penalty of ₹10,000 for non-compliance.|Is TAN mandatory for all businesses?|Only if you deduct or collect tax at source.'
);

-- Service Details for Income Tax Returns (Service ID: 26)
INSERT INTO service_details (service_id, overview, full_description, processing_time, documents_required, benefits, faqs) VALUES
(26,
'Income Tax Return filing is mandatory for individuals and businesses meeting certain income thresholds. Ensures compliance and enables refund claims.',
'Professional ITR filing service ensures accurate tax calculation, maximum deductions, and timely compliance. Includes verification and refund processing.',
'3-5 business days (after document submission)',
'Form 16|Salary Slips|Bank Statements|Investment Proofs (80C, 80D, etc.)|Rent Receipts|Previous ITR (if any)|TDS Certificates',
'Legal Compliance|Refund Claims|Loan Processing|Visa Applications|Tax Planning|Documentation',
'Who must file ITR?|Individuals with income above ₹2.5 lakh (₹3 lakh for senior citizens, ₹5 lakh for super seniors).|What is the due date?|July 31 for individuals, varies for businesses.|Can I file belated return?|Yes, with penalty up to December 31.|What if I miss the deadline?|Belated return can be filed with penalty and interest.|Is e-verification mandatory?|Yes, within 120 days of filing.'
);

-- Service Details for TDS Returns (Service ID: 27)
INSERT INTO service_details (service_id, overview, full_description, processing_time, documents_required, benefits, faqs) VALUES
(27,
'TDS Return filing is mandatory for all entities deducting tax at source. Quarterly filing ensures compliance and avoids penalties.',
'Professional TDS return filing service ensures accurate calculation, timely submission, and compliance with TDS provisions.',
'5-7 business days',
'TDS Certificates|Challan Details|PAN of Deductees|TDS Details|Form 24Q/26Q/27Q|Previous Returns',
'Legal Compliance|Avoid Penalties|Smooth Operations|TDS Credit|Good Standing',
'What is TDS return?|Quarterly return showing details of tax deducted at source.|What are the due dates?|Q1: July 31, Q2: Oct 31, Q3: Jan 31, Q4: May 31.|What is the penalty for late filing?|₹200 per day of delay, subject to maximum of TDS amount.|Which form to use?|Form 24Q for salary, 26Q for non-salary, 27Q for NRIs.|Is TAN mandatory?|Yes, TAN is required for TDS return filing.'
);

-- Service Details for Add A Director (Service ID: 39)
INSERT INTO service_details (service_id, overview, full_description, processing_time, documents_required, benefits, faqs) VALUES
(39,
'Adding a director to your company requires filing DIR-12 with ROC. Professional service ensures smooth process and compliance.',
'Add a new director to your company with proper documentation and ROC filing. Includes DIN application if needed.',
'7-10 business days',
'Director PAN Card|Director Aadhaar Card|Director Address Proof|Director Photo|Board Resolution|Consent Letter|DSC of Director',
'Business Expansion|Expertise Addition|Compliance|Proper Documentation|ROC Filing',
'How to add a director?|File DIR-12 with ROC along with required documents and board resolution.|Is DIN required?|Yes, director must have DIN before appointment.|What documents are needed?|PAN, Aadhaar, address proof, photo, and board resolution.|Can foreign national be director?|Yes, subject to compliance with Companies Act.|What is the fee?|Government fees apply. Our service includes all charges.'
);

-- Service Details for Company Name Change (Service ID: 49)
INSERT INTO service_details (service_id, overview, full_description, processing_time, documents_required, benefits, faqs) VALUES
(49,
'Company name change requires ROC approval and updating all documents. Professional service ensures smooth transition.',
'Change your company name with proper ROC approval and documentation. Includes name approval, MOA/AOA amendment, and certificate update.',
'20-30 business days',
'Board Resolution|Special Resolution|Name Availability|MOA/AOA|Current Registration Certificate|Digital Signature',
'Brand Rebranding|Business Alignment|Legal Compliance|Documentation Update|Smooth Transition',
'How to change company name?|Get name approval, pass special resolution, file forms with ROC.|What is the process?|Name approval → Special resolution → ROC filing → Certificate update.|Can any name be chosen?|Name must be unique and comply with Companies Act guidelines.|What documents need updating?|MOA, AOA, certificates, bank accounts, and all business documents.|How long does it take?|20-30 business days for complete process.'
);

-- Service Details for Strike Off Company (Service ID: 53)
INSERT INTO service_details (service_id, overview, full_description, processing_time, documents_required, benefits, faqs) VALUES
(53,
'Strike off company when business is no longer operational. Voluntary strike off is faster and cost-effective than winding up.',
'Strike off your company when it is no longer needed. Includes compliance check, application filing, and closure process.',
'3-6 months',
'Board Resolution|Special Resolution|Indemnity Bond|Statement of Accounts|No Objection Certificate|Affidavit|Latest Financial Statements',
'Cost Effective|Faster Process|Legal Closure|No Liabilities|Clean Exit',
'What is strike off?|Removal of company name from ROC register when company is defunct.|When can company be struck off?|When company has no operations, assets, or liabilities.|What is the process?|File STK-2 form with ROC after meeting eligibility criteria.|Can struck off company be revived?|Yes, within 20 years with proper application.|What are the requirements?|No assets, no liabilities, all compliances up to date.'
);

-- Service Details for GST Returns (Service ID: Check your services table for "GST Returns" service ID)
-- Note: Replace the service_id below with the actual ID from your services table
-- INSERT INTO service_details (service_id, overview, full_description, processing_time, documents_required, benefits, faqs) VALUES
-- (YOUR_GST_RETURNS_SERVICE_ID,
-- 'GST return filing is mandatory for all GST registered businesses. Monthly/quarterly filing ensures compliance and enables input tax credit.',
-- 'Professional GST return filing service ensures accurate GSTR-1, GSTR-3B, and annual returns. Includes reconciliation and error correction.',
-- '3-5 business days per return',
-- 'Sales Invoices|Purchase Invoices|Bank Statements|E-way Bills|Credit/Debit Notes|Input Tax Credit Details|Previous Returns',
-- 'Legal Compliance|Input Tax Credit|Avoid Penalties|Smooth Operations|Refund Claims',
-- 'Which returns to file?|GSTR-1 (monthly/quarterly), GSTR-3B (monthly), GSTR-9 (annual).|What are the due dates?|GSTR-1: 11th of next month, GSTR-3B: 20th of next month.|What is the penalty for late filing?|₹50 per day for nil return, ₹200 per day for others.|Can I revise returns?|GSTR-1 can be revised, GSTR-3B cannot.|Is professional help necessary?|Recommended for accuracy and compliance.'
-- );

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
