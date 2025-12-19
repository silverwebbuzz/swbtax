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
  id CHAR(36) PRIMARY KEY,
  name VARCHAR(255) UNIQUE NOT NULL,
  description TEXT,
  display_order INT NOT NULL DEFAULT 0,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Create services table
CREATE TABLE IF NOT EXISTS services (
  id CHAR(36) PRIMARY KEY,
  category_id CHAR(36) NOT NULL,
  name VARCHAR(255) NOT NULL,
  description TEXT,
  price DECIMAL(10, 2) NULL,
  price_text VARCHAR(255) NULL,
  is_featured BOOLEAN DEFAULT FALSE,
  display_order INT NOT NULL DEFAULT 0,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (category_id) REFERENCES service_categories(id) ON DELETE CASCADE,
  INDEX idx_category_id (category_id),
  INDEX idx_display_order (display_order)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Create service_packages table
CREATE TABLE IF NOT EXISTS service_packages (
  id CHAR(36) PRIMARY KEY,
  service_id CHAR(36) NOT NULL,
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
  id CHAR(36) PRIMARY KEY,
  package_id CHAR(36) NOT NULL,
  feature TEXT NOT NULL,
  display_order INT NOT NULL DEFAULT 0,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (package_id) REFERENCES service_packages(id) ON DELETE CASCADE,
  INDEX idx_package_id (package_id),
  INDEX idx_display_order (display_order)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Create service_details table
CREATE TABLE IF NOT EXISTS service_details (
  id CHAR(36) PRIMARY KEY,
  service_id CHAR(36) UNIQUE NOT NULL,
  full_description TEXT,
  overview TEXT,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (service_id) REFERENCES services(id) ON DELETE CASCADE,
  INDEX idx_service_id (service_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- =====================================================
-- Insert Service Categories
-- =====================================================

INSERT INTO service_categories (id, name, description, display_order) VALUES
('cat-001', 'For Indian Entrepreneur', 'Company registration services for Indian entrepreneurs and businesses', 1),
('cat-002', 'For Foreign Entrepreneur', 'Company registration services for foreign entrepreneurs', 2),
('cat-003', 'Special Entities', 'Special entity registrations like NPO, Nidhi Company, Producer Company', 3),
('cat-004', 'Tax Registrations', 'GST, PAN, TAN and other tax registrations', 4),
('cat-005', 'Other Registration', 'IEC, ESIC, Digital Signature, DIN, EPF, MSME registrations', 5),
('cat-006', 'Returns', 'GST Returns, Income Tax Returns, TDS Returns, PF Returns, ESI Returns', 6),
('cat-007', 'Annual Filings', 'Annual compliance and filing services for companies and LLPs', 7),
('cat-008', 'Change Services', 'Services for changes in company structure, directors, capital, etc.', 8),
('cat-009', 'Closure', 'Strike off and dissolution services for companies and LLPs', 9),
('cat-010', 'Legal Drafting', 'Legal document drafting and download library services', 10),
('cat-011', 'Special', 'Special services like GST LUT, GST Cancellation, DIR 3 KYC, etc.', 11),
('cat-012', 'Trademark', 'Trademark registration and related services', 12),
('cat-013', 'Copyright', 'Copyright application and protection services', 13),
('cat-014', 'Patent', 'Patent registration and application services', 14),
('cat-015', 'Accounting', 'Accounting and bookkeeping services', 15),
('cat-016', 'Payroll', 'Payroll setup and processing services', 16),
('cat-017', 'Digital Presence', 'Logo design, digital marketing, and web development services', 17)
ON DUPLICATE KEY UPDATE name=name;

-- =====================================================
-- Insert Services - For Indian Entrepreneur
-- =====================================================

INSERT INTO services (id, category_id, name, description, price, price_text, is_featured, display_order) VALUES
('svc-001', 'cat-001', 'Private Limited Company Registration', 'Complete private limited company registration in India with DSC, DIN, name approval, incorporation certificate, MOA, AOA, PAN, and TAN', 7399.00, NULL, TRUE, 1),
('svc-002', 'cat-001', 'Public Limited Company', 'Public limited company registration with complete documentation and compliance support', NULL, 'Contact Us', FALSE, 2),
('svc-003', 'cat-001', 'Limited Liability Partnership', 'LLP registration services including DSC, DIN, name approval, incorporation certificate, LLP agreement, PAN, and TAN', 6399.00, NULL, TRUE, 3),
('svc-004', 'cat-001', 'One Person Company (OPC)', 'OPC registration for single person businesses with complete support', NULL, 'Starting from ₹5999', FALSE, 4),
('svc-005', 'cat-001', 'Sole Proprietorship', 'Sole proprietorship firm registration and documentation', NULL, 'Contact Us', FALSE, 5),
('svc-006', 'cat-001', 'Partnership', 'Partnership firm registration with partnership deed drafting', NULL, 'Starting from ₹2999', FALSE, 6),
('svc-007', 'cat-001', 'Hindu Undivided Family (HUF)', 'HUF deed preparation and registration services', NULL, 'Starting from ₹1999', FALSE, 7),
('svc-008', 'cat-001', 'E-Commerce Business', 'E-commerce business registration and compliance services', NULL, 'Contact Us', FALSE, 8)
ON DUPLICATE KEY UPDATE name=name;

-- =====================================================
-- Insert Services - For Foreign Entrepreneur
-- =====================================================

INSERT INTO services (id, category_id, name, description, price, price_text, is_featured, display_order) VALUES
('svc-009', 'cat-002', 'Indian Subsidiary', 'Indian subsidiary company registration for foreign companies', NULL, 'Contact Us', FALSE, 1),
('svc-010', 'cat-002', 'Company Registration by Foreigner', 'Complete company registration process for foreign nationals in India', NULL, 'Contact Us', FALSE, 2)
ON DUPLICATE KEY UPDATE name=name;

-- =====================================================
-- Insert Services - Special Entities
-- =====================================================

INSERT INTO services (id, category_id, name, description, price, price_text, is_featured, display_order) VALUES
('svc-011', 'cat-003', 'Non Profit Organization', 'NPO/Section 8 company registration for non-profit organizations', NULL, 'Starting from ₹8999', FALSE, 1),
('svc-012', 'cat-003', 'Nidhi Company', 'Nidhi company registration for mutual benefit societies', NULL, 'Contact Us', FALSE, 2),
('svc-013', 'cat-003', 'Producer Company', 'Producer company registration for agricultural and related activities', NULL, 'Contact Us', FALSE, 3)
ON DUPLICATE KEY UPDATE name=name;

-- =====================================================
-- Insert Services - Tax Registrations
-- =====================================================

INSERT INTO services (id, category_id, name, description, price, price_text, is_featured, display_order) VALUES
('svc-014', 'cat-004', 'GST Registration', 'GST registration for your business with complete documentation support', 1499.00, NULL, TRUE, 1),
('svc-015', 'cat-004', 'GST Modification', 'Modification of existing GST registration details', NULL, 'Starting from ₹999', FALSE, 2),
('svc-016', 'cat-004', 'PAN Application', 'Permanent Account Number (PAN) application and processing', 499.00, NULL, FALSE, 3),
('svc-017', 'cat-004', 'TAN Application', 'Tax Deduction and Collection Account Number (TAN) application', 499.00, NULL, FALSE, 4)
ON DUPLICATE KEY UPDATE name=name;

-- =====================================================
-- Insert Services - Other Registration
-- =====================================================

INSERT INTO services (id, category_id, name, description, price, price_text, is_featured, display_order) VALUES
('svc-018', 'cat-005', 'IEC Registration', 'Import Export Code (IEC) registration for international trade', NULL, 'Starting from ₹1999', FALSE, 1),
('svc-019', 'cat-005', 'IEC Modification', 'Modification of existing IEC registration', NULL, 'Starting from ₹999', FALSE, 2),
('svc-020', 'cat-005', 'ESIC Registration', 'Employee State Insurance Corporation (ESIC) registration', NULL, 'Starting from ₹999', FALSE, 3),
('svc-021', 'cat-005', 'Digital Signature', 'Digital Signature Certificate (DSC) application and processing', 1999.00, NULL, FALSE, 4),
('svc-022', 'cat-005', 'DIN Application', 'Director Identification Number (DIN) application', NULL, 'Starting from ₹499', FALSE, 5),
('svc-023', 'cat-005', 'EPF Registration', 'Employee Provident Fund (EPF) registration', NULL, 'Starting from ₹999', FALSE, 6),
('svc-024', 'cat-005', 'SSI/MSME/Udyog Aadhar Registration', 'MSME/Udyog Aadhar registration for small and medium enterprises', NULL, 'Starting from ₹999', FALSE, 7)
ON DUPLICATE KEY UPDATE name=name;

-- =====================================================
-- Insert Services - Returns
-- =====================================================

INSERT INTO services (id, category_id, name, description, price, price_text, is_featured, display_order) VALUES
('svc-025', 'cat-006', 'GST Returns', 'GST return filing services including GSTR-1, GSTR-3B, GSTR-9, and GSTR-9C', NULL, 'Starting from ₹599', FALSE, 1),
('svc-026', 'cat-006', 'Income Tax Returns', 'Income tax return filing for individuals and businesses', NULL, 'Starting from ₹999', FALSE, 2),
('svc-027', 'cat-006', 'TDS Returns', 'TDS return filing and revision services', NULL, 'Starting from ₹999', FALSE, 3),
('svc-028', 'cat-006', 'TDS Returns Revision', 'Revision of filed TDS returns', NULL, 'Starting from ₹1499', FALSE, 4),
('svc-029', 'cat-006', 'PF Returns', 'Provident Fund return filing services', NULL, 'Starting from ₹999', FALSE, 5),
('svc-030', 'cat-006', 'ESI Returns', 'Employee State Insurance return filing services', NULL, 'Starting from ₹999', FALSE, 6)
ON DUPLICATE KEY UPDATE name=name;

-- =====================================================
-- Insert Services - Annual Filings
-- =====================================================

INSERT INTO services (id, category_id, name, description, price, price_text, is_featured, display_order) VALUES
('svc-031', 'cat-007', 'Private Limited Company Annual Filing', 'ROC annual compliance for private limited companies including AOC-4, MGT-7, ADT-1', 3999.00, NULL, TRUE, 1),
('svc-032', 'cat-007', 'LLP Annual Filing', 'LLP annual return filing including Form 8 and Form 11', NULL, 'Starting from ₹2999', FALSE, 2),
('svc-033', 'cat-007', 'Public Limited Company Annual Filing', 'Annual filing for public limited companies', NULL, 'Contact Us', FALSE, 3),
('svc-034', 'cat-007', 'OPC Annual Filing', 'One Person Company annual filing and compliance', NULL, 'Starting from ₹2999', FALSE, 4),
('svc-035', 'cat-007', 'NPO/Section 8 Company Annual Filing', 'Annual filing for non-profit organizations', NULL, 'Starting from ₹2999', FALSE, 5),
('svc-036', 'cat-007', 'Nidhi Company Annual Filing', 'Annual filing for Nidhi companies', NULL, 'Contact Us', FALSE, 6),
('svc-037', 'cat-007', 'Producer Company Annual Filing', 'Annual filing for producer companies', NULL, 'Contact Us', FALSE, 7),
('svc-038', 'cat-007', 'Trust Annual Filing', 'Annual filing for trusts', NULL, 'Contact Us', FALSE, 8)
ON DUPLICATE KEY UPDATE name=name;

-- =====================================================
-- Insert Services - Change Services
-- =====================================================

INSERT INTO services (id, category_id, name, description, price, price_text, is_featured, display_order) VALUES
('svc-039', 'cat-008', 'Add A Director', 'Add a new director to your company', NULL, 'Starting from ₹1999', FALSE, 1),
('svc-040', 'cat-008', 'Removal/Resignation of Director', 'Remove or process resignation of a director', NULL, 'Starting from ₹1999', FALSE, 2),
('svc-041', 'cat-008', 'Add/Remove a Partner in LLP', 'Add or remove partners in Limited Liability Partnership', NULL, 'Starting from ₹1999', FALSE, 3),
('svc-042', 'cat-008', 'Change in LLP Agreement', 'Modify LLP agreement and file necessary forms', NULL, 'Starting from ₹2999', FALSE, 4),
('svc-043', 'cat-008', 'Change of Registered Office Address', 'Change registered office address of company or LLP', NULL, 'Starting from ₹1999', FALSE, 5),
('svc-044', 'cat-008', 'Increase in Authorized Capital', 'Increase authorized capital of the company', NULL, 'Starting from ₹2999', FALSE, 6),
('svc-045', 'cat-008', 'Change in DIN', 'Change Director Identification Number details', NULL, 'Starting from ₹999', FALSE, 7),
('svc-046', 'cat-008', 'Surrender Your DIN', 'Surrender Director Identification Number', NULL, 'Starting from ₹999', FALSE, 8),
('svc-047', 'cat-008', 'Appointment of Auditors', 'Appoint auditors for the company', NULL, 'Starting from ₹1999', FALSE, 9),
('svc-048', 'cat-008', 'Share Transfer & Transmission', 'Transfer or transmission of company shares', NULL, 'Starting from ₹1999', FALSE, 10),
('svc-049', 'cat-008', 'Company Name Change', 'Change company name and update all documents', NULL, 'Starting from ₹3999', FALSE, 11),
('svc-050', 'cat-008', 'LLP Name Change', 'Change LLP name and update registration', NULL, 'Starting from ₹2999', FALSE, 12),
('svc-051', 'cat-008', 'MOA/AOA Amendment', 'Amend Memorandum and Articles of Association', NULL, 'Starting from ₹2999', FALSE, 13),
('svc-052', 'cat-008', 'MOA/AOA Printing', 'Printing services for MOA and AOA documents', NULL, 'Starting from ₹999', FALSE, 14)
ON DUPLICATE KEY UPDATE name=name;

-- =====================================================
-- Insert Services - Closure
-- =====================================================

INSERT INTO services (id, category_id, name, description, price, price_text, is_featured, display_order) VALUES
('svc-053', 'cat-009', 'Strike Off Company', 'Strike off private limited company', NULL, 'Starting from ₹3999', FALSE, 1),
('svc-054', 'cat-009', 'Strike Off LLP', 'Strike off Limited Liability Partnership', NULL, 'Starting from ₹2999', FALSE, 2),
('svc-055', 'cat-009', 'Dissolution of Firms', 'Dissolution of partnership firms', NULL, 'Starting from ₹1999', FALSE, 3),
('svc-056', 'cat-009', 'Strike Off OPC', 'Strike off One Person Company', NULL, 'Starting from ₹2999', FALSE, 4)
ON DUPLICATE KEY UPDATE name=name;

-- =====================================================
-- Insert Services - Legal Drafting
-- =====================================================

INSERT INTO services (id, category_id, name, description, price, price_text, is_featured, display_order) VALUES
('svc-057', 'cat-010', 'Download Library', 'Access to legal document templates and forms', NULL, 'Contact Us', FALSE, 1),
('svc-058', 'cat-010', 'Customized Drafting', 'Custom legal document drafting services', NULL, 'Contact Us', FALSE, 2)
ON DUPLICATE KEY UPDATE name=name;

-- =====================================================
-- Insert Services - Special
-- =====================================================

INSERT INTO services (id, category_id, name, description, price, price_text, is_featured, display_order) VALUES
('svc-059', 'cat-011', 'GST LUT Letter of Undertaking', 'GST LUT filing for export businesses', NULL, 'Starting from ₹999', FALSE, 1),
('svc-060', 'cat-011', 'GST Cancellation', 'Cancel GST registration', NULL, 'Starting from ₹1499', FALSE, 2),
('svc-061', 'cat-011', 'DIR 3 KYC', 'Director KYC filing (DIR-3 KYC)', NULL, 'Starting from ₹999', FALSE, 3),
('svc-062', 'cat-011', 'ROC Search Report', 'ROC search report and due diligence services', NULL, 'Contact Us', FALSE, 4),
('svc-063', 'cat-011', 'Commencement of Business (INC 20A)', 'File INC-20A for commencement of business', NULL, 'Starting from ₹1999', FALSE, 5)
ON DUPLICATE KEY UPDATE name=name;

-- =====================================================
-- Insert Services - Trademark
-- =====================================================

INSERT INTO services (id, category_id, name, description, price, price_text, is_featured, display_order) VALUES
('svc-064', 'cat-012', 'Trademark Registration', 'Complete trademark registration process with expert guidance', 6399.00, NULL, TRUE, 1),
('svc-065', 'cat-012', 'Trademark Objections', 'Handle trademark objections and responses', NULL, 'Starting from ₹2999', FALSE, 2),
('svc-066', 'cat-012', 'Trademark Assignment', 'Transfer trademark ownership', NULL, 'Starting from ₹3999', FALSE, 3),
('svc-067', 'cat-012', 'Trademark Renewal', 'Renew existing trademark registration', NULL, 'Starting from ₹4999', FALSE, 4),
('svc-068', 'cat-012', 'Trademark Opposition', 'Handle trademark opposition proceedings', NULL, 'Starting from ₹4999', FALSE, 5),
('svc-069', 'cat-012', 'Trademark Withdrawal', 'Withdraw trademark application', NULL, 'Starting from ₹1999', FALSE, 6),
('svc-070', 'cat-012', 'Trademark Rectification', 'Rectify trademark registration details', NULL, 'Starting from ₹3999', FALSE, 7),
('svc-071', 'cat-012', 'Trademark Watch Services', 'Monitor trademark applications and registrations', NULL, 'Contact Us', FALSE, 8),
('svc-072', 'cat-012', 'International Trademark Registration', 'International trademark registration under Madrid Protocol', NULL, 'Contact Us', FALSE, 9)
ON DUPLICATE KEY UPDATE name=name;

-- =====================================================
-- Insert Services - Copyright
-- =====================================================

INSERT INTO services (id, category_id, name, description, price, price_text, is_featured, display_order) VALUES
('svc-073', 'cat-013', 'Copyright Application', 'Copyright registration application and processing', NULL, 'Starting from ₹4999', FALSE, 1)
ON DUPLICATE KEY UPDATE name=name;

-- =====================================================
-- Insert Services - Patent
-- =====================================================

INSERT INTO services (id, category_id, name, description, price, price_text, is_featured, display_order) VALUES
('svc-074', 'cat-014', 'Patent Registration', 'Patent application and registration services', NULL, 'Contact Us', FALSE, 1),
('svc-075', 'cat-014', 'Patent Search', 'Patent search and prior art analysis', NULL, 'Contact Us', FALSE, 2),
('svc-076', 'cat-014', 'Provisional Patent', 'Provisional patent application filing', NULL, 'Contact Us', FALSE, 3)
ON DUPLICATE KEY UPDATE name=name;

-- =====================================================
-- Insert Services - Accounting
-- =====================================================

INSERT INTO services (id, category_id, name, description, price, price_text, is_featured, display_order) VALUES
('svc-077', 'cat-015', 'Accounting', 'Bookkeeping and accounting services for businesses', NULL, 'Starting from ₹1999/month', FALSE, 1),
('svc-078', 'cat-015', 'Tax Consultancy Services', 'Expert tax consultancy for compliance and planning', 1499.00, NULL, TRUE, 2)
ON DUPLICATE KEY UPDATE name=name;

-- =====================================================
-- Insert Services - Payroll
-- =====================================================

INSERT INTO services (id, category_id, name, description, price, price_text, is_featured, display_order) VALUES
('svc-079', 'cat-016', 'Payroll', 'Payroll setup and processing services', NULL, 'Starting from ₹49/employee/month', FALSE, 1)
ON DUPLICATE KEY UPDATE name=name;

-- =====================================================
-- Insert Services - Digital Presence
-- =====================================================

INSERT INTO services (id, category_id, name, description, price, price_text, is_featured, display_order) VALUES
('svc-080', 'cat-017', 'Logo Design Services', 'Professional logo design with multiple concepts', NULL, 'Starting from ₹4499', FALSE, 1),
('svc-081', 'cat-017', 'Digital Marketing', 'Digital marketing and online presence services', NULL, 'Contact Us', FALSE, 2),
('svc-082', 'cat-017', 'Web Development', 'Website development and design services', NULL, 'Contact Us', FALSE, 3)
ON DUPLICATE KEY UPDATE name=name;

-- =====================================================
-- Insert Packages for Private Limited Company Registration
-- =====================================================

INSERT INTO service_packages (id, service_id, name, price, description, is_popular, display_order) VALUES
('pkg-001', 'svc-001', 'Basic Package', 7399.00, 'Essential company registration with all mandatory documents', FALSE, 1),
('pkg-002', 'svc-001', 'Standard Package', 9999.00, 'Company registration with additional compliance support', TRUE, 2),
('pkg-003', 'svc-001', 'Premium Package', 14999.00, 'Complete registration with 3 months post-incorporation support', FALSE, 3)
ON DUPLICATE KEY UPDATE name=name;

-- Features for Private Limited Company Packages
INSERT INTO package_features (id, package_id, feature, display_order) VALUES
('feat-001', 'pkg-001', 'Digital Signature Certificate (DSC) - 2 Directors', 1),
('feat-002', 'pkg-001', 'Director Identification Number (DIN) - 2 Directors', 2),
('feat-003', 'pkg-001', 'Company Name Approval (RUN)', 3),
('feat-004', 'pkg-001', 'Incorporation Certificate', 4),
('feat-005', 'pkg-001', 'Memorandum of Association (MOA)', 5),
('feat-006', 'pkg-001', 'Articles of Association (AOA)', 6),
('feat-007', 'pkg-001', 'PAN Application', 7),
('feat-008', 'pkg-001', 'TAN Application', 8),
('feat-009', 'pkg-002', 'Digital Signature Certificate (DSC) - 2 Directors', 1),
('feat-010', 'pkg-002', 'Director Identification Number (DIN) - 2 Directors', 2),
('feat-011', 'pkg-002', 'Company Name Approval (RUN)', 3),
('feat-012', 'pkg-002', 'Incorporation Certificate', 4),
('feat-013', 'pkg-002', 'Memorandum of Association (MOA)', 5),
('feat-014', 'pkg-002', 'Articles of Association (AOA)', 6),
('feat-015', 'pkg-002', 'PAN Application', 7),
('feat-016', 'pkg-002', 'TAN Application', 8),
('feat-017', 'pkg-002', 'Bank Account Opening Support', 9),
('feat-018', 'pkg-002', 'GST Registration Support', 10),
('feat-019', 'pkg-003', 'Digital Signature Certificate (DSC) - 2 Directors', 1),
('feat-020', 'pkg-003', 'Director Identification Number (DIN) - 2 Directors', 2),
('feat-021', 'pkg-003', 'Company Name Approval (RUN)', 3),
('feat-022', 'pkg-003', 'Incorporation Certificate', 4),
('feat-023', 'pkg-003', 'Memorandum of Association (MOA)', 5),
('feat-024', 'pkg-003', 'Articles of Association (AOA)', 6),
('feat-025', 'pkg-003', 'PAN Application', 7),
('feat-026', 'pkg-003', 'TAN Application', 8),
('feat-027', 'pkg-003', 'Bank Account Opening Support', 9),
('feat-028', 'pkg-003', 'GST Registration Support', 10),
('feat-029', 'pkg-003', '3 Months Post-Incorporation Compliance Support', 11),
('feat-030', 'pkg-003', 'Dedicated Account Manager', 12)
ON DUPLICATE KEY UPDATE feature=feature;

-- =====================================================
-- Insert Packages for Limited Liability Partnership
-- =====================================================

INSERT INTO service_packages (id, service_id, name, price, description, is_popular, display_order) VALUES
('pkg-004', 'svc-003', 'Basic Package', 6399.00, 'Essential LLP registration with all mandatory documents', FALSE, 1),
('pkg-005', 'svc-003', 'Standard Package', 8999.00, 'LLP registration with additional compliance support', TRUE, 2),
('pkg-006', 'svc-003', 'Premium Package', 12999.00, 'Complete registration with 3 months post-incorporation support', FALSE, 3)
ON DUPLICATE KEY UPDATE name=name;

-- Features for LLP Packages
INSERT INTO package_features (id, package_id, feature, display_order) VALUES
('feat-031', 'pkg-004', 'Digital Signature Certificate (DSC) - 2 Partners', 1),
('feat-032', 'pkg-004', 'Director Identification Number (DIN) - 2 Partners', 2),
('feat-033', 'pkg-004', 'LLP Name Approval (RUN)', 3),
('feat-034', 'pkg-004', 'LLP Incorporation Certificate', 4),
('feat-035', 'pkg-004', 'LLP Agreement Drafting', 5),
('feat-036', 'pkg-004', 'PAN Application', 6),
('feat-037', 'pkg-004', 'TAN Application', 7),
('feat-038', 'pkg-005', 'Digital Signature Certificate (DSC) - 2 Partners', 1),
('feat-039', 'pkg-005', 'Director Identification Number (DIN) - 2 Partners', 2),
('feat-040', 'pkg-005', 'LLP Name Approval (RUN)', 3),
('feat-041', 'pkg-005', 'LLP Incorporation Certificate', 4),
('feat-042', 'pkg-005', 'LLP Agreement Drafting', 5),
('feat-043', 'pkg-005', 'PAN Application', 6),
('feat-044', 'pkg-005', 'TAN Application', 7),
('feat-045', 'pkg-005', 'Bank Account Opening Support', 8),
('feat-046', 'pkg-005', 'GST Registration Support', 9),
('feat-047', 'pkg-006', 'Digital Signature Certificate (DSC) - 2 Partners', 1),
('feat-048', 'pkg-006', 'Director Identification Number (DIN) - 2 Partners', 2),
('feat-049', 'pkg-006', 'LLP Name Approval (RUN)', 3),
('feat-050', 'pkg-006', 'LLP Incorporation Certificate', 4),
('feat-051', 'pkg-006', 'LLP Agreement Drafting', 5),
('feat-052', 'pkg-006', 'PAN Application', 6),
('feat-053', 'pkg-006', 'TAN Application', 7),
('feat-054', 'pkg-006', 'Bank Account Opening Support', 8),
('feat-055', 'pkg-006', 'GST Registration Support', 9),
('feat-056', 'pkg-006', '3 Months Post-Incorporation Compliance Support', 10),
('feat-057', 'pkg-006', 'Dedicated Account Manager', 11)
ON DUPLICATE KEY UPDATE feature=feature;

-- =====================================================
-- Insert Packages for GST Registration
-- =====================================================

INSERT INTO service_packages (id, service_id, name, price, description, is_popular, display_order) VALUES
('pkg-007', 'svc-014', 'Basic Package', 1499.00, 'Essential GST registration service', FALSE, 1),
('pkg-008', 'svc-014', 'Standard Package', 2499.00, 'GST registration with consultation and support', TRUE, 2),
('pkg-009', 'svc-014', 'Premium Package', 3999.00, 'Complete GST registration with ongoing support', FALSE, 3)
ON DUPLICATE KEY UPDATE name=name;

-- Features for GST Registration Packages
INSERT INTO package_features (id, package_id, feature, display_order) VALUES
('feat-058', 'pkg-007', 'GST Registration Certificate', 1),
('feat-059', 'pkg-007', 'GSTIN Number', 2),
('feat-060', 'pkg-007', 'Application Filing', 3),
('feat-061', 'pkg-008', 'GST Registration Certificate', 1),
('feat-062', 'pkg-008', 'GSTIN Number', 2),
('feat-063', 'pkg-008', 'Application Filing', 3),
('feat-064', 'pkg-008', 'Expert Consultation', 4),
('feat-065', 'pkg-008', 'Document Preparation Support', 5),
('feat-066', 'pkg-009', 'GST Registration Certificate', 1),
('feat-067', 'pkg-009', 'GSTIN Number', 2),
('feat-068', 'pkg-009', 'Application Filing', 3),
('feat-069', 'pkg-009', 'Expert Consultation', 4),
('feat-070', 'pkg-009', 'Document Preparation Support', 5),
('feat-071', 'pkg-009', '3 Months Post-Registration Support', 6),
('feat-072', 'pkg-009', 'GST Return Filing Assistance', 7)
ON DUPLICATE KEY UPDATE feature=feature;

-- =====================================================
-- Insert Packages for ROC Annual Compliance
-- =====================================================

INSERT INTO service_packages (id, service_id, name, price, description, is_popular, display_order) VALUES
('pkg-010', 'svc-031', 'Basic Package', 3999.00, 'Essential annual compliance filing', FALSE, 1),
('pkg-011', 'svc-031', 'Standard Package', 5999.00, 'Annual compliance with additional support', TRUE, 2),
('pkg-012', 'svc-031', 'Premium Package', 8999.00, 'Complete annual compliance with ongoing support', FALSE, 3)
ON DUPLICATE KEY UPDATE name=name;

-- Features for ROC Annual Compliance Packages
INSERT INTO package_features (id, package_id, feature, display_order) VALUES
('feat-073', 'pkg-010', 'AOC-4 Filing (Annual Return)', 1),
('feat-074', 'pkg-010', 'MGT-7 Filing (Annual Return)', 2),
('feat-075', 'pkg-010', 'ADT-1 Filing (Auditor Appointment)', 3),
('feat-076', 'pkg-011', 'AOC-4 Filing (Annual Return)', 1),
('feat-077', 'pkg-011', 'MGT-7 Filing (Annual Return)', 2),
('feat-078', 'pkg-011', 'ADT-1 Filing (Auditor Appointment)', 3),
('feat-079', 'pkg-011', 'Board Meeting Minutes Drafting', 4),
('feat-080', 'pkg-011', 'AGM Minutes Drafting', 5),
('feat-081', 'pkg-012', 'AOC-4 Filing (Annual Return)', 1),
('feat-082', 'pkg-012', 'MGT-7 Filing (Annual Return)', 2),
('feat-083', 'pkg-012', 'ADT-1 Filing (Auditor Appointment)', 3),
('feat-084', 'pkg-012', 'Board Meeting Minutes Drafting', 4),
('feat-085', 'pkg-012', 'AGM Minutes Drafting', 5),
('feat-086', 'pkg-012', 'Quarterly Compliance Support', 6),
('feat-087', 'pkg-012', 'Dedicated Compliance Manager', 7)
ON DUPLICATE KEY UPDATE feature=feature;

-- =====================================================
-- Insert Packages for Trademark Registration
-- =====================================================

INSERT INTO service_packages (id, service_id, name, price, description, is_popular, display_order) VALUES
('pkg-013', 'svc-064', 'Basic Package', 6399.00, 'Essential trademark registration for one class', FALSE, 1),
('pkg-014', 'svc-064', 'Standard Package', 8999.00, 'Trademark registration with search and monitoring', TRUE, 2),
('pkg-015', 'svc-064', 'Premium Package', 12999.00, 'Complete trademark registration with objection handling', FALSE, 3)
ON DUPLICATE KEY UPDATE name=name;

-- Features for Trademark Registration Packages
INSERT INTO package_features (id, package_id, feature, display_order) VALUES
('feat-088', 'pkg-013', 'Trademark Search (1 Class)', 1),
('feat-089', 'pkg-013', 'Trademark Application Filing', 2),
('feat-090', 'pkg-013', 'Government Fees (1 Class)', 3),
('feat-091', 'pkg-013', 'Application Tracking', 4),
('feat-092', 'pkg-014', 'Trademark Search (1 Class)', 1),
('feat-093', 'pkg-014', 'Trademark Application Filing', 2),
('feat-094', 'pkg-014', 'Government Fees (1 Class)', 3),
('feat-095', 'pkg-014', 'Application Tracking', 4),
('feat-096', 'pkg-014', 'Trademark Watch Service (6 Months)', 5),
('feat-097', 'pkg-014', 'Expert Consultation', 6),
('feat-098', 'pkg-015', 'Trademark Search (1 Class)', 1),
('feat-099', 'pkg-015', 'Trademark Application Filing', 2),
('feat-100', 'pkg-015', 'Government Fees (1 Class)', 3),
('feat-101', 'pkg-015', 'Application Tracking', 4),
('feat-102', 'pkg-015', 'Trademark Watch Service (12 Months)', 5),
('feat-103', 'pkg-015', 'Expert Consultation', 6),
('feat-104', 'pkg-015', 'Objection Response Handling', 7),
('feat-105', 'pkg-015', 'Registration Certificate', 8)
ON DUPLICATE KEY UPDATE feature=feature;

-- =====================================================
-- Insert Packages for Tax Consultancy Services
-- =====================================================

INSERT INTO service_packages (id, service_id, name, price, description, is_popular, display_order) VALUES
('pkg-016', 'svc-078', 'Basic Consultation', 1499.00, 'One-time tax consultation session', FALSE, 1),
('pkg-017', 'svc-078', 'Standard Package', 2999.00, 'Quarterly tax consultation and planning', TRUE, 2),
('pkg-018', 'svc-078', 'Premium Package', 5999.00, 'Annual tax consultancy with ongoing support', FALSE, 3)
ON DUPLICATE KEY UPDATE name=name;

-- Features for Tax Consultancy Packages
INSERT INTO package_features (id, package_id, feature, display_order) VALUES
('feat-106', 'pkg-016', 'One-time Tax Consultation (1 Hour)', 1),
('feat-107', 'pkg-016', 'Tax Planning Advice', 2),
('feat-108', 'pkg-017', 'Quarterly Tax Consultation (4 Sessions)', 1),
('feat-109', 'pkg-017', 'Tax Planning and Optimization', 2),
('feat-110', 'pkg-017', 'Compliance Review', 3),
('feat-111', 'pkg-018', 'Annual Tax Consultation (12 Sessions)', 1),
('feat-112', 'pkg-018', 'Tax Planning and Optimization', 2),
('feat-113', 'pkg-018', 'Compliance Review', 3),
('feat-114', 'pkg-018', 'Dedicated Tax Advisor', 4),
('feat-115', 'pkg-018', 'Priority Support', 5)
ON DUPLICATE KEY UPDATE feature=feature;

-- =====================================================
-- Admin Users Table (for admin panel)
-- =====================================================

CREATE TABLE IF NOT EXISTS admin_users (
  id CHAR(36) PRIMARY KEY,
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
INSERT INTO admin_users (id, username, email, password, status) VALUES
('admin-001', 'admin', 'admin@silverwebbuzz.in', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'active')
ON DUPLICATE KEY UPDATE username=username;

-- Note: The default password is 'admin123'
-- Please change this password immediately after first login!

-- =====================================================
-- End of Schema
-- =====================================================
