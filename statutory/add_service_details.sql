-- =====================================================
-- ALTER TABLE: Add new fields to service_details table
-- =====================================================
-- Run this first to add the new columns

-- ALTER TABLE: Add new fields to service_details table
-- Note: If columns already exist, you'll get an error. You can ignore it or drop columns first.
-- To check if columns exist: DESCRIBE service_details;

ALTER TABLE service_details 
ADD COLUMN processing_time VARCHAR(255) AFTER full_description,
ADD COLUMN documents_required TEXT AFTER processing_time,
ADD COLUMN faqs TEXT AFTER documents_required,
ADD COLUMN benefits TEXT AFTER faqs;

-- =====================================================
-- INSERT Service Details
-- =====================================================
-- NOTE: Service IDs are auto-incremented. Please verify service IDs from your services table
-- before running these INSERT statements. You can find service IDs using:
-- SELECT id, name FROM services ORDER BY id;

-- Service Details for Private Limited Company Registration
-- Find service_id: SELECT id FROM services WHERE name = 'Private Limited Company Registration';
INSERT INTO service_details (service_id, overview, full_description, processing_time, documents_required, benefits, faqs) VALUES
((SELECT id FROM services WHERE name = 'Private Limited Company Registration' LIMIT 1),
'Private Limited Company is the most popular business structure in India. It offers limited liability protection, separate legal entity status, and easier access to funding.',
'Private Limited Company registration in India provides a robust foundation for your business with limited liability protection, perpetual succession, and enhanced credibility. Our comprehensive service includes DSC, DIN, name approval, incorporation certificate, MOA, AOA, PAN, and TAN.',
'10-15 business days',
'PAN Card of Directors|Aadhaar Card of Directors|Address Proof (Electricity Bill/Rent Agreement)|Passport Size Photos|Registered Office Address Proof|NOC from Property Owner (if rented)',
'Limited Liability Protection|Separate Legal Entity|Easy Fundraising|Perpetual Succession|Enhanced Credibility|Tax Benefits|Easy Transfer of Shares',
'What is a Private Limited Company?|A Private Limited Company is a business structure where shareholders have limited liability and the company is a separate legal entity.|What is the minimum capital required?|There is no minimum capital requirement. You can start with any amount.|Can a single person form a Private Limited Company?|No, minimum 2 directors and 2 shareholders are required. For single person, consider OPC.|What are the compliance requirements?|Annual filing of financial statements, annual returns, and board meetings are mandatory.|Is foreign investment allowed?|Yes, subject to FDI guidelines and sectoral caps.'
)
ON DUPLICATE KEY UPDATE
overview = VALUES(overview),
full_description = VALUES(full_description),
processing_time = VALUES(processing_time),
documents_required = VALUES(documents_required),
benefits = VALUES(benefits),
faqs = VALUES(faqs);

-- Service Details for Limited Liability Partnership
INSERT INTO service_details (service_id, overview, full_description, processing_time, documents_required, benefits, faqs) VALUES
((SELECT id FROM services WHERE name = 'Limited Liability Partnership' LIMIT 1),
'LLP combines the benefits of partnership and company structure. It offers limited liability with operational flexibility.',
'Limited Liability Partnership (LLP) registration provides the flexibility of a partnership with the protection of limited liability. Ideal for professionals and service businesses.',
'12-18 business days',
'PAN Card of Partners|Aadhaar Card of Partners|Address Proof|Passport Size Photos|Registered Office Address Proof|LLP Agreement Draft',
'Limited Liability|Operational Flexibility|Less Compliance|No Minimum Capital|Tax Benefits|Easy to Dissolve',
'What is an LLP?|LLP is a hybrid structure combining features of partnership and company.|What is the minimum number of partners?|Minimum 2 partners are required. At least one must be resident in India.|What are the compliance requirements?|LLP needs to file Form 8 and Form 11 annually.|Can LLP raise funds?|LLP cannot issue shares but can raise funds through partners capital.'
)
ON DUPLICATE KEY UPDATE
overview = VALUES(overview),
full_description = VALUES(full_description),
processing_time = VALUES(processing_time),
documents_required = VALUES(documents_required),
benefits = VALUES(benefits),
faqs = VALUES(faqs);

-- Service Details for GST Registration
INSERT INTO service_details (service_id, overview, full_description, processing_time, documents_required, benefits, faqs) VALUES
((SELECT id FROM services WHERE name = 'GST Registration' LIMIT 1),
'GST Registration is mandatory for businesses with turnover exceeding ₹20 lakh (₹10 lakh for special states). Essential for legal business operations.',
'GST (Goods and Services Tax) registration enables your business to collect and remit GST, claim input tax credit, and operate legally in India.',
'5-7 business days',
'PAN Card|Aadhaar Card|Business Address Proof|Bank Account Details|Digital Signature Certificate|Photographs|Business Registration Certificate',
'Legal Business Operations|Input Tax Credit|Wider Customer Base|Online Business Eligibility|Compliance with Law',
'Who needs GST registration?|Businesses with annual turnover above ₹20 lakh (₹10 lakh for special states) must register.|What is the penalty for not registering?|Penalty of 10% of tax due or ₹10,000, whichever is higher.|Can I register voluntarily?|Yes, businesses below threshold can register voluntarily.|Is GST registration free?|No, government fees apply. Our service includes all fees.|What documents are needed?|PAN, address proof, bank details, and business registration documents.'
)
ON DUPLICATE KEY UPDATE
overview = VALUES(overview),
full_description = VALUES(full_description),
processing_time = VALUES(processing_time),
documents_required = VALUES(documents_required),
benefits = VALUES(benefits),
faqs = VALUES(faqs);

-- Service Details for Private Limited Company Annual Filing
INSERT INTO service_details (service_id, overview, full_description, processing_time, documents_required, benefits, faqs) VALUES
((SELECT id FROM services WHERE name = 'Private Limited Company Annual Filing' LIMIT 1),
'Annual compliance filing is mandatory for all Private Limited Companies. Includes AOC-4, MGT-7, and ADT-1 forms.',
'Annual filing ensures your company remains compliant with ROC requirements. Includes financial statements, annual return, and auditor appointment.',
'15-20 business days',
'Financial Statements (Balance Sheet, P&L)|Annual Return|Auditor Appointment Details|Board Meeting Minutes|AGM Minutes|Directors Report',
'Maintain Active Status|Avoid Penalties|Legal Compliance|Good Corporate Governance|Business Credibility',
'What is annual filing?|Annual filing includes submission of financial statements and annual return to ROC.|What are the due dates?|AOC-4: 30 days from AGM, MGT-7: 60 days from AGM.|What happens if I miss the deadline?|Late fees and penalties apply. Company status may become inactive.|Is audit mandatory?|Yes, for companies with turnover above ₹1 crore or capital above ₹10 lakh.|Can I file myself?|Yes, but professional assistance ensures accuracy and compliance.'
)
ON DUPLICATE KEY UPDATE
overview = VALUES(overview),
full_description = VALUES(full_description),
processing_time = VALUES(processing_time),
documents_required = VALUES(documents_required),
benefits = VALUES(benefits),
faqs = VALUES(faqs);

-- Service Details for Trademark Registration
INSERT INTO service_details (service_id, overview, full_description, processing_time, documents_required, benefits, faqs) VALUES
((SELECT id FROM services WHERE name = 'Trademark Registration' LIMIT 1),
'Trademark registration protects your brand name, logo, and slogan. Provides exclusive rights and legal protection.',
'Trademark registration gives you exclusive rights to use your brand mark and prevents others from using similar marks. Essential for brand protection.',
'6-12 months (Registration Certificate)',
'Trademark Logo/Word|Applicant Identity Proof|Applicant Address Proof|Power of Attorney|User Affidavit (if claiming prior use)|Business Registration Certificate',
'Exclusive Rights|Brand Protection|Legal Recourse|Business Value|Asset Creation|Global Protection',
'What can be trademarked?|Brand names, logos, slogans, sounds, and even colors can be trademarked.|How long does it take?|6-12 months for registration certificate, but protection starts from application date.|What is trademark validity?|Trademark is valid for 10 years and can be renewed indefinitely.|What if someone uses my trademark?|You can take legal action for infringement once registered.|Is trademark search necessary?|Yes, to check if similar marks exist and avoid objections.'
)
ON DUPLICATE KEY UPDATE
overview = VALUES(overview),
full_description = VALUES(full_description),
processing_time = VALUES(processing_time),
documents_required = VALUES(documents_required),
benefits = VALUES(benefits),
faqs = VALUES(faqs);

-- Service Details for Tax Consultancy Services
INSERT INTO service_details (service_id, overview, full_description, processing_time, documents_required, benefits, faqs) VALUES
((SELECT id FROM services WHERE name = 'Tax Consultancy Services' LIMIT 1),
'Expert tax consultancy helps optimize your tax liability, ensure compliance, and maximize savings through strategic planning.',
'Professional tax consultancy services for individuals and businesses. Includes tax planning, compliance review, and optimization strategies.',
'Ongoing Service',
'Previous Tax Returns|Financial Statements|Investment Proofs|Salary Slips|Form 16|Bank Statements',
'Tax Optimization|Compliance Assurance|Expert Guidance|Savings Maximization|Risk Mitigation',
'What is tax consultancy?|Professional advice on tax planning, compliance, and optimization.|How can it help me?|Reduces tax liability, ensures compliance, and maximizes savings.|When should I consult?|Before financial year end for planning, and during year for compliance.|Is it only for businesses?|No, individuals and businesses both can benefit from tax consultancy.|What documents are needed?|Financial statements, tax returns, and investment proofs.'
)
ON DUPLICATE KEY UPDATE
overview = VALUES(overview),
full_description = VALUES(full_description),
processing_time = VALUES(processing_time),
documents_required = VALUES(documents_required),
benefits = VALUES(benefits),
faqs = VALUES(faqs);

-- Service Details for PAN Application
INSERT INTO service_details (service_id, overview, full_description, processing_time, documents_required, benefits, faqs) VALUES
((SELECT id FROM services WHERE name = 'PAN Application' LIMIT 1),
'PAN (Permanent Account Number) is mandatory for financial transactions, tax filing, and business operations in India.',
'PAN is a 10-character alphanumeric identifier issued by Income Tax Department. Required for all financial and tax-related transactions.',
'7-10 business days',
'Identity Proof (Aadhaar/Passport/Voter ID)|Address Proof|Date of Birth Proof|Passport Size Photo|Form 49A (for Indian citizens)',
'Mandatory for Tax Filing|Required for Bank Accounts|Needed for Investments|Business Operations|Financial Transactions',
'Who needs PAN?|All individuals and entities earning taxable income or conducting financial transactions.|What documents are accepted?|Aadhaar, Passport, Voter ID, Driving License for identity proof.|Can I apply online?|Yes, online application is available through NSDL or UTIITSL.|What is the fee?|₹107 for Indian communication address, ₹989 for foreign address.|How long is PAN valid?|PAN is permanent and valid for lifetime.'
)
ON DUPLICATE KEY UPDATE
overview = VALUES(overview),
full_description = VALUES(full_description),
processing_time = VALUES(processing_time),
documents_required = VALUES(documents_required),
benefits = VALUES(benefits),
faqs = VALUES(faqs);

-- Service Details for TAN Application
INSERT INTO service_details (service_id, overview, full_description, processing_time, documents_required, benefits, faqs) VALUES
((SELECT id FROM services WHERE name = 'TAN Application' LIMIT 1),
'TAN (Tax Deduction and Collection Account Number) is mandatory for entities deducting or collecting tax at source.',
'TAN is required for filing TDS/TCS returns. Mandatory for employers, businesses making payments subject to TDS, and entities collecting tax.',
'7-10 business days',
'PAN Card|Address Proof|Business Registration Certificate|Form 49B|Authorized Signatory Details',
'Mandatory for TDS Filing|Legal Compliance|Smooth Tax Operations|Required for Employers|Business Requirement',
'Who needs TAN?|All entities deducting or collecting tax at source must have TAN.|Is TAN different from PAN?|Yes, TAN is for TDS/TCS operations, PAN is for income tax.|Can one entity have multiple TAN?|No, one entity can have only one TAN.|What is the penalty for not having TAN?|Penalty of ₹10,000 for non-compliance.|Is TAN mandatory for all businesses?|Only if you deduct or collect tax at source.'
)
ON DUPLICATE KEY UPDATE
overview = VALUES(overview),
full_description = VALUES(full_description),
processing_time = VALUES(processing_time),
documents_required = VALUES(documents_required),
benefits = VALUES(benefits),
faqs = VALUES(faqs);

