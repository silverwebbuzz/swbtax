<?php
$pageTitle = 'RD Calculator | SilverWebBuzz';
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
            <h1 class="text-4xl font-bold text-gray-900 mb-4">RD Calculator</h1>
            <p class="text-xl text-gray-600">Calculate returns on your Recurring Deposit</p>
        </div>

        <div class="grid grid-cols-1 lg:grid-cols-3 gap-8">
            <div class="lg:col-span-2 bg-white rounded-lg shadow-lg p-6">
                <h2 class="text-2xl font-bold text-gray-900 mb-6">Calculate RD Returns</h2>
                <form id="rdForm" class="space-y-6">
                    <div>
                        <label class="block text-sm font-medium text-gray-700 mb-2">Monthly Deposit (₹)</label>
                        <input type="number" id="monthlyDeposit" placeholder="Enter monthly deposit" required
                               class="w-full px-4 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-emerald-500">
                    </div>
                    <div>
                        <label class="block text-sm font-medium text-gray-700 mb-2">Interest Rate (% per annum)</label>
                        <input type="number" id="interestRate" step="0.01" placeholder="Enter interest rate" required
                               class="w-full px-4 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-emerald-500">
                    </div>
                    <div>
                        <label class="block text-sm font-medium text-gray-700 mb-2">Tenure (Months)</label>
                        <input type="number" id="tenure" placeholder="Enter tenure in months" required
                               class="w-full px-4 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-emerald-500">
                    </div>
                    <button type="submit" class="w-full bg-emerald-600 text-white px-6 py-3 rounded-lg hover:bg-emerald-700 transition-colors font-semibold">
                        <i class="fas fa-calculator mr-2"></i>Calculate
                    </button>
                </form>

                <div id="rdResults" class="mt-6 hidden">
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
                            <span class="text-gray-700 font-medium">Total Interest:</span>
                            <span class="text-emerald-600 font-bold text-xl" id="totalInterest">₹0</span>
                        </div>
                    </div>
                </div>
            </div>

            <div class="bg-white rounded-lg shadow-lg p-6">
                <h3 class="text-xl font-bold text-gray-900 mb-4">About RD</h3>
                <p class="text-gray-700 text-sm mb-4">Recurring Deposit (RD) is a fixed deposit scheme where you invest a fixed amount monthly for a predetermined period and earn interest on it.</p>
            </div>
        </div>

        <div class="mt-12 bg-white rounded-lg shadow-lg p-8">
            <h2 class="text-3xl font-bold text-gray-900 mb-6">FAQs</h2>
            <div class="space-y-6">
                <div>
                    <h3 class="text-xl font-semibold text-gray-900 mb-2">What is RD?</h3>
                    <p class="text-gray-700">RD (Recurring Deposit) is a savings scheme where you deposit a fixed amount every month for a fixed tenure and earn interest on it.</p>
                </div>
            </div>
        </div>
    </div>
</div>

<script>
document.getElementById('rdForm').addEventListener('submit', function(e) {
    e.preventDefault();
    const P = parseFloat(document.getElementById('monthlyDeposit').value);
    const r = parseFloat(document.getElementById('interestRate').value) / 100 / 12;
    const n = parseFloat(document.getElementById('tenure').value);
    
    if (P > 0 && r > 0 && n > 0) {
        const maturityAmount = P * (((Math.pow(1 + r, n) - 1) / r) * (1 + r));
        const totalInvestment = P * n;
        const totalInterest = maturityAmount - totalInvestment;
        
        document.getElementById('totalInvestment').textContent = '₹' + Math.round(totalInvestment).toLocaleString('en-IN');
        document.getElementById('maturityAmount').textContent = '₹' + Math.round(maturityAmount).toLocaleString('en-IN');
        document.getElementById('totalInterest').textContent = '₹' + Math.round(totalInterest).toLocaleString('en-IN');
        document.getElementById('rdResults').classList.remove('hidden');
    }
});
</script>

<?php include __DIR__ . '/../includes/footer.php'; ?>

