<?php
$pageTitle = 'Refund Policy - SilverWebBuzz';
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
            <h1 class="text-4xl font-bold text-gray-900 mb-4">Refund Policy</h1>
            <p class="text-gray-600">Last updated: <?php echo date('F j, Y'); ?></p>
        </div>

        <div class="prose prose-lg max-w-none">
            <section class="mb-8">
                <h2 class="text-2xl font-bold text-gray-900 mb-4">1. Overview</h2>
                <p class="text-gray-700 mb-4">
                    At SilverWebBuzz, we are committed to providing high-quality compliance and taxation services. This Refund Policy outlines the circumstances under which refunds may be issued and the process for requesting a refund.
                </p>
                <p class="text-gray-700">
                    Please read this policy carefully before making a purchase. By using our services, you agree to the terms of this Refund Policy.
                </p>
            </section>

            <section class="mb-8">
                <h2 class="text-2xl font-bold text-gray-900 mb-4">2. General Refund Policy</h2>
                <p class="text-gray-700 mb-4">
                    Due to the nature of our services, which involve government filings, registrations, and compliance work, refunds are generally not available once work has commenced. However, we understand that exceptional circumstances may arise, and we will consider refund requests on a case-by-case basis.
                </p>
            </section>

            <section class="mb-8">
                <h2 class="text-2xl font-bold text-gray-900 mb-4">3. Eligible Refund Scenarios</h2>
                <h3 class="text-xl font-semibold text-gray-900 mb-3">3.1 Service Not Commenced</h3>
                <p class="text-gray-700 mb-4">
                    If you request a refund before we have commenced work on your service, you may be eligible for a full or partial refund, subject to the following:
                </p>
                <ul class="list-disc list-inside text-gray-700 mb-4 space-y-2">
                    <li>Refund request must be made within 7 days of payment</li>
                    <li>No work should have been initiated on your behalf</li>
                    <li>Any government fees or third-party charges already paid are non-refundable</li>
                </ul>

                <h3 class="text-xl font-semibold text-gray-900 mb-3">3.2 Service Cancellation by Us</h3>
                <p class="text-gray-700 mb-4">
                    If we are unable to provide the service due to circumstances beyond our control or if we cancel the service, you will be entitled to a full refund of the service fee paid to us (excluding government fees and third-party charges).
                </p>

                <h3 class="text-xl font-semibold text-gray-900 mb-3">3.3 Service Not Delivered</h3>
                <p class="text-gray-700 mb-4">
                    If we fail to deliver the service as agreed and you have not received the promised deliverables, you may be eligible for a refund after we have attempted to resolve the issue.
                </p>

                <h3 class="text-xl font-semibold text-gray-900 mb-3">3.4 Duplicate Payment</h3>
                <p class="text-gray-700">
                    If you have been charged twice for the same service, we will refund the duplicate payment immediately upon verification.
                </p>
            </section>

            <section class="mb-8">
                <h2 class="text-2xl font-bold text-gray-900 mb-4">4. Non-Refundable Items</h2>
                <p class="text-gray-700 mb-4">
                    The following are not eligible for refunds:
                </p>
                <ul class="list-disc list-inside text-gray-700 mb-4 space-y-2">
                    <li><strong>Government Fees:</strong> All fees paid to government authorities (GST registration fees, trademark fees, etc.) are non-refundable as these are paid directly to government bodies</li>
                    <li><strong>Completed Services:</strong> Services that have been completed and delivered are not eligible for refunds</li>
                    <li><strong>Third-Party Charges:</strong> Fees paid to third-party service providers (DSC, digital signatures, etc.) are non-refundable</li>
                    <li><strong>Processing Fees:</strong> Any payment processing or transaction fees are non-refundable</li>
                    <li><strong>Services in Progress:</strong> Once work has commenced on your service, refunds are generally not available unless there is a breach of service agreement on our part</li>
                </ul>
            </section>

            <section class="mb-8">
                <h2 class="text-2xl font-bold text-gray-900 mb-4">5. Refund Process</h2>
                <h3 class="text-xl font-semibold text-gray-900 mb-3">5.1 How to Request a Refund</h3>
                <p class="text-gray-700 mb-4">
                    To request a refund, please follow these steps:
                </p>
                <ol class="list-decimal list-inside text-gray-700 mb-4 space-y-2">
                    <li>Contact us via email at <a href="mailto:info@silverwebbuzz.in" class="text-emerald-600 hover:text-emerald-700">info@silverwebbuzz.in</a> with the subject line "Refund Request"</li>
                    <li>Include your order/service reference number</li>
                    <li>Provide a detailed reason for the refund request</li>
                    <li>Attach any relevant documentation or evidence</li>
                </ol>

                <h3 class="text-xl font-semibold text-gray-900 mb-3">5.2 Refund Review Process</h3>
                <p class="text-gray-700 mb-4">
                    Once we receive your refund request:
                </p>
                <ul class="list-disc list-inside text-gray-700 mb-4 space-y-2">
                    <li>We will acknowledge your request within 2 business days</li>
                    <li>We will review your request and the service status</li>
                    <li>We may contact you for additional information if needed</li>
                    <li>We will make a decision within 7-10 business days</li>
                    <li>You will be notified of the decision via email</li>
                </ul>

                <h3 class="text-xl font-semibold text-gray-900 mb-3">5.3 Refund Processing Time</h3>
                <p class="text-gray-700">
                    If your refund is approved, it will be processed within 10-15 business days. The refund will be credited to the original payment method used for the transaction. Please note that it may take additional time for the refund to appear in your account, depending on your bank or payment provider.
                </p>
            </section>

            <section class="mb-8">
                <h2 class="text-2xl font-bold text-gray-900 mb-4">6. Partial Refunds</h2>
                <p class="text-gray-700 mb-4">
                    In some cases, we may offer partial refunds, which may include:
                </p>
                <ul class="list-disc list-inside text-gray-700 mb-4 space-y-2">
                    <li>Refund of service fees only (excluding government and third-party fees)</li>
                    <li>Proportional refunds based on the work completed</li>
                    <li>Refunds minus any administrative or processing charges</li>
                </ul>
            </section>

            <section class="mb-8">
                <h2 class="text-2xl font-bold text-gray-900 mb-4">7. Dispute Resolution</h2>
                <p class="text-gray-700 mb-4">
                    If you are not satisfied with our refund decision, you may:
                </p>
                <ul class="list-disc list-inside text-gray-700 mb-4 space-y-2">
                    <li>Request a review by our management team</li>
                    <li>Provide additional documentation or evidence</li>
                    <li>Seek resolution through our customer support team</li>
                </ul>
                <p class="text-gray-700">
                    We are committed to resolving all disputes fairly and amicably.
                </p>
            </section>

            <section class="mb-8">
                <h2 class="text-2xl font-bold text-gray-900 mb-4">8. Service Modifications</h2>
                <p class="text-gray-700 mb-4">
                    Instead of a refund, we may offer:
                </p>
                <ul class="list-disc list-inside text-gray-700 mb-4 space-y-2">
                    <li>Service modifications or adjustments</li>
                    <li>Credit toward future services</li>
                    <li>Additional support or consultation</li>
                    <li>Alternative service options</li>
                </ul>
            </section>

            <section class="mb-8">
                <h2 class="text-2xl font-bold text-gray-900 mb-4">9. Special Circumstances</h2>
                <h3 class="text-xl font-semibold text-gray-900 mb-3">9.1 Force Majeure</h3>
                <p class="text-gray-700 mb-4">
                    In cases of force majeure events (natural disasters, government actions, pandemics, etc.) that prevent service delivery, we will work with you to find a suitable resolution, which may include rescheduling, service credits, or refunds where appropriate.
                </p>

                <h3 class="text-xl font-semibold text-gray-900 mb-3">9.2 Government Rejections</h3>
                <p class="text-gray-700">
                    If a government authority rejects your application due to reasons beyond our control (e.g., eligibility issues, policy changes), we will work with you to address the issue. Refunds will be considered on a case-by-case basis, but government fees are non-refundable.
                </p>
            </section>

            <section class="mb-8">
                <h2 class="text-2xl font-bold text-gray-900 mb-4">10. Changes to Refund Policy</h2>
                <p class="text-gray-700">
                    We reserve the right to modify this Refund Policy at any time. Changes will be effective immediately upon posting on our website. Your continued use of our services after changes are posted constitutes acceptance of the modified policy.
                </p>
            </section>

            <section class="mb-8">
                <h2 class="text-2xl font-bold text-gray-900 mb-4">11. Contact Us</h2>
                <p class="text-gray-700 mb-4">
                    For refund requests or questions about this policy, please contact us:
                </p>
                <div class="bg-gray-50 p-6 rounded-lg">
                    <p class="text-gray-700 mb-2"><strong>Email:</strong> <a href="mailto:info@silverwebbuzz.in" class="text-emerald-600 hover:text-emerald-700">info@silverwebbuzz.in</a></p>
                    <p class="text-gray-700 mb-2"><strong>Subject:</strong> Refund Request - [Your Service Reference Number]</p>
                    <p class="text-gray-700 mb-2"><strong>Address:</strong> India</p>
                    <p class="text-gray-700"><strong>Phone:</strong> +91 XXX XXX XXXX</p>
                </div>
                <p class="text-gray-700 mt-4">
                    We aim to respond to all refund requests within 2 business days.
                </p>
            </section>
        </div>
    </div>
</div>

<?php include __DIR__ . '/includes/footer.php'; ?>