-- Service Details for Income Tax Returns
INSERT INTO service_details (service_id, overview, full_description, processing_time, documents_required, benefits, faqs) VALUES
((SELECT id FROM services WHERE name = 'Income Tax Returns' LIMIT 1),
'Income Tax Return filing is mandatory for individuals and businesses meeting certain income thresholds. Ensures compliance and enables refund claims.',
'Professional ITR filing service ensures accurate tax calculation, maximum deductions, and timely compliance. Includes verification and refund processing.',
'3-5 business days (after document submission)',
'Form 16|Salary Slips|Bank Statements|Investment Proofs (80C, 80D, etc.)|Rent Receipts|Previous ITR (if any)|TDS Certificates',
'Legal Compliance|Refund Claims|Loan Processing|Visa Applications|Tax Planning|Documentation',
'Who must file ITR?|Individuals with income above ₹2.5 lakh (₹3 lakh for senior citizens, ₹5 lakh for super seniors).|What is the due date?|July 31 for individuals, varies for businesses.|Can I file belated return?|Yes, with penalty up to December 31.|What if I miss the deadline?|Belated return can be filed with penalty and interest.|Is e-verification mandatory?|Yes, within 120 days of filing.'
)
ON DUPLICATE KEY UPDATE
overview = VALUES(overview),
full_description = VALUES(full_description),
processing_time = VALUES(processing_time),
documents_required = VALUES(documents_required),
benefits = VALUES(benefits),
faqs = VALUES(faqs);

-- Service Details for TDS Returns
INSERT INTO service_details (service_id, overview, full_description, processing_time, documents_required, benefits, faqs) VALUES
((SELECT id FROM services WHERE name = 'TDS Returns' LIMIT 1),
'TDS Return filing is mandatory for all entities deducting tax at source. Quarterly filing ensures compliance and avoids penalties.',
'Professional TDS return filing service ensures accurate calculation, timely submission, and compliance with TDS provisions.',
'5-7 business days',
'TDS Certificates|Challan Details|PAN of Deductees|TDS Details|Form 24Q/26Q/27Q|Previous Returns',
'Legal Compliance|Avoid Penalties|Smooth Operations|TDS Credit|Good Standing',
'What is TDS return?|Quarterly return showing details of tax deducted at source.|What are the due dates?|Q1: July 31, Q2: Oct 31, Q3: Jan 31, Q4: May 31.|What is the penalty for late filing?|₹200 per day of delay, subject to maximum of TDS amount.|Which form to use?|Form 24Q for salary, 26Q for non-salary, 27Q for NRIs.|Is TAN mandatory?|Yes, TAN is required for TDS return filing.'
)
ON DUPLICATE KEY UPDATE
overview = VALUES(overview),
full_description = VALUES(full_description),
processing_time = VALUES(processing_time),
documents_required = VALUES(documents_required),
benefits = VALUES(benefits),
faqs = VALUES(faqs);

-- Service Details for Add A Director
INSERT INTO service_details (service_id, overview, full_description, processing_time, documents_required, benefits, faqs) VALUES
((SELECT id FROM services WHERE name = 'Add A Director' LIMIT 1),
'Adding a director to your company requires filing DIR-12 with ROC. Professional service ensures smooth process and compliance.',
'Add a new director to your company with proper documentation and ROC filing. Includes DIN application if needed.',
'7-10 business days',
'Director PAN Card|Director Aadhaar Card|Director Address Proof|Director Photo|Board Resolution|Consent Letter|DSC of Director',
'Business Expansion|Expertise Addition|Compliance|Proper Documentation|ROC Filing',
'How to add a director?|File DIR-12 with ROC along with required documents and board resolution.|Is DIN required?|Yes, director must have DIN before appointment.|What documents are needed?|PAN, Aadhaar, address proof, photo, and board resolution.|Can foreign national be director?|Yes, subject to compliance with Companies Act.|What is the fee?|Government fees apply. Our service includes all charges.'
)
ON DUPLICATE KEY UPDATE
overview = VALUES(overview),
full_description = VALUES(full_description),
processing_time = VALUES(processing_time),
documents_required = VALUES(documents_required),
benefits = VALUES(benefits),
faqs = VALUES(faqs);

-- Service Details for Company Name Change
INSERT INTO service_details (service_id, overview, full_description, processing_time, documents_required, benefits, faqs) VALUES
((SELECT id FROM services WHERE name = 'Company Name Change' LIMIT 1),
'Company name change requires ROC approval and updating all documents. Professional service ensures smooth transition.',
'Change your company name with proper ROC approval and documentation. Includes name approval, MOA/AOA amendment, and certificate update.',
'20-30 business days',
'Board Resolution|Special Resolution|Name Availability|MOA/AOA|Current Registration Certificate|Digital Signature',
'Brand Rebranding|Business Alignment|Legal Compliance|Documentation Update|Smooth Transition',
'How to change company name?|Get name approval, pass special resolution, file forms with ROC.|What is the process?|Name approval → Special resolution → ROC filing → Certificate update.|Can any name be chosen?|Name must be unique and comply with Companies Act guidelines.|What documents need updating?|MOA, AOA, certificates, bank accounts, and all business documents.|How long does it take?|20-30 business days for complete process.'
)
ON DUPLICATE KEY UPDATE
overview = VALUES(overview),
full_description = VALUES(full_description),
processing_time = VALUES(processing_time),
documents_required = VALUES(documents_required),
benefits = VALUES(benefits),
faqs = VALUES(faqs);

-- Service Details for Strike Off Company
INSERT INTO service_details (service_id, overview, full_description, processing_time, documents_required, benefits, faqs) VALUES
((SELECT id FROM services WHERE name = 'Strike Off Company' LIMIT 1),
'Strike off company when business is no longer operational. Voluntary strike off is faster and cost-effective than winding up.',
'Strike off your company when it is no longer needed. Includes compliance check, application filing, and closure process.',
'3-6 months',
'Board Resolution|Special Resolution|Indemnity Bond|Statement of Accounts|No Objection Certificate|Affidavit|Latest Financial Statements',
'Cost Effective|Faster Process|Legal Closure|No Liabilities|Clean Exit',
'What is strike off?|Removal of company name from ROC register when company is defunct.|When can company be struck off?|When company has no operations, assets, or liabilities.|What is the process?|File STK-2 form with ROC after meeting eligibility criteria.|Can struck off company be revived?|Yes, within 20 years with proper application.|What are the requirements?|No assets, no liabilities, all compliances up to date.'
)
ON DUPLICATE KEY UPDATE
overview = VALUES(overview),
full_description = VALUES(full_description),
processing_time = VALUES(processing_time),
documents_required = VALUES(documents_required),
benefits = VALUES(benefits),
faqs = VALUES(faqs);

-- Service Details for GST Returns
INSERT INTO service_details (service_id, overview, full_description, processing_time, documents_required, benefits, faqs) VALUES
((SELECT id FROM services WHERE name = 'GST Returns' LIMIT 1),
'GST return filing is mandatory for all GST registered businesses. Monthly/quarterly filing ensures compliance and enables input tax credit.',
'Professional GST return filing service ensures accurate GSTR-1, GSTR-3B, and annual returns. Includes reconciliation and error correction.',
'3-5 business days per return',
'Sales Invoices|Purchase Invoices|Bank Statements|E-way Bills|Credit/Debit Notes|Input Tax Credit Details|Previous Returns',
'Legal Compliance|Input Tax Credit|Avoid Penalties|Smooth Operations|Refund Claims',
'Which returns to file?|GSTR-1 (monthly/quarterly), GSTR-3B (monthly), GSTR-9 (annual).|What are the due dates?|GSTR-1: 11th of next month, GSTR-3B: 20th of next month.|What is the penalty for late filing?|₹50 per day for nil return, ₹200 per day for others.|Can I revise returns?|GSTR-1 can be revised, GSTR-3B cannot.|Is professional help necessary?|Recommended for accuracy and compliance.'
)
ON DUPLICATE KEY UPDATE
overview = VALUES(overview),
full_description = VALUES(full_description),
processing_time = VALUES(processing_time),
documents_required = VALUES(documents_required),
benefits = VALUES(benefits),
faqs = VALUES(faqs);

-- Service Details for One Person Company (OPC)
INSERT INTO service_details (service_id, overview, full_description, processing_time, documents_required, benefits, faqs) VALUES
((SELECT id FROM services WHERE name = 'One Person Company (OPC)' LIMIT 1),
'OPC is ideal for single entrepreneurs who want limited liability protection without needing a partner. Perfect for solo business owners.',
'One Person Company (OPC) registration allows a single person to form a company with limited liability. It combines benefits of sole proprietorship and private limited company.',
'10-15 business days',
'PAN Card|Aadhaar Card|Address Proof|Passport Size Photo|Registered Office Address Proof|Nominee Details and Documents|NOC from Property Owner',
'Limited Liability|Single Ownership|Separate Legal Entity|Less Compliance|Easy to Convert|Tax Benefits',
'What is OPC?|One Person Company allows single person to form company with limited liability.|Can OPC have multiple directors?|No, OPC can have only one director and one member.|What is a nominee?|Nominee is mandatory in OPC to take over in case of member death.|Can OPC be converted?|Yes, OPC can be converted to Private Limited Company after 2 years.|What is the capital requirement?|No minimum capital requirement for OPC.'
)
ON DUPLICATE KEY UPDATE
overview = VALUES(overview),
full_description = VALUES(full_description),
processing_time = VALUES(processing_time),
documents_required = VALUES(documents_required),
benefits = VALUES(benefits),
faqs = VALUES(faqs);

-- Service Details for Sole Proprietorship
INSERT INTO service_details (service_id, overview, full_description, processing_time, documents_required, benefits, faqs) VALUES
((SELECT id FROM services WHERE name = 'Sole Proprietorship' LIMIT 1),
'Sole Proprietorship is the simplest business structure with no separate legal entity. Owner has complete control and unlimited liability.',
'Sole Proprietorship registration is the easiest way to start a business. No formal registration required, but business licenses and GST registration may be needed.',
'3-5 business days',
'PAN Card|Aadhaar Card|Address Proof|Bank Account Details|Business Name (if different from owner)|Business Address Proof',
'Easy Setup|Complete Control|Minimal Compliance|Low Cost|Quick Registration|Direct Tax Benefits',
'What is Sole Proprietorship?|Business owned and operated by single person with no separate legal entity.|Is registration mandatory?|No, but business licenses and GST registration may be required.|What are the disadvantages?|Unlimited liability and limited fundraising options.|Can I convert to company later?|Yes, you can convert to Private Limited Company or LLP.|What documents are needed?|PAN, address proof, and business address documents.'
)
ON DUPLICATE KEY UPDATE
overview = VALUES(overview),
full_description = VALUES(full_description),
processing_time = VALUES(processing_time),
documents_required = VALUES(documents_required),
benefits = VALUES(benefits),
faqs = VALUES(faqs);

-- Service Details for Partnership
INSERT INTO service_details (service_id, overview, full_description, processing_time, documents_required, benefits, faqs) VALUES
((SELECT id FROM services WHERE name = 'Partnership' LIMIT 1),
'Partnership firm is formed by two or more partners with shared ownership and unlimited liability. Ideal for small businesses and professionals.',
'Partnership firm registration involves drafting partnership deed and registering with Registrar of Firms. Partners share profits, losses, and management.',
'5-7 business days',
'PAN Card of Partners|Aadhaar Card of Partners|Address Proof of Partners|Partnership Deed|Business Address Proof|Bank Account Details',
'Easy Formation|Shared Responsibility|Flexible Management|Less Compliance|Tax Benefits|Low Cost',
'What is Partnership?|Business structure with 2 or more partners sharing profits and losses.|How many partners needed?|Minimum 2 partners, maximum 20 (10 for banking business).|Is registration mandatory?|No, but registered partnership has legal advantages.|What is partnership deed?|Written agreement defining partner rights, duties, and profit sharing.|Can partnership be converted?|Yes, can be converted to LLP or Private Limited Company.'
)
ON DUPLICATE KEY UPDATE
overview = VALUES(overview),
full_description = VALUES(full_description),
processing_time = VALUES(processing_time),
documents_required = VALUES(documents_required),
benefits = VALUES(benefits),
faqs = VALUES(faqs);

-- Service Details for Hindu Undivided Family (HUF)
INSERT INTO service_details (service_id, overview, full_description, processing_time, documents_required, benefits, faqs) VALUES
((SELECT id FROM services WHERE name = 'Hindu Undivided Family (HUF)' LIMIT 1),
'HUF is a unique tax entity for Hindu families. It allows separate tax assessment and additional tax benefits for family businesses.',
'Hindu Undivided Family (HUF) deed preparation and registration enables separate tax entity for Hindu families. Provides additional tax benefits and separate PAN.',
'3-5 business days',
'PAN Card of Karta|Aadhaar Card of Karta|Address Proof|HUF Deed|Family Tree|Coparceners Details|Bank Account Details',
'Separate Tax Entity|Additional Tax Benefits|Family Asset Management|Legal Recognition|Separate PAN|Tax Planning',
'What is HUF?|Hindu Undivided Family is a separate tax entity for Hindu families.|Who can form HUF?|Only Hindu, Buddhist, Jain, or Sikh families can form HUF.|What is Karta?|Karta is the head of HUF who manages family affairs.|What are tax benefits?|HUF can claim separate deductions and exemptions.|Is HUF deed mandatory?|Yes, HUF deed is required for legal recognition and tax benefits.'
)
ON DUPLICATE KEY UPDATE
overview = VALUES(overview),
full_description = VALUES(full_description),
processing_time = VALUES(processing_time),
documents_required = VALUES(documents_required),
benefits = VALUES(benefits),
faqs = VALUES(faqs);

