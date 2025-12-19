<?php
$pageTitle = 'PPF Calculator | SilverWebBuzz';
$basePath = '/statutory';
$scriptPath = dirname(dirname($_SERVER['SCRIPT_NAME']));
if ($scriptPath !== '/' && $scriptPath !== '') {
    $basePath = rtrim($scriptPath, '/');
}
require_once __DIR__ . '/../includes/header.php';
?>

<div class="min-h-screen bg-gradient-to-br from-gray-50 to-white py-12">
    <div class="max-w-6xl mx-auto px-4 sm:px-6 lg:px-8">
        <div class="text-center mb-8">
            <a href="/" class="inline-flex items-center text-emerald-600 hover:text-emerald-700 mb-4">
                <i class="fas fa-arrow-left h-5 w-5 mr-2"></i>Back to Home
            </a>
            <h1 class="text-4xl font-bold text-gray-900 mb-4">PPF Calculator</h1>
            <p class="text-xl text-gray-600">Calculate returns on your Public Provident Fund investment</p>
        </div>

        <div class="grid grid-cols-1 lg:grid-cols-3 gap-8">
            <div class="lg:col-span-2 bg-white rounded-lg shadow-lg p-6">
                <h2 class="text-2xl font-bold text-gray-900 mb-6">Calculate PPF Returns</h2>
                <form id="ppfForm" class="space-y-6">
                    <div>
                        <label class="block text-sm font-medium text-gray-700 mb-2">Annual Investment (₹)</label>
                        <input type="number" id="annualInvestment" placeholder="Enter annual PPF investment" required
                               class="w-full px-4 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-emerald-500">
                        <p class="text-xs text-gray-500 mt-1">Minimum ₹500, Maximum ₹1.5 lakh per year</p>
                    </div>
                    <div>
                        <label class="block text-sm font-medium text-gray-700 mb-2">Interest Rate (%)</label>
                        <input type="number" id="interestRate" step="0.01" value="7.1" placeholder="Current PPF rate" required
                               class="w-full px-4 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-emerald-500">
                    </div>
                    <div>
                        <label class="block text-sm font-medium text-gray-700 mb-2">Investment Period (Years)</label>
                        <input type="number" id="investmentPeriod" value="15" placeholder="Minimum 15 years" required
                               class="w-full px-4 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-emerald-500">
                    </div>
                    <button type="submit" class="w-full bg-emerald-600 text-white px-6 py-3 rounded-lg hover:bg-emerald-700 transition-colors font-semibold">
                        <i class="fas fa-calculator mr-2"></i>Calculate
                    </button>
                </form>

                <div id="ppfResults" class="mt-6 hidden">
                    <div class="bg-emerald-50 rounded-lg p-6 space-y-4">
                        <div class="flex justify-between items-center">
                            <span class="text-gray-700 font-medium">Total Investment:</span>
                            <span class="text-gray-900 font-semibold" id="totalInvestment">₹0</span>
                        </div>
                        <div class="flex justify-between items-center">
                            <span class="text-gray-700 font-medium">Maturity Amount:</span>
                            <span class="text-emerald-600 font-bold text-2xl" id="maturityAmount">₹0</span>
                        </div>
                        <div class="flex justify-between items-center">
                            <span class="text-gray-700 font-medium">Total Interest Earned:</span>
                            <span class="text-emerald-600 font-bold text-xl" id="totalInterest">₹0</span>
                        </div>
                    </div>
                </div>
            </div>

            <div class="bg-white rounded-lg shadow-lg p-6">
                <h3 class="text-xl font-bold text-gray-900 mb-4">About PPF</h3>
                <p class="text-gray-700 text-sm mb-4">PPF (Public Provident Fund) is a long-term savings scheme with tax benefits. It has a lock-in period of 15 years and offers tax-free returns.</p>
                <div class="bg-emerald-50 rounded-lg p-4">
                    <p class="text-sm text-gray-700"><strong>Features:</strong></p>
                    <ul class="text-xs text-gray-600 mt-2 space-y-1 list-disc list-inside">
                        <li>Tax deduction under Section 80C</li>
                        <li>Tax-free interest</li>
                        <li>15-year lock-in period</li>
                        <li>Can extend in blocks of 5 years</li>
                    </ul>
                </div>
            </div>
        </div>

        <div class="mt-12 bg-white rounded-lg shadow-lg p-8">
            <h2 class="text-3xl font-bold text-gray-900 mb-6">FAQs</h2>
            <div class="space-y-6">
                <div>
                    <h3 class="text-xl font-semibold text-gray-900 mb-2">What is PPF?</h3>
                    <p class="text-gray-700">PPF is a long-term savings scheme offered by the Government of India with tax benefits. It has a maturity period of 15 years.</p>
                </div>
                <div>
                    <h3 class="text-xl font-semibold text-gray-900 mb-2">What is the minimum and maximum investment in PPF?</h3>
                    <p class="text-gray-700">Minimum investment is ₹500 per year and maximum is ₹1.5 lakh per year. You can invest in lump sum or installments.</p>
                </div>
                <div>
                    <h3 class="text-xl font-semibold text-gray-900 mb-2">Is PPF interest taxable?</h3>
                    <p class="text-gray-700">No, PPF interest is completely tax-free. The maturity amount is also tax-free.</p>
                </div>
            </div>
        </div>
    </div>
</div>

<script>
document.getElementById('ppfForm').addEventListener('submit', function(e) {
    e.preventDefault();
    const P = parseFloat(document.getElementById('annualInvestment').value);
    const r = parseFloat(document.getElementById('interestRate').value) / 100;
    const n = parseFloat(document.getElementById('investmentPeriod').value);
    
    if (P > 0 && r > 0 && n > 0) {
        // PPF calculation using annuity formula
        const maturityAmount = P * (((Math.pow(1 + r, n) - 1) / r));
        const totalInvestment = P * n;
        const totalInterest = maturityAmount - totalInvestment;
        
        document.getElementById('totalInvestment').textContent = '₹' + Math.round(totalInvestment).toLocaleString('en-IN');
        document.getElementById('maturityAmount').textContent = '₹' + Math.round(maturityAmount).toLocaleString('en-IN');
        document.getElementById('totalInterest').textContent = '₹' + Math.round(totalInterest).toLocaleString('en-IN');
        document.getElementById('ppfResults').classList.remove('hidden');
    }
});
</script>

<?php include __DIR__ . '/../includes/footer.php'; ?>

