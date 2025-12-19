<?php
$pageTitle = 'Terms and Conditions - SilverWebBuzz';
$basePath = '/statutory';
$scriptPath = dirname($_SERVER['SCRIPT_NAME']);
if ($scriptPath !== '/' && $scriptPath !== '') {
    $basePath = rtrim($scriptPath, '/');
}

require_once __DIR__ . '/includes/header.php';
?>

<div class="min-h-screen bg-white">
    <div class="max-w-4xl mx-auto px-4 sm:px-6 lg:px-8 py-12">
        <div class="mb-8">
            <a href="/" class="flex items-center text-emerald-600 hover:text-emerald-700 mb-6">
                <i class="fas fa-arrow-left h-5 w-5 mr-2"></i>
                Back to Home
            </a>
            <h1 class="text-4xl font-bold text-gray-900 mb-4">Terms and Conditions</h1>
            <p class="text-gray-600">Last updated: <?php echo date('F j, Y'); ?></p>
        </div>

        <div class="prose prose-lg max-w-none">
            <section class="mb-8">
                <h2 class="text-2xl font-bold text-gray-900 mb-4">1. Acceptance of Terms</h2>
                <p class="text-gray-700 mb-4">
                    By accessing and using the services provided by SilverWebBuzz ("we," "us," or "our"), you accept and agree to be bound by these Terms and Conditions. If you do not agree to these terms, please do not use our services.
                </p>
                <p class="text-gray-700">
                    These terms apply to all users of our website and services, including clients, visitors, and other users of the service.
                </p>
            </section>

            <section class="mb-8">
                <h2 class="text-2xl font-bold text-gray-900 mb-4">2. Description of Services</h2>
                <p class="text-gray-700 mb-4">
                    SilverWebBuzz provides compliance and taxation services for businesses in India, including but not limited to:
                </p>
                <ul class="list-disc list-inside text-gray-700 mb-4 space-y-2">
                    <li>Company registration and incorporation services</li>
                    <li>GST registration and filing services</li>
                    <li>Income tax return filing</li>
                    <li>Trademark, copyright, and patent registration</li>
                    <li>Annual compliance and filing services</li>
                    <li>Tax consultancy and advisory services</li>
                    <li>Other business compliance and regulatory services</li>
                </ul>
                <p class="text-gray-700">
                    We reserve the right to modify, suspend, or discontinue any part of our services at any time without prior notice.
                </p>
            </section>

            <section class="mb-8">
                <h2 class="text-2xl font-bold text-gray-900 mb-4">3. User Obligations</h2>
                <h3 class="text-xl font-semibold text-gray-900 mb-3">3.1 Accurate Information</h3>
                <p class="text-gray-700 mb-4">
                    You agree to provide accurate, current, and complete information when using our services. You are responsible for maintaining the confidentiality of your account information and for all activities that occur under your account.
                </p>

                <h3 class="text-xl font-semibold text-gray-900 mb-3">3.2 Prohibited Activities</h3>
                <p class="text-gray-700 mb-4">
                    You agree not to:
                </p>
                <ul class="list-disc list-inside text-gray-700 mb-4 space-y-2">
                    <li>Use our services for any illegal or unauthorized purpose</li>
                    <li>Violate any laws, regulations, or third-party rights</li>
                    <li>Interfere with or disrupt our services or servers</li>
                    <li>Attempt to gain unauthorized access to our systems</li>
                    <li>Transmit any viruses, malware, or harmful code</li>
                    <li>Use automated systems to access our services without permission</li>
                    <li>Impersonate any person or entity or misrepresent your affiliation</li>
                </ul>
            </section>

            <section class="mb-8">
                <h2 class="text-2xl font-bold text-gray-900 mb-4">4. Service Fees and Payment</h2>
                <p class="text-gray-700 mb-4">
                    Our service fees are displayed on our website and may vary based on the type of service requested. You agree to pay all fees associated with the services you purchase.
                </p>
                <ul class="list-disc list-inside text-gray-700 mb-4 space-y-2">
                    <li>All fees are quoted in Indian Rupees (INR) unless otherwise stated</li>
                    <li>Payment must be made in advance or as agreed upon in the service agreement</li>
                    <li>We reserve the right to change our pricing at any time, but changes will not affect services already purchased</li>
                    <li>Refunds are subject to our Refund Policy</li>
                    <li>Late payments may result in suspension or termination of services</li>
                </ul>
            </section>

            <section class="mb-8">
                <h2 class="text-2xl font-bold text-gray-900 mb-4">5. Service Delivery and Timelines</h2>
                <p class="text-gray-700 mb-4">
                    We strive to deliver services within the estimated timeframes provided. However:
                </p>
                <ul class="list-disc list-inside text-gray-700 mb-4 space-y-2">
                    <li>Service delivery times are estimates and may vary based on government processing times and other factors beyond our control</li>
                    <li>We are not responsible for delays caused by government authorities, third parties, or force majeure events</li>
                    <li>You are responsible for providing all required documents and information in a timely manner</li>
                    <li>Delays in providing required information may result in extended service delivery times</li>
                </ul>
            </section>

            <section class="mb-8">
                <h2 class="text-2xl font-bold text-gray-900 mb-4">6. Intellectual Property</h2>
                <p class="text-gray-700 mb-4">
                    All content, materials, and intellectual property on our website, including but not limited to text, graphics, logos, images, and software, are the property of SilverWebBuzz or its licensors and are protected by copyright, trademark, and other intellectual property laws.
                </p>
                <p class="text-gray-700">
                    You may not reproduce, distribute, modify, or create derivative works from any content on our website without our express written permission.
                </p>
            </section>

            <section class="mb-8">
                <h2 class="text-2xl font-bold text-gray-900 mb-4">7. Limitation of Liability</h2>
                <p class="text-gray-700 mb-4">
                    To the maximum extent permitted by law:
                </p>
                <ul class="list-disc list-inside text-gray-700 mb-4 space-y-2">
                    <li>Our services are provided "as is" without warranties of any kind, either express or implied</li>
                    <li>We do not guarantee that our services will be uninterrupted, error-free, or completely secure</li>
                    <li>We shall not be liable for any indirect, incidental, special, consequential, or punitive damages</li>
                    <li>Our total liability for any claims arising from our services shall not exceed the amount you paid for the specific service in question</li>
                    <li>We are not responsible for decisions made by government authorities or third parties</li>
                </ul>
            </section>

            <section class="mb-8">
                <h2 class="text-2xl font-bold text-gray-900 mb-4">8. Indemnification</h2>
                <p class="text-gray-700">
                    You agree to indemnify, defend, and hold harmless SilverWebBuzz, its officers, directors, employees, and agents from any claims, damages, losses, liabilities, and expenses (including legal fees) arising from your use of our services, violation of these terms, or infringement of any rights of another party.
                </p>
            </section>

            <section class="mb-8">
                <h2 class="text-2xl font-bold text-gray-900 mb-4">9. Termination</h2>
                <p class="text-gray-700 mb-4">
                    We reserve the right to terminate or suspend your access to our services at any time, with or without cause or notice, for any reason, including:
                </p>
                <ul class="list-disc list-inside text-gray-700 mb-4 space-y-2">
                    <li>Violation of these Terms and Conditions</li>
                    <li>Non-payment of fees</li>
                    <li>Fraudulent or illegal activity</li>
                    <li>At our sole discretion</li>
                </ul>
                <p class="text-gray-700">
                    Upon termination, your right to use our services will immediately cease, and we may delete your account and data.
                </p>
            </section>

            <section class="mb-8">
                <h2 class="text-2xl font-bold text-gray-900 mb-4">10. Dispute Resolution</h2>
                <p class="text-gray-700 mb-4">
                    Any disputes arising from these terms or our services shall be resolved through:
                </p>
                <ul class="list-disc list-inside text-gray-700 mb-4 space-y-2">
                    <li>Good faith negotiation between the parties</li>
                    <li>Mediation, if negotiation fails</li>
                    <li>Arbitration in accordance with the Arbitration and Conciliation Act, 2015</li>
                    <li>Jurisdiction shall be in the courts of India</li>
                </ul>
            </section>

            <section class="mb-8">
                <h2 class="text-2xl font-bold text-gray-900 mb-4">11. Governing Law</h2>
                <p class="text-gray-700">
                    These Terms and Conditions shall be governed by and construed in accordance with the laws of India, without regard to its conflict of law provisions. Any legal action or proceeding arising under these terms will be brought exclusively in the courts of India.
                </p>
            </section>

            <section class="mb-8">
                <h2 class="text-2xl font-bold text-gray-900 mb-4">12. Changes to Terms</h2>
                <p class="text-gray-700">
                    We reserve the right to modify these Terms and Conditions at any time. We will notify users of any material changes by posting the updated terms on our website and updating the "Last updated" date. Your continued use of our services after such changes constitutes acceptance of the modified terms.
                </p>
            </section>

            <section class="mb-8">
                <h2 class="text-2xl font-bold text-gray-900 mb-4">13. Severability</h2>
                <p class="text-gray-700">
                    If any provision of these Terms and Conditions is found to be invalid, illegal, or unenforceable, the remaining provisions shall continue in full force and effect.
                </p>
            </section>

            <section class="mb-8">
                <h2 class="text-2xl font-bold text-gray-900 mb-4">14. Contact Information</h2>
                <p class="text-gray-700 mb-4">
                    If you have any questions about these Terms and Conditions, please contact us:
                </p>
                <div class="bg-gray-50 p-6 rounded-lg">
                    <p class="text-gray-700 mb-2"><strong>Email:</strong> <a href="mailto:info@silverwebbuzz.in" class="text-emerald-600 hover:text-emerald-700">info@silverwebbuzz.in</a></p>
                    <p class="text-gray-700 mb-2"><strong>Address:</strong> India</p>
                    <p class="text-gray-700"><strong>Phone:</strong> +91 XXX XXX XXXX</p>
                </div>
            </section>
        </div>
    </div>
</div>

<?php include __DIR__ . '/includes/footer.php'; ?>