-- Service Details for GST Modification
INSERT INTO service_details (service_id, overview, full_description, processing_time, documents_required, benefits, faqs) VALUES
((SELECT id FROM services WHERE name = 'GST Modification' LIMIT 1),
'GST Modification allows you to update your GST registration details like business name, address, contact details, or business activities.',
'Modify your existing GST registration details including business information, address, contact details, bank accounts, and business activities.',
'3-5 business days',
'GST Registration Certificate|Updated Business Details|Address Proof (if address change)|Bank Statement (if bank change)|Supporting Documents|Digital Signature',
'Update Information|Legal Compliance|Avoid Penalties|Correct Details|Smooth Operations',
'What can be modified?|Business name, address, contact details, bank accounts, and business activities.|Is modification free?|No, government fees apply for certain modifications.|What is the process?|File GST REG-14 form with supporting documents.|How long does it take?|3-5 business days for approval.|What if modification is rejected?|You can resubmit with correct documents.'
)
ON DUPLICATE KEY UPDATE
overview = VALUES(overview),
full_description = VALUES(full_description),
processing_time = VALUES(processing_time),
documents_required = VALUES(documents_required),
benefits = VALUES(benefits),
faqs = VALUES(faqs);

-- Service Details for IEC Registration
INSERT INTO service_details (service_id, overview, full_description, processing_time, documents_required, benefits, faqs) VALUES
((SELECT id FROM services WHERE name = 'IEC Registration' LIMIT 1),
'Import Export Code (IEC) is mandatory for businesses engaged in international trade. Required for customs clearance and foreign transactions.',
'IEC registration enables your business to import and export goods and services. It is a 10-digit code issued by DGFT and valid for lifetime.',
'3-5 business days',
'PAN Card|Aadhaar Card|Address Proof|Bank Account Details|Business Registration Certificate|Digital Signature|Passport Size Photo',
'International Trade|Customs Clearance|Foreign Transactions|Lifetime Validity|No Renewal|Mandatory for Exports/Imports',
'What is IEC?|Import Export Code is 10-digit code mandatory for international trade.|Who needs IEC?|Any business importing or exporting goods/services needs IEC.|Is IEC permanent?|Yes, IEC is valid for lifetime, no renewal required.|What is the fee?|Government fees apply. Our service includes all charges.|Can IEC be cancelled?|Yes, IEC can be cancelled if not used for 2 years.'
)
ON DUPLICATE KEY UPDATE
overview = VALUES(overview),
full_description = VALUES(full_description),
processing_time = VALUES(processing_time),
documents_required = VALUES(documents_required),
benefits = VALUES(benefits),
faqs = VALUES(faqs);

-- Service Details for IEC Modification
INSERT INTO service_details (service_id, overview, full_description, processing_time, documents_required, benefits, faqs) VALUES
((SELECT id FROM services WHERE name = 'IEC Modification' LIMIT 1),
'IEC Modification allows you to update your Import Export Code registration details like address, contact information, or bank details.',
'Modify your existing IEC registration details including business address, contact information, bank accounts, and other business details.',
'3-5 business days',
'Existing IEC Certificate|Updated Business Details|Address Proof (if address change)|Bank Statement (if bank change)|Supporting Documents|Digital Signature',
'Update Information|Legal Compliance|Correct Details|Smooth Operations|Avoid Issues',
'What can be modified?|Business address, contact details, bank accounts, and business information.|Is modification mandatory?|Yes, if business details change, IEC must be updated.|What is the process?|File modification application with DGFT with supporting documents.|How long does it take?|3-5 business days for approval.|What documents are needed?|Updated business details and supporting documents for changes.'
)
ON DUPLICATE KEY UPDATE
overview = VALUES(overview),
full_description = VALUES(full_description),
processing_time = VALUES(processing_time),
documents_required = VALUES(documents_required),
benefits = VALUES(benefits),
faqs = VALUES(faqs);

-- Service Details for ESIC Registration
INSERT INTO service_details (service_id, overview, full_description, processing_time, documents_required, benefits, faqs) VALUES
((SELECT id FROM services WHERE name = 'ESIC Registration' LIMIT 1),
'ESIC registration is mandatory for employers with 10 or more employees. Provides health insurance and medical benefits to employees.',
'Employee State Insurance Corporation (ESIC) registration provides social security benefits including medical, disability, and maternity benefits to employees.',
'5-7 business days',
'PAN Card|Business Registration Certificate|Address Proof|Bank Account Details|Employee Details|Salary Details|Factory License (if applicable)',
'Employee Benefits|Legal Compliance|Social Security|Medical Coverage|Maternity Benefits|Disability Benefits',
'What is ESIC?|Employee State Insurance Corporation provides social security benefits to employees.|Who needs ESIC?|Employers with 10 or more employees (20 for shops) must register.|What are the benefits?|Medical, disability, maternity, and dependent benefits for employees.|What is the contribution?|Employer contributes 3.25% and employee contributes 0.75% of wages.|Is ESIC mandatory?|Yes, for eligible establishments, ESIC registration is mandatory.'
)
ON DUPLICATE KEY UPDATE
overview = VALUES(overview),
full_description = VALUES(full_description),
processing_time = VALUES(processing_time),
documents_required = VALUES(documents_required),
benefits = VALUES(benefits),
faqs = VALUES(faqs);

-- Service Details for Digital Signature
INSERT INTO service_details (service_id, overview, full_description, processing_time, documents_required, benefits, faqs) VALUES
((SELECT id FROM services WHERE name = 'Digital Signature' LIMIT 1),
'Digital Signature Certificate (DSC) is mandatory for online filing with MCA, Income Tax, and other government portals. Ensures secure digital transactions.',
'Digital Signature Certificate enables secure online filing and authentication. Required for company registration, GST filing, income tax filing, and other online transactions.',
'2-3 business days',
'PAN Card|Aadhaar Card|Address Proof|Passport Size Photo|Email ID|Mobile Number',
'Secure Online Filing|MCA Filing|GST Filing|Income Tax Filing|Legal Validity|Time Saving',
'What is DSC?|Digital Signature Certificate is electronic signature for online transactions.|Who needs DSC?|Directors, partners, and authorized signatories need DSC for online filing.|What is validity?|DSC is valid for 1-2 years and can be renewed.|Which class to choose?|Class 2 for MCA filing, Class 3 for higher security.|Is Aadhaar mandatory?|Yes, Aadhaar is mandatory for DSC application.'
)
ON DUPLICATE KEY UPDATE
overview = VALUES(overview),
full_description = VALUES(full_description),
processing_time = VALUES(processing_time),
documents_required = VALUES(documents_required),
benefits = VALUES(benefits),
faqs = VALUES(faqs);

-- Service Details for DIN Application
INSERT INTO service_details (service_id, overview, full_description, processing_time, documents_required, benefits, faqs) VALUES
((SELECT id FROM services WHERE name = 'DIN Application' LIMIT 1),
'Director Identification Number (DIN) is mandatory for all directors of companies. Unique 8-digit number for director identification.',
'Director Identification Number (DIN) is required for anyone who wants to be a director in a company. It is a unique identifier issued by MCA.',
'2-3 business days',
'PAN Card|Aadhaar Card|Address Proof|Passport Size Photo|Email ID|Mobile Number|Digital Signature',
'Mandatory for Directors|Unique Identification|MCA Requirement|Company Registration|Legal Compliance',
'What is DIN?|Director Identification Number is 8-digit unique number for directors.|Who needs DIN?|Anyone who wants to be a director in a company needs DIN.|Is DIN permanent?|Yes, DIN is permanent and valid for lifetime.|Can one person have multiple DIN?|No, one person can have only one DIN.|What is the fee?|Government fees apply. Our service includes all charges.'
)
ON DUPLICATE KEY UPDATE
overview = VALUES(overview),
full_description = VALUES(full_description),
processing_time = VALUES(processing_time),
documents_required = VALUES(documents_required),
benefits = VALUES(benefits),
faqs = VALUES(faqs);

-- Service Details for EPF Registration
INSERT INTO service_details (service_id, overview, full_description, processing_time, documents_required, benefits, faqs) VALUES
((SELECT id FROM services WHERE name = 'EPF Registration' LIMIT 1),
'EPF registration is mandatory for establishments with 20 or more employees. Provides retirement benefits and provident fund to employees.',
'Employee Provident Fund (EPF) registration ensures retirement benefits for employees. Both employer and employee contribute to the fund.',
'5-7 business days',
'PAN Card|Business Registration Certificate|Address Proof|Bank Account Details|Employee Details|Salary Details|Factory License (if applicable)',
'Employee Benefits|Retirement Security|Legal Compliance|Tax Benefits|Long-term Savings|Social Security',
'What is EPF?|Employee Provident Fund provides retirement benefits to employees.|Who needs EPF?|Establishments with 20 or more employees must register for EPF.|What is the contribution?|Employer and employee each contribute 12% of basic salary.|Is EPF mandatory?|Yes, for eligible establishments, EPF registration is mandatory.|What are the benefits?|Retirement fund, tax benefits, and long-term savings for employees.'
)
ON DUPLICATE KEY UPDATE
overview = VALUES(overview),
full_description = VALUES(full_description),
processing_time = VALUES(processing_time),
documents_required = VALUES(documents_required),
benefits = VALUES(benefits),
faqs = VALUES(faqs);

-- Service Details for SSI/MSME/Udyog Aadhar Registration
INSERT INTO service_details (service_id, overview, full_description, processing_time, documents_required, benefits, faqs) VALUES
((SELECT id FROM services WHERE name = 'SSI/MSME/Udyog Aadhar Registration' LIMIT 1),
'MSME/Udyog Aadhar registration provides various benefits including priority lending, subsidies, and government schemes for small businesses.',
'MSME/Udyog Aadhar registration enables small and medium enterprises to avail benefits like bank loans, subsidies, and government schemes.',
'2-3 business days',
'PAN Card|Aadhaar Card|Business Address Proof|Bank Account Details|Business Registration Certificate|Investment in Plant & Machinery Details',
'Priority Lending|Government Subsidies|Tax Benefits|Bank Loans|Government Schemes|Business Recognition',
'What is MSME?|Micro, Small and Medium Enterprises registration for small businesses.|What are the benefits?|Priority lending, subsidies, tax benefits, and government schemes.|What is investment limit?|Micro: ₹1 crore, Small: ₹10 crore, Medium: ₹50 crore.|Is registration free?|Yes, Udyog Aadhar registration is free of cost.|How long is it valid?|MSME registration is valid for lifetime, no renewal needed.'
)
ON DUPLICATE KEY UPDATE
overview = VALUES(overview),
full_description = VALUES(full_description),
processing_time = VALUES(processing_time),
documents_required = VALUES(documents_required),
benefits = VALUES(benefits),
faqs = VALUES(faqs);

-- Service Details for TDS Returns Revision
INSERT INTO service_details (service_id, overview, full_description, processing_time, documents_required, benefits, faqs) VALUES
((SELECT id FROM services WHERE name = 'TDS Returns Revision' LIMIT 1),
'TDS Returns Revision allows you to correct errors in previously filed TDS returns. Essential for accurate tax compliance and avoiding penalties.',
'Revise your filed TDS returns to correct errors, update information, or add missing details. Ensures accurate tax compliance and avoids penalties.',
'3-5 business days',
'Original TDS Return|Correction Details|Supporting Documents|Challan Details|TDS Certificates|Previous Returns',
'Error Correction|Legal Compliance|Avoid Penalties|Accurate Filing|Tax Compliance',
'What is TDS revision?|Correction of errors in previously filed TDS returns.|When can I revise?|TDS returns can be revised before due date of original return.|What can be revised?|Errors in PAN, amounts, challan details, and other information.|Is there a penalty?|No penalty if revised before due date.|How many times can I revise?|TDS returns can be revised multiple times before due date.'
)
ON DUPLICATE KEY UPDATE
overview = VALUES(overview),
full_description = VALUES(full_description),
processing_time = VALUES(processing_time),
documents_required = VALUES(documents_required),
benefits = VALUES(benefits),
faqs = VALUES(faqs);

