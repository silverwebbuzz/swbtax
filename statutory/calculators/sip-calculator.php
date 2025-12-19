<?php
$pageTitle = 'SIP Calculator | SilverWebBuzz';
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
            <h1 class="text-4xl font-bold text-gray-900 mb-4">SIP Calculator</h1>
            <p class="text-xl text-gray-600">Calculate returns on your Systematic Investment Plan</p>
        </div>

        <div class="grid grid-cols-1 lg:grid-cols-3 gap-8">
            <div class="lg:col-span-2 bg-white rounded-lg shadow-lg p-6">
                <h2 class="text-2xl font-bold text-gray-900 mb-6">Calculate SIP Returns</h2>
                <form id="sipForm" class="space-y-6">
                    <div>
                        <label class="block text-sm font-medium text-gray-700 mb-2">Monthly Investment (₹)</label>
                        <input type="number" id="monthlyInvestment" placeholder="Enter monthly SIP amount" required
                               class="w-full px-4 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-emerald-500">
                    </div>
                    <div>
                        <label class="block text-sm font-medium text-gray-700 mb-2">Expected Annual Return (%)</label>
                        <input type="number" id="expectedReturn" step="0.01" placeholder="Enter expected return" required
                               class="w-full px-4 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-emerald-500">
                    </div>
                    <div>
                        <label class="block text-sm font-medium text-gray-700 mb-2">Investment Period (Years)</label>
                        <input type="number" id="investmentPeriod" placeholder="Enter investment period" required
                               class="w-full px-4 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-emerald-500">
                    </div>
                    <button type="submit" class="w-full bg-emerald-600 text-white px-6 py-3 rounded-lg hover:bg-emerald-700 transition-colors font-semibold">
                        <i class="fas fa-calculator mr-2"></i>Calculate
                    </button>
                </form>

                <div id="sipResults" class="mt-6 hidden">
                    <div class="bg-emerald-50 rounded-lg p-6 space-y-4">
                        <div class="flex justify-between items-center">
                            <span class="text-gray-700 font-medium">Total Investment:</span>
                            <span class="text-gray-900 font-semibold" id="totalInvestment">₹0</span>
                        </div>
                        <div class="flex justify-between items-center">
                            <span class="text-gray-700 font-medium">Estimated Returns:</span>
                            <span class="text-emerald-600 font-bold text-xl" id="estimatedReturns">₹0</span>
                        </div>
                        <div class="flex justify-between items-center border-t-2 border-emerald-500 pt-4">
                            <span class="text-gray-900 font-bold">Maturity Value:</span>
                            <span class="text-emerald-600 font-bold text-2xl" id="maturityValue">₹0</span>
                        </div>
                    </div>
                </div>
            </div>

            <div class="bg-white rounded-lg shadow-lg p-6">
                <h3 class="text-xl font-bold text-gray-900 mb-4">About SIP</h3>
                <p class="text-gray-700 text-sm mb-4">SIP (Systematic Investment Plan) allows you to invest a fixed amount regularly in mutual funds, helping you build wealth over time through the power of compounding.</p>
            </div>
        </div>

        <div class="mt-12 bg-white rounded-lg shadow-lg p-8">
            <h2 class="text-3xl font-bold text-gray-900 mb-6">FAQs</h2>
            <div class="space-y-6">
                <div>
                    <h3 class="text-xl font-semibold text-gray-900 mb-2">What is SIP?</h3>
                    <p class="text-gray-700">SIP is a method of investing a fixed amount regularly in mutual funds, typically monthly. It helps in rupee cost averaging and building wealth over the long term.</p>
                </div>
                <div>
                    <h3 class="text-xl font-semibold text-gray-900 mb-2">How does SIP work?</h3>
                    <p class="text-gray-700">In SIP, you invest a fixed amount every month. The returns are calculated using compound interest, where your returns also earn returns over time.</p>
                </div>
            </div>
        </div>
    </div>
</div>

<script>
document.getElementById('sipForm').addEventListener('submit', function(e) {
    e.preventDefault();
    const P = parseFloat(document.getElementById('monthlyInvestment').value);
    const r = parseFloat(document.getElementById('expectedReturn').value) / 100 / 12;
    const n = parseFloat(document.getElementById('investmentPeriod').value) * 12;
    
    if (P > 0 && r > 0 && n > 0) {
        const maturityValue = P * (((Math.pow(1 + r, n) - 1) / r) * (1 + r));
        const totalInvestment = P * n;
        const estimatedReturns = maturityValue - totalInvestment;
        
        document.getElementById('totalInvestment').textContent = '₹' + Math.round(totalInvestment).toLocaleString('en-IN');
        document.getElementById('estimatedReturns').textContent = '₹' + Math.round(estimatedReturns).toLocaleString('en-IN');
        document.getElementById('maturityValue').textContent = '₹' + Math.round(maturityValue).toLocaleString('en-IN');
        document.getElementById('sipResults').classList.remove('hidden');
    }
});
</script>

<?php include __DIR__ . '/../includes/footer.php'; ?>