-- Service Details for PF Returns
INSERT INTO service_details (service_id, overview, full_description, processing_time, documents_required, benefits, faqs) VALUES
((SELECT id FROM services WHERE name = 'PF Returns' LIMIT 1),
'PF Returns filing is mandatory for all EPF registered establishments. Monthly filing ensures compliance and employee benefit processing.',
'Employee Provident Fund (PF) return filing ensures compliance with EPF regulations. Monthly filing includes employee contributions and challan details.',
'3-5 business days per return',
'Employee Contribution Details|Employer Contribution Details|Challan Details|ECR File|Previous Returns|Bank Statements',
'Legal Compliance|Employee Benefits|Avoid Penalties|Smooth Operations|Tax Compliance',
'What is PF return?|Monthly return showing EPF contributions of employer and employees.|What is the due date?|15th of every month for previous month contributions.|What is ECR?|Electronic Challan cum Return is the monthly PF return format.|Is filing mandatory?|Yes, all EPF registered establishments must file monthly returns.|What is the penalty?|Penalty for late filing varies based on delay period.'
)
ON DUPLICATE KEY UPDATE
overview = VALUES(overview),
full_description = VALUES(full_description),
processing_time = VALUES(processing_time),
documents_required = VALUES(documents_required),
benefits = VALUES(benefits),
faqs = VALUES(faqs);

-- Service Details for ESI Returns
INSERT INTO service_details (service_id, overview, full_description, processing_time, documents_required, benefits, faqs) VALUES
((SELECT id FROM services WHERE name = 'ESI Returns' LIMIT 1),
'ESI Returns filing is mandatory for all ESIC registered establishments. Monthly filing ensures compliance and employee benefit processing.',
'Employee State Insurance (ESI) return filing ensures compliance with ESIC regulations. Monthly filing includes employee contributions and challan details.',
'3-5 business days per return',
'Employee Contribution Details|Employer Contribution Details|Challan Details|Employee Details|Previous Returns|Bank Statements',
'Legal Compliance|Employee Benefits|Avoid Penalties|Smooth Operations|Medical Benefits',
'What is ESI return?|Monthly return showing ESIC contributions of employer and employees.|What is the due date?|15th of every month for previous month contributions.|Is filing mandatory?|Yes, all ESIC registered establishments must file monthly returns.|What is the contribution?|Employer contributes 3.25% and employee contributes 0.75% of wages.|What is the penalty?|Penalty for late filing varies based on delay period.'
)
ON DUPLICATE KEY UPDATE
overview = VALUES(overview),
full_description = VALUES(full_description),
processing_time = VALUES(processing_time),
documents_required = VALUES(documents_required),
benefits = VALUES(benefits),
faqs = VALUES(faqs);

-- Service Details for LLP Annual Filing
INSERT INTO service_details (service_id, overview, full_description, processing_time, documents_required, benefits, faqs) VALUES
((SELECT id FROM services WHERE name = 'LLP Annual Filing' LIMIT 1),
'LLP Annual Filing is mandatory for all Limited Liability Partnerships. Includes Form 8 (Statement of Accounts) and Form 11 (Annual Return).',
'LLP annual compliance includes filing Form 8 (Statement of Accounts and Solvency) and Form 11 (Annual Return) with ROC. Ensures LLP remains active and compliant.',
'10-15 business days',
'Financial Statements|Statement of Accounts|Form 8|Form 11|Partners Details|Annual Return|Auditor Report (if applicable)',
'Maintain Active Status|Legal Compliance|Avoid Penalties|Good Standing|Business Credibility',
'What is LLP annual filing?|Filing of Form 8 and Form 11 with ROC annually.|What are the due dates?|Form 8: 30 days from end of 6 months, Form 11: 30 days from end of financial year.|What happens if I miss?|Late fees and penalties apply. LLP status may become inactive.|Is audit mandatory?|Audit is mandatory if turnover exceeds ₹40 lakh or capital exceeds ₹25 lakh.|Can I file myself?|Yes, but professional assistance ensures accuracy and compliance.'
)
ON DUPLICATE KEY UPDATE
overview = VALUES(overview),
full_description = VALUES(full_description),
processing_time = VALUES(processing_time),
documents_required = VALUES(documents_required),
benefits = VALUES(benefits),
faqs = VALUES(faqs);

-- Service Details for OPC Annual Filing
INSERT INTO service_details (service_id, overview, full_description, processing_time, documents_required, benefits, faqs) VALUES
((SELECT id FROM services WHERE name = 'OPC Annual Filing' LIMIT 1),
'OPC Annual Filing is mandatory for all One Person Companies. Includes AOC-4, MGT-7, and ADT-1 forms similar to Private Limited Companies.',
'One Person Company (OPC) annual filing ensures compliance with ROC requirements. Includes financial statements, annual return, and auditor appointment.',
'15-20 business days',
'Financial Statements (Balance Sheet, P&L)|Annual Return|Auditor Appointment Details|Board Meeting Minutes|Directors Report|AOC-4|MGT-7',
'Maintain Active Status|Avoid Penalties|Legal Compliance|Good Corporate Governance|Business Credibility',
'What is OPC annual filing?|Annual filing includes submission of financial statements and annual return to ROC.|What are the due dates?|AOC-4: 30 days from AGM, MGT-7: 60 days from AGM.|What happens if I miss?|Late fees and penalties apply. Company status may become inactive.|Is audit mandatory?|Yes, for companies with turnover above ₹1 crore or capital above ₹10 lakh.|Can I file myself?|Yes, but professional assistance ensures accuracy and compliance.'
)
ON DUPLICATE KEY UPDATE
overview = VALUES(overview),
full_description = VALUES(full_description),
processing_time = VALUES(processing_time),
documents_required = VALUES(documents_required),
benefits = VALUES(benefits),
faqs = VALUES(faqs);

-- Service Details for NPO/Section 8 Company Annual Filing
INSERT INTO service_details (service_id, overview, full_description, processing_time, documents_required, benefits, faqs) VALUES
((SELECT id FROM services WHERE name = 'NPO/Section 8 Company Annual Filing' LIMIT 1),
'NPO/Section 8 Company Annual Filing is mandatory for all non-profit organizations. Includes AOC-4, MGT-7, and Form FC-3 (if receiving foreign contributions).',
'Non-Profit Organization (NPO) annual filing ensures compliance with ROC and tax requirements. Includes financial statements, annual return, and FC-3 (if applicable).',
'15-20 business days',
'Financial Statements|Annual Return|Auditor Report|Form FC-3 (if applicable)|80G Certificate|12A Certificate|Directors Report',
'Maintain Active Status|Legal Compliance|Tax Exemption|Avoid Penalties|Good Standing',
'What is NPO annual filing?|Annual filing for non-profit organizations including financial statements and annual return.|What are the due dates?|AOC-4: 30 days from AGM, MGT-7: 60 days from AGM.|Is audit mandatory?|Yes, audit is mandatory for all Section 8 companies.|What is Form FC-3?|Form FC-3 is for foreign contribution reporting, if applicable.|Can I file myself?|Yes, but professional assistance ensures accuracy and compliance.'
)
ON DUPLICATE KEY UPDATE
overview = VALUES(overview),
full_description = VALUES(full_description),
processing_time = VALUES(processing_time),
documents_required = VALUES(documents_required),
benefits = VALUES(benefits),
faqs = VALUES(faqs);

-- Service Details for One Person Company (OPC)
INSERT INTO service_details (service_id, overview, full_description, processing_time, documents_required, benefits, faqs) VALUES
((SELECT id FROM services WHERE name = 'One Person Company (OPC)' LIMIT 1),
'One Person Company (OPC) allows a single person to start a company with limited liability. Perfect for solo entrepreneurs.',
'OPC registration enables single entrepreneurs to enjoy the benefits of a private limited company with limited liability protection. Ideal for startups and small businesses.',
'10-15 business days',
'PAN Card|Aadhaar Card|Address Proof|Passport Size Photo|Registered Office Address Proof|Nominee Details and Documents|NOC from Property Owner',
'Single Person Ownership|Limited Liability|Separate Legal Entity|Perpetual Succession|Easy Conversion to Pvt Ltd|Tax Benefits',
'What is an OPC?|OPC is a company with only one member/shareholder, providing limited liability.|Who can form OPC?|Any Indian citizen resident in India can form an OPC.|Is nominee mandatory?|Yes, OPC must have a nominee who will take over in case of death.|Can OPC have multiple directors?|Yes, OPC can have minimum 1 and maximum 15 directors.|Can OPC be converted?|Yes, OPC can be converted to Private Limited Company after 2 years or when paid-up capital exceeds ₹50 lakh.'
)
ON DUPLICATE KEY UPDATE
overview = VALUES(overview),
full_description = VALUES(full_description),
processing_time = VALUES(processing_time),
documents_required = VALUES(documents_required),
benefits = VALUES(benefits),
faqs = VALUES(faqs);

-- Service Details for Sole Proprietorship
INSERT INTO service_details (service_id, overview, full_description, processing_time, documents_required, benefits, faqs) VALUES
((SELECT id FROM services WHERE name = 'Sole Proprietorship' LIMIT 1),
'Sole Proprietorship is the simplest business structure. Single owner with full control and unlimited liability.',
'Sole proprietorship registration is ideal for small businesses and freelancers. Quick setup with minimal compliance requirements.',
'2-5 business days',
'PAN Card|Aadhaar Card|Address Proof|Bank Account Details|Business Name (if different)|GST Registration (if applicable)',
'Simple Structure|Easy Setup|Full Control|Minimal Compliance|Low Cost|Quick Registration',
'What is sole proprietorship?|Business owned and operated by a single person with unlimited liability.|Is registration mandatory?|No, but registration helps in opening bank accounts and getting licenses.|What documents are needed?|PAN, Aadhaar, address proof, and bank account details.|Can I convert to company later?|Yes, sole proprietorship can be converted to company or LLP.|What are the disadvantages?|Unlimited liability and difficulty in raising funds.'
)
ON DUPLICATE KEY UPDATE
overview = VALUES(overview),
full_description = VALUES(full_description),
processing_time = VALUES(processing_time),
documents_required = VALUES(documents_required),
benefits = VALUES(benefits),
faqs = VALUES(faqs);

-- Service Details for Partnership
INSERT INTO service_details (service_id, overview, full_description, processing_time, documents_required, benefits, faqs) VALUES
((SELECT id FROM services WHERE name = 'Partnership' LIMIT 1),
'Partnership firm allows two or more persons to run a business together. Simple structure with shared responsibility.',
'Partnership firm registration provides a flexible business structure for partners. Includes partnership deed drafting and registration.',
'5-7 business days',
'PAN Card of Partners|Aadhaar Card of Partners|Address Proof|Partnership Deed|Bank Account Details|GST Registration (if applicable)',
'Easy Formation|Flexible Structure|Shared Responsibility|Less Compliance|Tax Benefits|Low Cost',
'What is a partnership?|Business owned by 2 or more persons sharing profits and losses.|Is registration mandatory?|No, but registered partnership has legal advantages.|What is partnership deed?|Written agreement defining terms, profit sharing, and responsibilities.|How many partners allowed?|Minimum 2, maximum 20 partners (10 for banking business).|Can partnership be converted?|Yes, partnership can be converted to LLP or company.'
)
ON DUPLICATE KEY UPDATE
overview = VALUES(overview),
full_description = VALUES(full_description),
processing_time = VALUES(processing_time),
documents_required = VALUES(documents_required),
benefits = VALUES(benefits),
faqs = VALUES(faqs);

-- Service Details for Hindu Undivided Family (HUF)
INSERT INTO service_details (service_id, overview, full_description, processing_time, documents_required, benefits, faqs) VALUES
((SELECT id FROM services WHERE name = 'Hindu Undivided Family (HUF)' LIMIT 1),
'HUF is a unique tax-saving entity for Hindu families. Separate PAN and tax benefits available.',
'HUF registration enables Hindu families to create a separate tax entity with its own PAN. Includes HUF deed preparation and PAN application.',
'5-7 business days',
'Karta PAN Card|Karta Aadhaar Card|Address Proof|HUF Deed|Family Members Details|Bank Account Details',
'Tax Benefits|Separate Entity|Deduction Under 80C|Lower Tax Slabs|Family Asset Management|Legal Recognition',
'What is HUF?|Hindu Undivided Family is a separate tax entity for Hindu families.|Who can form HUF?|Any Hindu, Buddhist, Jain, or Sikh family can form HUF.|What is HUF deed?|Document declaring formation of HUF and identifying karta and members.|What are tax benefits?|HUF can claim deductions under Section 80C, 80D, and other sections.|Is separate PAN needed?|Yes, HUF must have separate PAN for tax purposes.'
)
ON DUPLICATE KEY UPDATE
overview = VALUES(overview),
full_description = VALUES(full_description),
processing_time = VALUES(processing_time),
documents_required = VALUES(documents_required),
benefits = VALUES(benefits),
faqs = VALUES(faqs);

-- Service Details for GST Modification
INSERT INTO service_details (service_id, overview, full_description, processing_time, documents_required, benefits, faqs) VALUES
((SELECT id FROM services WHERE name = 'GST Modification' LIMIT 1),
'GST Modification allows you to update your GST registration details like address, business name, or other information.',
'Update your GST registration details including business name, address, contact information, bank details, and additional places of business.',
'3-5 business days',
'GST Registration Certificate|Updated Address Proof|Updated Bank Details|Supporting Documents|Digital Signature Certificate|Authorization Letter',
'Keep Details Updated|Legal Compliance|Avoid Penalties|Smooth Operations|Correct Information|Business Continuity',
'What can be modified in GST?|Business name, address, contact details, bank account, additional places of business.|Is modification free?|No, government fees apply. Our service includes all charges.|What documents are needed?|GST certificate, updated address proof, and supporting documents.|How long does it take?|3-5 business days after document submission.|Is approval required?|Yes, GST department approval is required for modifications.'
)
ON DUPLICATE KEY UPDATE
overview = VALUES(overview),
full_description = VALUES(full_description),
processing_time = VALUES(processing_time),
documents_required = VALUES(documents_required),
benefits = VALUES(benefits),
faqs = VALUES(faqs);

-- Service Details for Public Limited Company
INSERT INTO service_details (service_id, overview, full_description, processing_time, documents_required, benefits, faqs) VALUES
((SELECT id FROM services WHERE name = 'Public Limited Company' LIMIT 1),
'Public Limited Company can raise capital from public through shares. Suitable for large businesses and public offerings.',
'Public Limited Company registration enables businesses to raise capital from public and list on stock exchanges. Includes complete compliance support.',
'20-30 business days',
'PAN Card of Directors|Aadhaar Card of Directors|Address Proof|Passport Size Photos|Registered Office Address Proof|MOA and AOA|DSC and DIN',
'Public Fundraising|Stock Exchange Listing|Enhanced Credibility|Transferable Shares|Limited Liability|Growth Potential',
'What is a public limited company?|Company that can raise capital from public and list on stock exchanges.|What is minimum capital?|Minimum ₹5 lakh paid-up capital required.|How many directors needed?|Minimum 3 directors required.|Can public company be listed?|Yes, public companies can list on stock exchanges.|What are compliance requirements?|Stricter compliance including quarterly results, AGM, and annual filing.'
)
ON DUPLICATE KEY UPDATE
overview = VALUES(overview),
full_description = VALUES(full_description),
processing_time = VALUES(processing_time),
documents_required = VALUES(documents_required),
benefits = VALUES(benefits),
faqs = VALUES(faqs);

-- Service Details for Indian Subsidiary
INSERT INTO service_details (service_id, overview, full_description, processing_time, documents_required, benefits, faqs) VALUES
((SELECT id FROM services WHERE name = 'Indian Subsidiary' LIMIT 1),
'Indian Subsidiary allows foreign companies to establish presence in India. Complete registration and compliance support.',
'Set up an Indian subsidiary company for your foreign business. Includes company registration, compliance, and ongoing support for foreign entities.',
'20-30 business days',
'Parent Company Documents|Foreign Director Documents|Indian Director Documents|Registered Office Proof|Bank Account Details|FDI Compliance Documents|Digital Signature Certificates',
'Indian Market Access|Limited Liability|Separate Legal Entity|FDI Benefits|Tax Advantages|Business Expansion',
'What is Indian subsidiary?|Company incorporated in India where foreign company holds majority shares.|What documents from parent company?|Certificate of incorporation, board resolution, and company profile.|Is Indian director mandatory?|Yes, at least one director must be resident in India.|What is FDI compliance?|Foreign Direct Investment guidelines and reporting requirements.|Can 100% foreign ownership?|Yes, subject to sectoral caps and FDI guidelines.'
)
ON DUPLICATE KEY UPDATE
overview = VALUES(overview),
full_description = VALUES(full_description),
processing_time = VALUES(processing_time),
documents_required = VALUES(documents_required),
benefits = VALUES(benefits),
faqs = VALUES(faqs);

-- Service Details for Company Registration by Foreigner
INSERT INTO service_details (service_id, overview, full_description, processing_time, documents_required, benefits, faqs) VALUES
((SELECT id FROM services WHERE name = 'Company Registration by Foreigner' LIMIT 1),
'Foreign nationals can register companies in India. Complete support for foreign entrepreneurs and investors.',
'Company registration services for foreign nationals in India. Includes visa compliance, documentation, and complete registration process.',
'20-30 business days',
'Passport Copy|Visa Documents|Address Proof (Foreign)|Indian Address Proof|PAN Application|Bank Account Details|Digital Signature Certificate',
'Business in India|Limited Liability|Legal Entity|Investment Opportunities|Market Access|Compliance Support',
'Can foreigners register company?|Yes, foreign nationals can register companies in India subject to compliance.|What visa is needed?|Business visa or employment visa depending on role and duration.|Is Indian partner required?|No, but at least one director must be resident in India.|What are restrictions?|Subject to FDI guidelines and sectoral caps.|Can foreigner be director?|Yes, foreign nationals can be directors of Indian companies.'
)
ON DUPLICATE KEY UPDATE
overview = VALUES(overview),
full_description = VALUES(full_description),
processing_time = VALUES(processing_time),
documents_required = VALUES(documents_required),
benefits = VALUES(benefits),
faqs = VALUES(faqs);

-- Service Details for Non Profit Organization
INSERT INTO service_details (service_id, overview, full_description, processing_time, documents_required, benefits, faqs) VALUES
((SELECT id FROM services WHERE name = 'Non Profit Organization' LIMIT 1),
'Section 8 Company registration for non-profit organizations. Tax exemptions and compliance support included.',
'Register your non-profit organization as Section 8 Company. Includes name approval, incorporation, and 12A/80G registration support.',
'25-35 business days',
'PAN Card of Directors|Aadhaar Card|Address Proof|Memorandum of Association|Articles of Association|Registered Office Proof|Digital Signature',
'Tax Exemptions|Limited Liability|Separate Legal Entity|Donation Benefits|12A Registration|80G Registration',
'What is Section 8 Company?|Company formed for promoting commerce, art, science, religion, charity, or social welfare.|What are tax benefits?|Section 8 companies can get 12A and 80G registration for tax exemptions.|Is profit distribution allowed?|No, profits cannot be distributed to members.|What is minimum capital?|No minimum capital requirement for Section 8 companies.|Can Section 8 company accept donations?|Yes, with 80G registration, donations are tax-deductible for donors.'
)
ON DUPLICATE KEY UPDATE
overview = VALUES(overview),
full_description = VALUES(full_description),
processing_time = VALUES(processing_time),
documents_required = VALUES(documents_required),
benefits = VALUES(benefits),
faqs = VALUES(faqs);

-- Service Details for Nidhi Company
INSERT INTO service_details (service_id, overview, full_description, processing_time, documents_required, benefits, faqs) VALUES
((SELECT id FROM services WHERE name = 'Nidhi Company' LIMIT 1),
'Nidhi Company is a mutual benefit society for borrowing and lending among members. Specialized registration process.',
'Nidhi Company registration for mutual benefit societies. Includes complete documentation, compliance, and ongoing support.',
'30-40 business days',
'PAN Card of Directors|Aadhaar Card|Address Proof|Memorandum of Association|Articles of Association|Registered Office Proof|Minimum 200 Members List',
'Mutual Benefit|Member Services|Regulated Structure|Limited Liability|Legal Framework|Compliance Support',
'What is Nidhi Company?|Mutual benefit society for borrowing and lending among members only.|What is minimum capital?|Minimum ₹5 lakh paid-up capital required.|How many members needed?|Minimum 200 members required for Nidhi Company.|What are restrictions?|Can only accept deposits from and lend to members.|Is RBI approval needed?|No, but Nidhi Companies are regulated by Companies Act.'
)
ON DUPLICATE KEY UPDATE
overview = VALUES(overview),
full_description = VALUES(full_description),
processing_time = VALUES(processing_time),
documents_required = VALUES(documents_required),
benefits = VALUES(benefits),
faqs = VALUES(faqs);

-- Service Details for Producer Company
INSERT INTO service_details (service_id, overview, full_description, processing_time, documents_required, benefits, faqs) VALUES
((SELECT id FROM services WHERE name = 'Producer Company' LIMIT 1),
'Producer Company is for agricultural producers and related activities. Specialized registration for farmers and producers.',
'Producer Company registration for agricultural producers, farmers, and related activities. Includes complete documentation and compliance.',
'25-35 business days',
'PAN Card of Directors|Aadhaar Card|Address Proof|Memorandum of Association|Articles of Association|Producer Members List|Registered Office Proof',
'Agricultural Benefits|Producer Focus|Limited Liability|Tax Benefits|Government Support|Legal Structure',
'What is Producer Company?|Company formed by agricultural producers for their mutual benefit.|Who can form?|Farmers, agricultural producers, and related persons.|What is minimum capital?|No minimum capital requirement.|How many members needed?|Minimum 10 members required.|What activities allowed?|Production, harvesting, procurement, grading, pooling, handling, marketing, and export of primary produce.'
)
ON DUPLICATE KEY UPDATE
overview = VALUES(overview),
full_description = VALUES(full_description),
processing_time = VALUES(processing_time),
documents_required = VALUES(documents_required),
benefits = VALUES(benefits),
faqs = VALUES(faqs);

-- Service Details for IEC Registration
INSERT INTO service_details (service_id, overview, full_description, processing_time, documents_required, benefits, faqs) VALUES
((SELECT id FROM services WHERE name = 'IEC Registration' LIMIT 1),
'Import Export Code (IEC) is mandatory for international trade. Required for import and export of goods and services.',
'IEC registration enables businesses to import and export goods and services. Essential for international trade operations.',
'5-7 business days',
'PAN Card|Aadhaar Card|Address Proof|Bank Account Details|Passport Size Photo|Business Registration Certificate',
'International Trade|Import Export|Mandatory Registration|Lifetime Validity|No Renewal|Business Expansion',
'What is IEC?|Import Export Code is 10-digit code issued by DGFT for international trade.|Who needs IEC?|Anyone importing or exporting goods or services needs IEC.|Is IEC lifetime valid?|Yes, IEC is valid for lifetime, no renewal required.|What is the fee?|Government fees apply. Our service includes all charges.|Can IEC be cancelled?|Yes, IEC can be cancelled if not used for 2 years.'
)
ON DUPLICATE KEY UPDATE
overview = VALUES(overview),
full_description = VALUES(full_description),
processing_time = VALUES(processing_time),
documents_required = VALUES(documents_required),
benefits = VALUES(benefits),
faqs = VALUES(faqs);

-- Service Details for IEC Modification
INSERT INTO service_details (service_id, overview, full_description, processing_time, documents_required, benefits, faqs) VALUES
((SELECT id FROM services WHERE name = 'IEC Modification' LIMIT 1),
'Update your IEC registration details like address, contact information, or bank details.',
'Modify your Import Export Code registration details including address, contact information, and bank account details.',
'3-5 business days',
'IEC Certificate|Updated Address Proof|Updated Bank Details|Supporting Documents|PAN Card|Authorization Letter',
'Keep Details Updated|Legal Compliance|Smooth Operations|Correct Information|Business Continuity|Avoid Issues',
'What can be modified in IEC?|Address, contact details, bank account, and other registration information.|Is modification free?|No, government fees apply. Our service includes all charges.|What documents are needed?|IEC certificate, updated address proof, and supporting documents.|How long does it take?|3-5 business days after document submission.|Is approval required?|Yes, DGFT approval is required for modifications.'
)
ON DUPLICATE KEY UPDATE
overview = VALUES(overview),
full_description = VALUES(full_description),
processing_time = VALUES(processing_time),
documents_required = VALUES(documents_required),
benefits = VALUES(benefits),
faqs = VALUES(faqs);

-- Service Details for ESIC Registration
INSERT INTO service_details (service_id, overview, full_description, processing_time, documents_required, benefits, faqs) VALUES
((SELECT id FROM services WHERE name = 'ESIC Registration' LIMIT 1),
'ESIC registration is mandatory for employers with 10 or more employees. Provides health insurance benefits to employees.',
'Employee State Insurance Corporation (ESIC) registration provides health insurance and medical benefits to employees and their families.',
'7-10 business days',
'PAN Card|Business Registration Certificate|Address Proof|Bank Account Details|Employee Details|Salary Details|Digital Signature',
'Employee Benefits|Health Insurance|Medical Coverage|Legal Compliance|Social Security|Family Coverage',
'Who needs ESIC registration?|Employers with 10 or more employees (20 for certain establishments) must register.|What are employee benefits?|Medical benefits, sickness benefits, maternity benefits, and disability benefits.|What is contribution rate?|Employer: 3.25%, Employee: 0.75% of wages.|Is registration mandatory?|Yes, for eligible establishments, registration is mandatory.|What is the penalty?|Penalty for non-registration and delayed contributions.'
)
ON DUPLICATE KEY UPDATE
overview = VALUES(overview),
full_description = VALUES(full_description),
processing_time = VALUES(processing_time),
documents_required = VALUES(documents_required),
benefits = VALUES(benefits),
faqs = VALUES(faqs);

-- Service Details for Digital Signature
INSERT INTO service_details (service_id, overview, full_description, processing_time, documents_required, benefits, faqs) VALUES
((SELECT id FROM services WHERE name = 'Digital Signature' LIMIT 1),
'Digital Signature Certificate (DSC) is required for online filing with MCA, GST, and other government portals.',
'Digital Signature Certificate enables secure online filing and authentication. Required for company registration, GST filing, and e-tendering.',
'2-3 business days',
'PAN Card|Aadhaar Card|Address Proof|Passport Size Photo|Email ID|Mobile Number',
'Online Filing|Secure Authentication|MCA Filing|GST Filing|E-Tendering|Legal Validity',
'What is DSC?|Digital Signature Certificate is electronic signature with legal validity.|Who needs DSC?|Directors, partners, and authorized signatories for online filing.|What is validity?|DSC is valid for 1-2 years depending on type.|What are types of DSC?|Class 2 and Class 3 DSC for different purposes.|Is DSC mandatory?|Yes, for MCA filing, GST filing, and e-tendering.'
)
ON DUPLICATE KEY UPDATE
overview = VALUES(overview),
full_description = VALUES(full_description),
processing_time = VALUES(processing_time),
documents_required = VALUES(documents_required),
benefits = VALUES(benefits),
faqs = VALUES(faqs);

-- Service Details for DIN Application
INSERT INTO service_details (service_id, overview, full_description, processing_time, documents_required, benefits, faqs) VALUES
((SELECT id FROM services WHERE name = 'DIN Application' LIMIT 1),
'Director Identification Number (DIN) is mandatory for all company directors. Unique identification for directors.',
'Director Identification Number is unique 8-digit number required for all directors of companies. Includes application and approval.',
'3-5 business days',
'PAN Card|Aadhaar Card|Address Proof|Passport Size Photo|Email ID|Mobile Number|Digital Signature Certificate',
'Director Identification|Mandatory for Directors|Unique Number|Lifetime Validity|MCA Compliance|Legal Requirement',
'What is DIN?|Director Identification Number is unique 8-digit number for company directors.|Who needs DIN?|All directors of companies and designated partners of LLPs need DIN.|Is DIN lifetime valid?|Yes, DIN is valid for lifetime once issued.|What documents are needed?|PAN, Aadhaar, address proof, photo, and DSC.|Can DIN be cancelled?|Yes, if director is disqualified or on application.'
)
ON DUPLICATE KEY UPDATE
overview = VALUES(overview),
full_description = VALUES(full_description),
processing_time = VALUES(processing_time),
documents_required = VALUES(documents_required),
benefits = VALUES(benefits),
faqs = VALUES(faqs);

-- Service Details for EPF Registration
INSERT INTO service_details (service_id, overview, full_description, processing_time, documents_required, benefits, faqs) VALUES
((SELECT id FROM services WHERE name = 'EPF Registration' LIMIT 1),
'EPF registration is mandatory for establishments with 20 or more employees. Provides retirement benefits to employees.',
'Employee Provident Fund (EPF) registration provides retirement benefits and social security to employees. Mandatory for eligible establishments.',
'7-10 business days',
'PAN Card|Business Registration Certificate|Address Proof|Bank Account Details|Employee Details|Salary Details|Digital Signature',
'Employee Benefits|Retirement Savings|Social Security|Tax Benefits|Legal Compliance|Long-term Savings',
'Who needs EPF registration?|Establishments with 20 or more employees must register for EPF.|What is contribution rate?|Employer: 12%, Employee: 12% of basic salary (subject to limits).|What are benefits?|Retirement corpus, pension, and insurance benefits for employees.|Is registration mandatory?|Yes, for eligible establishments, registration is mandatory.|What is the penalty?|Penalty for non-registration and delayed contributions.'
)
ON DUPLICATE KEY UPDATE
overview = VALUES(overview),
full_description = VALUES(full_description),
processing_time = VALUES(processing_time),
documents_required = VALUES(documents_required),
benefits = VALUES(benefits),
faqs = VALUES(faqs);

-- Service Details for SSI/MSME/Udyog Aadhar Registration
INSERT INTO service_details (service_id, overview, full_description, processing_time, documents_required, benefits, faqs) VALUES
((SELECT id FROM services WHERE name = 'SSI/MSME/Udyog Aadhar Registration' LIMIT 1),
'MSME/Udyog Aadhar registration provides various benefits including priority lending, subsidies, and government schemes for small businesses.',
'MSME/Udyog Aadhar registration enables small and medium enterprises to avail benefits like bank loans, subsidies, and government schemes.',
'2-3 business days',
'PAN Card|Aadhaar Card|Business Address Proof|Bank Account Details|Business Registration Certificate|Investment in Plant & Machinery Details',
'Priority Lending|Government Subsidies|Tax Benefits|Bank Loans|Government Schemes|Business Recognition',
'What is MSME?|Micro, Small and Medium Enterprises registration for small businesses.|What are the benefits?|Priority lending, subsidies, tax benefits, and government schemes.|What is investment limit?|Micro: ₹1 crore, Small: ₹10 crore, Medium: ₹50 crore.|Is registration free?|Yes, Udyog Aadhar registration is free of cost.|How long is it valid?|MSME registration is valid for lifetime, no renewal needed.'
)
ON DUPLICATE KEY UPDATE
overview = VALUES(overview),
full_description = VALUES(full_description),
processing_time = VALUES(processing_time),
documents_required = VALUES(documents_required),
benefits = VALUES(benefits),
faqs = VALUES(faqs);

-- Service Details for Public Limited Company
INSERT INTO service_details (service_id, overview, full_description, processing_time, documents_required, benefits, faqs) VALUES
((SELECT id FROM services WHERE name = 'Public Limited Company' LIMIT 1),
'Public Limited Company can raise capital from public through shares. Requires minimum 7 shareholders and more compliance than private companies.',
'Public Limited Company registration allows raising capital from public. Requires more shareholders, higher capital, and stricter compliance than private companies.',
'15-20 business days',
'PAN Card of Directors|Aadhaar Card of Directors|Address Proof|Passport Size Photos|Registered Office Address Proof|Minimum Capital Proof|7 Shareholders Details',
'Public Fundraising|Limited Liability|Separate Legal Entity|Transferable Shares|Enhanced Credibility|Stock Exchange Listing',
'What is Public Limited Company?|Company that can raise capital from public through share issue.|What is minimum capital?|Minimum ₹5 lakh authorized capital required.|How many shareholders needed?|Minimum 7 shareholders required.|Can it list on stock exchange?|Yes, public companies can list on stock exchanges.|What are compliance requirements?|Stricter compliance including quarterly reporting and AGM.'
)
ON DUPLICATE KEY UPDATE
overview = VALUES(overview),
full_description = VALUES(full_description),
processing_time = VALUES(processing_time),
documents_required = VALUES(documents_required),
benefits = VALUES(benefits),
faqs = VALUES(faqs);

-- Service Details for Indian Subsidiary
INSERT INTO service_details (service_id, overview, full_description, processing_time, documents_required, benefits, faqs) VALUES
((SELECT id FROM services WHERE name = 'Indian Subsidiary' LIMIT 1),
'Indian Subsidiary allows foreign companies to establish presence in India. Provides limited liability and separate legal entity status.',
'Indian Subsidiary registration enables foreign companies to operate in India with limited liability. Requires foreign investment compliance and RBI approval.',
'20-30 business days',
'Foreign Company Documents|Board Resolution|Power of Attorney|Indian Director Details|Registered Office Address|FDI Compliance Documents|RBI Approval Documents',
'Limited Liability|Separate Legal Entity|Foreign Investment|Business Expansion|Tax Benefits|Indian Market Access',
'What is Indian Subsidiary?|Company incorporated in India with foreign parent company.|What is FDI compliance?|Foreign Direct Investment guidelines and RBI approval required.|Can foreign nationals be directors?|Yes, subject to compliance with Companies Act and visa requirements.|What is minimum capital?|No minimum capital requirement, but FDI guidelines apply.|What are compliance requirements?|Similar to Private Limited Company with additional FDI reporting.'
)
ON DUPLICATE KEY UPDATE
overview = VALUES(overview),
full_description = VALUES(full_description),
processing_time = VALUES(processing_time),
documents_required = VALUES(documents_required),
benefits = VALUES(benefits),
faqs = VALUES(faqs);

-- Service Details for Non Profit Organization
INSERT INTO service_details (service_id, overview, full_description, processing_time, documents_required, benefits, faqs) VALUES
((SELECT id FROM services WHERE name = 'Non Profit Organization' LIMIT 1),
'Non Profit Organization (Section 8 Company) is for charitable, educational, or social purposes. Provides tax exemptions and limited liability.',
'Section 8 Company registration for non-profit organizations engaged in charitable, educational, or social activities. Provides tax exemptions under 80G and 12A.',
'15-20 business days',
'PAN Card of Directors|Aadhaar Card of Directors|Address Proof|Memorandum of Association|Articles of Association|NPO Objectives|Registered Office Address',
'Tax Exemptions|Limited Liability|80G Benefits|12A Benefits|Social Impact|Government Recognition',
'What is Section 8 Company?|Company formed for charitable, educational, or social purposes.|What are tax benefits?|Exemptions under Section 80G and 12A of Income Tax Act.|Is profit distribution allowed?|No, profits cannot be distributed to members.|What is minimum capital?|No minimum capital requirement for Section 8 companies.|What are compliance requirements?|Annual filing similar to Private Limited Company with additional tax compliance.'
)
ON DUPLICATE KEY UPDATE
overview = VALUES(overview),
full_description = VALUES(full_description),
processing_time = VALUES(processing_time),
documents_required = VALUES(documents_required),
benefits = VALUES(benefits),
faqs = VALUES(faqs);

-- Service Details for Public Limited Company Annual Filing
INSERT INTO service_details (service_id, overview, full_description, processing_time, documents_required, benefits, faqs) VALUES
((SELECT id FROM services WHERE name = 'Public Limited Company Annual Filing' LIMIT 1),
'Public Limited Company Annual Filing includes AOC-4, MGT-7, and quarterly reporting. More stringent compliance than private companies.',
'Annual filing for public limited companies includes financial statements, annual return, quarterly reports, and stock exchange compliance (if listed).',
'20-25 business days',
'Financial Statements|Annual Return|Quarterly Reports|Auditor Report|Stock Exchange Reports (if listed)|Board Meeting Minutes|AGM Minutes',
'Maintain Active Status|Stock Exchange Compliance|Legal Compliance|Avoid Penalties|Investor Confidence',
'What is public company annual filing?|Annual filing includes AOC-4, MGT-7, and quarterly reporting.|What are due dates?|AOC-4: 30 days from AGM, MGT-7: 60 days from AGM, Quarterly: 45 days from quarter end.|Is audit mandatory?|Yes, audit is mandatory for all public companies.|What if company is listed?|Additional stock exchange reporting and compliance required.|Can I file myself?|Yes, but professional assistance recommended for accuracy.'
)
ON DUPLICATE KEY UPDATE
overview = VALUES(overview),
full_description = VALUES(full_description),
processing_time = VALUES(processing_time),
documents_required = VALUES(documents_required),
benefits = VALUES(benefits),
faqs = VALUES(faqs);

-- Service Details for Removal/Resignation of Director
INSERT INTO service_details (service_id, overview, full_description, processing_time, documents_required, benefits, faqs) VALUES
((SELECT id FROM services WHERE name = 'Removal/Resignation of Director' LIMIT 1),
'Remove or process resignation of a director from your company. Requires board resolution and ROC filing of DIR-12.',
'Process director removal or resignation with proper documentation and ROC filing. Includes board resolution, DIR-12 filing, and updating company records.',
'5-7 business days',
'Board Resolution|Director Resignation Letter|DIR-12 Form|Digital Signature|Company Documents|Consent Letter',
'Legal Compliance|Proper Documentation|ROC Filing|Company Records Update|Smooth Transition',
'How to remove a director?|File DIR-12 with ROC along with board resolution and resignation letter.|What is the process?|Board resolution → DIR-12 filing → ROC approval → Records update.|Can director be removed without consent?|Yes, through board resolution and special resolution if required.|What documents are needed?|Board resolution, resignation letter, DIR-12 form, and digital signature.|What is the fee?|Government fees apply. Our service includes all charges.'
)
ON DUPLICATE KEY UPDATE
overview = VALUES(overview),
full_description = VALUES(full_description),
processing_time = VALUES(processing_time),
documents_required = VALUES(documents_required),
benefits = VALUES(benefits),
faqs = VALUES(faqs);

-- Service Details for Add/Remove a Partner in LLP
INSERT INTO service_details (service_id, overview, full_description, processing_time, documents_required, benefits, faqs) VALUES
((SELECT id FROM services WHERE name = 'Add/Remove a Partner in LLP' LIMIT 1),
'Add or remove partners in Limited Liability Partnership. Requires LLP agreement amendment and Form 4 filing with ROC.',
'Add new partners or remove existing partners from LLP. Includes LLP agreement amendment, Form 4 filing, and updating partner details.',
'7-10 business days',
'LLP Agreement|Partner Details|Form 4|Digital Signature|Consent Letter|Board Resolution (if applicable)',
'Business Flexibility|Legal Compliance|ROC Filing|LLP Agreement Update|Partner Management',
'How to add partner in LLP?|File Form 4 with ROC along with amended LLP agreement.|What is the process?|LLP agreement amendment → Form 4 filing → ROC approval.|Can partner be removed?|Yes, through LLP agreement amendment and Form 4 filing.|What documents are needed?|LLP agreement, partner details, Form 4, and digital signature.|What is the fee?|Government fees apply. Our service includes all charges.'
)
ON DUPLICATE KEY UPDATE
overview = VALUES(overview),
full_description = VALUES(full_description),
processing_time = VALUES(processing_time),
documents_required = VALUES(documents_required),
benefits = VALUES(benefits),
faqs = VALUES(faqs);

-- Service Details for Change in LLP Agreement
INSERT INTO service_details (service_id, overview, full_description, processing_time, documents_required, benefits, faqs) VALUES
((SELECT id FROM services WHERE name = 'Change in LLP Agreement' LIMIT 1),
'Modify LLP agreement to change partner rights, profit sharing, or business terms. Requires Form 3 filing with ROC.',
'Change LLP agreement terms including partner rights, profit sharing, capital contribution, or business activities. Includes Form 3 filing with ROC.',
'10-15 business days',
'Amended LLP Agreement|Form 3|Partner Consent|Digital Signature|Board Resolution|Supporting Documents',
'Update Terms|Legal Compliance|ROC Filing|Partner Rights|Business Flexibility',
'What can be changed in LLP agreement?|Partner rights, profit sharing, capital contribution, and business terms.|What is the process?|Draft amended agreement → Partner consent → Form 3 filing → ROC approval.|Is partner consent required?|Yes, all partners must consent to agreement changes.|What documents are needed?|Amended LLP agreement, Form 3, partner consent, and digital signature.|What is the fee?|Government fees apply. Our service includes all charges.'
)
ON DUPLICATE KEY UPDATE
overview = VALUES(overview),
full_description = VALUES(full_description),
processing_time = VALUES(processing_time),
documents_required = VALUES(documents_required),
benefits = VALUES(benefits),
faqs = VALUES(faqs);

-- Service Details for Change of Registered Office Address
INSERT INTO service_details (service_id, overview, full_description, processing_time, documents_required, benefits, faqs) VALUES
((SELECT id FROM services WHERE name = 'Change of Registered Office Address' LIMIT 1),
'Change registered office address of your company or LLP. Requires board resolution and ROC filing of INC-22 (company) or Form 15 (LLP).',
'Change your company or LLP registered office address with proper documentation and ROC filing. Includes address verification and all document updates.',
'7-10 business days',
'New Address Proof|NOC from Property Owner|Board Resolution|INC-22 (Company) or Form 15 (LLP)|Digital Signature|Current Registration Certificate',
'Address Update|Legal Compliance|ROC Filing|Documentation Update|Smooth Transition',
'How to change registered office?|File INC-22 (company) or Form 15 (LLP) with ROC along with new address proof.|What is the process?|Board resolution → Address verification → ROC filing → Certificate update.|Is NOC required?|Yes, NOC from property owner is required for rented premises.|What documents are needed?|New address proof, NOC, board resolution, and ROC form.|What is the fee?|Government fees apply. Our service includes all charges.'
)
ON DUPLICATE KEY UPDATE
overview = VALUES(overview),
full_description = VALUES(full_description),
processing_time = VALUES(processing_time),
documents_required = VALUES(documents_required),
benefits = VALUES(benefits),
faqs = VALUES(faqs);

-- Service Details for Increase in Authorized Capital
INSERT INTO service_details (service_id, overview, full_description, processing_time, documents_required, benefits, faqs) VALUES
((SELECT id FROM services WHERE name = 'Increase in Authorized Capital' LIMIT 1),
'Increase authorized capital of your company to accommodate business growth and new investments. Requires SH-7 filing with ROC.',
'Increase your company authorized capital with proper board resolution, shareholder approval, and SH-7 filing with ROC. Enables more share issuance.',
'10-15 business days',
'Board Resolution|Special Resolution|SH-7 Form|Altered MOA|Digital Signature|Challan Receipt',
'Business Growth|More Share Issuance|Investment Capacity|Legal Compliance|ROC Filing',
'What is authorized capital?|Maximum capital that company can issue shares for.|How to increase capital?|Board resolution → Special resolution → SH-7 filing → ROC approval.|Is shareholder approval required?|Yes, special resolution by shareholders is required.|What documents are needed?|Board resolution, special resolution, SH-7 form, and altered MOA.|What is the fee?|Government fees based on increased capital. Our service includes all charges.'
)
ON DUPLICATE KEY UPDATE
overview = VALUES(overview),
full_description = VALUES(full_description),
processing_time = VALUES(processing_time),
documents_required = VALUES(documents_required),
benefits = VALUES(benefits),
faqs = VALUES(faqs);

-- Service Details for Change in DIN
INSERT INTO service_details (service_id, overview, full_description, processing_time, documents_required, benefits, faqs) VALUES
((SELECT id FROM services WHERE name = 'Change in DIN' LIMIT 1),
'Update Director Identification Number (DIN) details like name, address, or contact information. Requires DIR-6 filing with ROC.',
'Change DIN details including director name, address, contact information, or other personal details. Includes DIR-6 filing with ROC.',
'3-5 business days',
'Updated Documents|DIR-6 Form|Supporting Documents|Digital Signature|Identity Proof|Address Proof',
'Update Information|Legal Compliance|ROC Filing|Correct Details|Smooth Operations',
'What can be changed in DIN?|Director name, address, contact details, and other personal information.|What is the process?|Prepare updated documents → DIR-6 filing → ROC approval.|What documents are needed?|Updated identity proof, address proof, and DIR-6 form.|Is approval required?|Yes, ROC approval is required for DIN changes.|What is the fee?|Government fees apply. Our service includes all charges.'
)
ON DUPLICATE KEY UPDATE
overview = VALUES(overview),
full_description = VALUES(full_description),
processing_time = VALUES(processing_time),
documents_required = VALUES(documents_required),
benefits = VALUES(benefits),
faqs = VALUES(faqs);

-- Service Details for Surrender Your DIN
INSERT INTO service_details (service_id, overview, full_description, processing_time, documents_required, benefits, faqs) VALUES
((SELECT id FROM services WHERE name = 'Surrender Your DIN' LIMIT 1),
'Surrender Director Identification Number when you no longer need it. Requires DIR-5 filing with ROC.',
'Surrender your DIN when you are no longer a director in any company. Includes DIR-5 filing and updating all company records.',
'5-7 business days',
'DIR-5 Form|Digital Signature|Director Details|Company Details|Supporting Documents',
'DIN Surrender|Legal Compliance|ROC Filing|Records Update|Clean Exit',
'When to surrender DIN?|When you are no longer a director in any company.|What is the process?|File DIR-5 with ROC → ROC approval → Records update.|Is approval required?|Yes, ROC approval is required for DIN surrender.|What documents are needed?|DIR-5 form, digital signature, and director details.|What is the fee?|Government fees apply. Our service includes all charges.'
)
ON DUPLICATE KEY UPDATE
overview = VALUES(overview),
full_description = VALUES(full_description),
processing_time = VALUES(processing_time),
documents_required = VALUES(documents_required),
benefits = VALUES(benefits),
faqs = VALUES(faqs);

-- Service Details for Appointment of Auditors
INSERT INTO service_details (service_id, overview, full_description, processing_time, documents_required, benefits, faqs) VALUES
((SELECT id FROM services WHERE name = 'Appointment of Auditors' LIMIT 1),
'Appoint auditors for your company. Mandatory for all companies. Requires ADT-1 filing with ROC within 30 days of appointment.',
'Appoint qualified auditors for your company. Includes board resolution, shareholder approval, and ADT-1 filing with ROC.',
'5-7 business days',
'Board Resolution|Shareholder Resolution|ADT-1 Form|Auditor Consent|Auditor Details|Digital Signature',
'Legal Compliance|Mandatory Requirement|ROC Filing|Audit Services|Financial Transparency',
'Is auditor appointment mandatory?|Yes, all companies must appoint auditors.|What is the due date?|ADT-1 must be filed within 30 days of appointment.|Who can be auditor?|Qualified Chartered Accountant or firm can be appointed.|What documents are needed?|Board resolution, shareholder resolution, ADT-1 form, and auditor consent.|What is the fee?|Government fees apply. Our service includes all charges.'
)
ON DUPLICATE KEY UPDATE
overview = VALUES(overview),
full_description = VALUES(full_description),
processing_time = VALUES(processing_time),
documents_required = VALUES(documents_required),
benefits = VALUES(benefits),
faqs = VALUES(faqs);

-- Service Details for Share Transfer & Transmission
INSERT INTO service_details (service_id, overview, full_description, processing_time, documents_required, benefits, faqs) VALUES
((SELECT id FROM services WHERE name = 'Share Transfer & Transmission' LIMIT 1),
'Transfer or transmit company shares between shareholders. Includes share transfer deed, board approval, and updating share register.',
'Transfer company shares through sale or gift, or transmit shares through inheritance. Includes share transfer deed, board approval, and share register update.',
'7-10 business days',
'Share Transfer Deed|Board Resolution|Share Certificates|PAN of Transferor and Transferee|Stamp Duty Payment|Share Register',
'Share Transfer|Legal Compliance|Proper Documentation|Share Register Update|Smooth Transaction',
'What is share transfer?|Transfer of shares from one shareholder to another.|What is share transmission?|Transfer of shares through inheritance or legal succession.|Is board approval required?|Yes, board approval is required for share transfer.|What documents are needed?|Share transfer deed, board resolution, share certificates, and stamp duty.|What is stamp duty?|Stamp duty varies by state and share value.'
)
ON DUPLICATE KEY UPDATE
overview = VALUES(overview),
full_description = VALUES(full_description),
processing_time = VALUES(processing_time),
documents_required = VALUES(documents_required),
benefits = VALUES(benefits),
faqs = VALUES(faqs);

-- Service Details for LLP Name Change
INSERT INTO service_details (service_id, overview, full_description, processing_time, documents_required, benefits, faqs) VALUES
((SELECT id FROM services WHERE name = 'LLP Name Change' LIMIT 1),
'Change LLP name with ROC approval. Requires name availability, partner resolution, and Form 5 filing.',
'Change your LLP name with proper ROC approval and documentation. Includes name availability check, partner resolution, Form 5 filing, and certificate update.',
'15-20 business days',
'Partner Resolution|Name Availability|Form 5|Amended LLP Agreement|Digital Signature|Current Registration Certificate',
'Brand Rebranding|Business Alignment|Legal Compliance|Documentation Update|Smooth Transition',
'How to change LLP name?|Get name approval, pass partner resolution, file Form 5 with ROC.|What is the process?|Name approval → Partner resolution → Form 5 filing → Certificate update.|Can any name be chosen?|Name must be unique and comply with LLP Act guidelines.|What documents need updating?|LLP agreement, certificates, bank accounts, and all business documents.|How long does it take?|15-20 business days for complete process.'
)
ON DUPLICATE KEY UPDATE
overview = VALUES(overview),
full_description = VALUES(full_description),
processing_time = VALUES(processing_time),
documents_required = VALUES(documents_required),
benefits = VALUES(benefits),
faqs = VALUES(faqs);

-- Service Details for MOA/AOA Amendment
INSERT INTO service_details (service_id, overview, full_description, processing_time, documents_required, benefits, faqs) VALUES
((SELECT id FROM services WHERE name = 'MOA/AOA Amendment' LIMIT 1),
'Amend Memorandum of Association (MOA) or Articles of Association (AOA) of your company. Requires special resolution and ROC filing.',
'Amend MOA or AOA to change company objectives, capital structure, or internal regulations. Includes special resolution, altered MOA/AOA, and ROC filing.',
'10-15 business days',
'Special Resolution|Altered MOA/AOA|Board Resolution|Digital Signature|Supporting Documents|Current MOA/AOA',
'Update Objectives|Change Regulations|Legal Compliance|ROC Filing|Business Flexibility',
'What is MOA?|Memorandum of Association defines company objectives and capital.|What is AOA?|Articles of Association defines company internal regulations.|What can be amended?|Company objectives, capital structure, and internal regulations.|Is special resolution required?|Yes, special resolution by shareholders is required.|What documents are needed?|Special resolution, altered MOA/AOA, and supporting documents.'
)
ON DUPLICATE KEY UPDATE
overview = VALUES(overview),
full_description = VALUES(full_description),
processing_time = VALUES(processing_time),
documents_required = VALUES(documents_required),
benefits = VALUES(benefits),
faqs = VALUES(faqs);

-- Service Details for Strike Off LLP
INSERT INTO service_details (service_id, overview, full_description, processing_time, documents_required, benefits, faqs) VALUES
((SELECT id FROM services WHERE name = 'Strike Off LLP' LIMIT 1),
'Strike off LLP when business is no longer operational. Voluntary strike off is faster and cost-effective than winding up.',
'Strike off your LLP when it is no longer needed. Includes compliance check, Form 24 filing, and closure process.',
'3-6 months',
'Partner Resolution|Form 24|Indemnity Bond|Statement of Accounts|No Objection Certificate|Affidavit|Latest Financial Statements',
'Cost Effective|Faster Process|Legal Closure|No Liabilities|Clean Exit',
'What is strike off?|Removal of LLP name from ROC register when LLP is defunct.|When can LLP be struck off?|When LLP has no operations, assets, or liabilities.|What is the process?|File Form 24 with ROC after meeting eligibility criteria.|Can struck off LLP be revived?|Yes, within 20 years with proper application.|What are the requirements?|No assets, no liabilities, all compliances up to date.'
)
ON DUPLICATE KEY UPDATE
overview = VALUES(overview),
full_description = VALUES(full_description),
processing_time = VALUES(processing_time),
documents_required = VALUES(documents_required),
benefits = VALUES(benefits),
faqs = VALUES(faqs);

-- Service Details for Dissolution of Firms
INSERT INTO service_details (service_id, overview, full_description, processing_time, documents_required, benefits, faqs) VALUES
((SELECT id FROM services WHERE name = 'Dissolution of Firms' LIMIT 1),
'Dissolve partnership firm when business is no longer operational. Requires partner consent and proper documentation.',
'Dissolve partnership firm through mutual consent or court order. Includes partnership deed termination, asset distribution, and closure documentation.',
'15-20 business days',
'Partnership Deed|Partner Consent|Dissolution Agreement|Asset Distribution Statement|Creditor Settlement|Tax Clearance',
'Legal Closure|Asset Distribution|Creditor Settlement|Tax Compliance|Clean Exit',
'What is firm dissolution?|Termination of partnership firm and distribution of assets.|What is the process?|Partner consent → Dissolution agreement → Asset distribution → Closure.|Is partner consent required?|Yes, all partners must consent to dissolution.|What documents are needed?|Partnership deed, dissolution agreement, and asset distribution statement.|How long does it take?|15-20 business days for complete process.'
)
ON DUPLICATE KEY UPDATE
overview = VALUES(overview),
full_description = VALUES(full_description),
processing_time = VALUES(processing_time),
documents_required = VALUES(documents_required),
benefits = VALUES(benefits),
faqs = VALUES(faqs);

-- Service Details for Strike Off OPC
INSERT INTO service_details (service_id, overview, full_description, processing_time, documents_required, benefits, faqs) VALUES
((SELECT id FROM services WHERE name = 'Strike Off OPC' LIMIT 1),
'Strike off One Person Company when business is no longer operational. Voluntary strike off process similar to private companies.',
'Strike off your OPC when it is no longer needed. Includes compliance check, STK-2 filing, and closure process.',
'3-6 months',
'Board Resolution|STK-2 Form|Indemnity Bond|Statement of Accounts|No Objection Certificate|Affidavit|Latest Financial Statements',
'Cost Effective|Faster Process|Legal Closure|No Liabilities|Clean Exit',
'What is strike off?|Removal of OPC name from ROC register when company is defunct.|When can OPC be struck off?|When OPC has no operations, assets, or liabilities.|What is the process?|File STK-2 form with ROC after meeting eligibility criteria.|Can struck off OPC be revived?|Yes, within 20 years with proper application.|What are the requirements?|No assets, no liabilities, all compliances up to date.'
)
ON DUPLICATE KEY UPDATE
overview = VALUES(overview),
full_description = VALUES(full_description),
processing_time = VALUES(processing_time),
documents_required = VALUES(documents_required),
benefits = VALUES(benefits),
faqs = VALUES(faqs);

-- Service Details for GST LUT Letter of Undertaking
INSERT INTO service_details (service_id, overview, full_description, processing_time, documents_required, benefits, faqs) VALUES
((SELECT id FROM services WHERE name = 'GST LUT Letter of Undertaking' LIMIT 1),
'GST LUT (Letter of Undertaking) enables export without paying GST. Required for export businesses to avoid GST payment and claim refunds.',
'GST LUT filing allows exporters to export goods/services without paying GST. Enables seamless exports and faster refund processing.',
'2-3 business days',
'GST Registration Certificate|Export Documents|Bank Guarantee (if required)|LUT Form|Digital Signature|Previous LUT (if renewal)',
'No GST Payment on Exports|Faster Refunds|Seamless Exports|Legal Compliance|Export Benefits',
'What is GST LUT?|Letter of Undertaking allows export without paying GST upfront.|Who needs LUT?|All exporters who want to export without paying GST.|Is bank guarantee required?|Bank guarantee required for first time or if previous LUT was cancelled.|What is validity?|LUT is valid for financial year and needs renewal.|What are the benefits?|No GST payment on exports and faster refund processing.'
)
ON DUPLICATE KEY UPDATE
overview = VALUES(overview),
full_description = VALUES(full_description),
processing_time = VALUES(processing_time),
documents_required = VALUES(documents_required),
benefits = VALUES(benefits),
faqs = VALUES(faqs);

-- Service Details for GST Cancellation
INSERT INTO service_details (service_id, overview, full_description, processing_time, documents_required, benefits, faqs) VALUES
((SELECT id FROM services WHERE name = 'GST Cancellation' LIMIT 1),
'Cancel GST registration when business is closed or no longer required. Requires GST REG-16 filing and clearance of all dues.',
'Cancel your GST registration when business is closed, transferred, or no longer required. Includes GST REG-16 filing and clearance of all pending dues.',
'7-10 business days',
'GST Registration Certificate|GST REG-16 Form|Final GST Returns|Clearance Certificate|Bank Statements|Supporting Documents',
'Legal Closure|Tax Compliance|No Future Liability|Clean Exit|Proper Documentation',
'When can GST be cancelled?|When business is closed, transferred, or no longer required.|What is the process?|File GST REG-16 → Clear all dues → Final returns → Cancellation approval.|Is clearance required?|Yes, all pending GST dues must be cleared before cancellation.|What documents are needed?|GST REG-16 form, final returns, and clearance certificates.|What is the fee?|Government fees apply. Our service includes all charges.'
)
ON DUPLICATE KEY UPDATE
overview = VALUES(overview),
full_description = VALUES(full_description),
processing_time = VALUES(processing_time),
documents_required = VALUES(documents_required),
benefits = VALUES(benefits),
faqs = VALUES(faqs);

-- Service Details for DIR 3 KYC
INSERT INTO service_details (service_id, overview, full_description, processing_time, documents_required, benefits, faqs) VALUES
((SELECT id FROM services WHERE name = 'DIR 3 KYC' LIMIT 1),
'DIR-3 KYC is mandatory annual filing for all directors. Ensures director details are updated with MCA and maintains active DIN status.',
'Director KYC (Know Your Customer) filing is mandatory annually for all directors. Ensures DIN remains active and director details are updated.',
'2-3 business days',
'PAN Card|Aadhaar Card|Address Proof|Mobile Number|Email ID|Digital Signature|DIR-3 KYC Form',
'Maintain Active DIN|Legal Compliance|MCA Requirement|Director Status|Avoid Penalties',
'What is DIR-3 KYC?|Annual KYC filing for directors to maintain active DIN status.|Is it mandatory?|Yes, all directors must file DIR-3 KYC annually.|What is the due date?|September 30 every year.|What happens if not filed?|DIN becomes inactive and director cannot act as director.|What documents are needed?|PAN, Aadhaar, address proof, mobile, email, and digital signature.'
)
ON DUPLICATE KEY UPDATE
overview = VALUES(overview),
full_description = VALUES(full_description),
processing_time = VALUES(processing_time),
documents_required = VALUES(documents_required),
benefits = VALUES(benefits),
faqs = VALUES(faqs);

-- Service Details for Trademark Objections
INSERT INTO service_details (service_id, overview, full_description, processing_time, documents_required, benefits, faqs) VALUES
((SELECT id FROM services WHERE name = 'Trademark Objections' LIMIT 1),
'Handle trademark objections raised by trademark office. Professional response ensures trademark registration approval.',
'Respond to trademark objections raised during examination. Includes objection analysis, response drafting, and filing with trademark office.',
'15-20 business days',
'Trademark Objection Notice|Response to Objection|Supporting Documents|Evidence of Use|Affidavits|Power of Attorney',
'Overcome Objections|Trademark Approval|Legal Compliance|Professional Response|Registration Success',
'What is trademark objection?|Trademark office raises objections if mark is similar to existing or lacks distinctiveness.|How to respond?|File response with arguments and evidence within 2 months.|What are common objections?|Similarity to existing marks, lack of distinctiveness, or descriptive nature.|Can objection be overcome?|Yes, with proper response and evidence, objections can be overcome.|What is the deadline?|Response must be filed within 2 months of objection notice.'
)
ON DUPLICATE KEY UPDATE
overview = VALUES(overview),
full_description = VALUES(full_description),
processing_time = VALUES(processing_time),
documents_required = VALUES(documents_required),
benefits = VALUES(benefits),
faqs = VALUES(faqs);

-- Service Details for Copyright Application
INSERT INTO service_details (service_id, overview, full_description, processing_time, documents_required, benefits, faqs) VALUES
((SELECT id FROM services WHERE name = 'Copyright Application' LIMIT 1),
'Copyright registration protects your original creative works like books, music, software, and artistic works. Provides exclusive rights.',
'Copyright registration provides legal protection for original creative works. Includes application filing, examination, and registration certificate.',
'3-6 months',
'Copyright Work (Book/Software/Art)|Author Details|Work Description|Power of Attorney|Application Form|Supporting Documents',
'Legal Protection|Exclusive Rights|Infringement Protection|Business Value|Asset Creation',
'What can be copyrighted?|Original literary, artistic, musical, and software works can be copyrighted.|How long is copyright valid?|Copyright is valid for author lifetime plus 60 years.|Is registration mandatory?|No, but registration provides legal evidence and protection.|What is the process?|Application filing → Examination → Registration certificate.|What documents are needed?|Copyright work, author details, and application form.'
)
ON DUPLICATE KEY UPDATE
overview = VALUES(overview),
full_description = VALUES(full_description),
processing_time = VALUES(processing_time),
documents_required = VALUES(documents_required),
benefits = VALUES(benefits),
faqs = VALUES(faqs);

-- Service Details for Accounting
INSERT INTO service_details (service_id, overview, full_description, processing_time, documents_required, benefits, faqs) VALUES
((SELECT id FROM services WHERE name = 'Accounting' LIMIT 1),
'Professional bookkeeping and accounting services for businesses. Ensures accurate financial records, compliance, and tax preparation.',
'Comprehensive accounting services including bookkeeping, financial statements, tax preparation, and compliance. Monthly or annual packages available.',
'Ongoing Service',
'Bank Statements|Invoices|Bills|Receipts|Salary Details|Previous Financial Statements|Tax Documents',
'Accurate Records|Tax Compliance|Financial Insights|Time Saving|Professional Management|Business Growth',
'What is included?|Bookkeeping, financial statements, tax preparation, and compliance services.|Is it monthly or annual?|Both monthly and annual packages available based on business needs.|What documents are needed?|Bank statements, invoices, bills, receipts, and financial documents.|What are the benefits?|Accurate records, tax compliance, and financial insights for business growth.|Can I customize?|Yes, services can be customized based on business requirements.'
)
ON DUPLICATE KEY UPDATE
overview = VALUES(overview),
full_description = VALUES(full_description),
processing_time = VALUES(processing_time),
documents_required = VALUES(documents_required),
benefits = VALUES(benefits),
faqs = VALUES(faqs);

-- Service Details for Payroll
INSERT INTO service_details (service_id, overview, full_description, processing_time, documents_required, benefits, faqs) VALUES
((SELECT id FROM services WHERE name = 'Payroll' LIMIT 1),
'Professional payroll processing services for businesses. Includes salary calculation, TDS deduction, PF/ESI compliance, and payslip generation.',
'Comprehensive payroll services including salary calculation, TDS deduction, PF/ESI compliance, payslip generation, and statutory compliance.',
'Ongoing Service',
'Employee Details|Salary Structure|Attendance Records|Previous Payroll|PF/ESI Details|TDS Details',
'Accurate Payroll|Statutory Compliance|Time Saving|Professional Management|Employee Satisfaction|Legal Compliance',
'What is included?|Salary calculation, TDS, PF/ESI, payslip generation, and compliance.|Is it monthly?|Yes, monthly payroll processing with payslip generation.|What documents are needed?|Employee details, salary structure, attendance, and previous payroll.|What are the benefits?|Accurate payroll, statutory compliance, and time saving.|Can I customize?|Yes, payroll services can be customized based on business needs.'
)
ON DUPLICATE KEY UPDATE
overview = VALUES(overview),
full_description = VALUES(full_description),
processing_time = VALUES(processing_time),
documents_required = VALUES(documents_required),
benefits = VALUES(benefits),
faqs = VALUES(faqs);

