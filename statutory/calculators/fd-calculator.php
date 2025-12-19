<?php
$pageTitle = 'FD Calculator | SilverWebBuzz';
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
            <h1 class="text-4xl font-bold text-gray-900 mb-4">FD Calculator</h1>
            <p class="text-xl text-gray-600">Calculate returns on your Fixed Deposit</p>
        </div>

        <div class="grid grid-cols-1 lg:grid-cols-3 gap-8">
            <div class="lg:col-span-2 bg-white rounded-lg shadow-lg p-6">
                <h2 class="text-2xl font-bold text-gray-900 mb-6">Calculate FD Returns</h2>
                <form id="fdForm" class="space-y-6">
                    <div>
                        <label class="block text-sm font-medium text-gray-700 mb-2">Principal Amount (₹)</label>
                        <input type="number" id="principalAmount" placeholder="Enter FD amount" required
                               class="w-full px-4 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-emerald-500">
                    </div>
                    <div>
                        <label class="block text-sm font-medium text-gray-700 mb-2">Interest Rate (% per annum)</label>
                        <input type="number" id="interestRate" step="0.01" placeholder="Enter interest rate" required
                               class="w-full px-4 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-emerald-500">
                    </div>
                    <div>
                        <label class="block text-sm font-medium text-gray-700 mb-2">Tenure</label>
                        <div class="grid grid-cols-2 gap-4">
                            <div>
                                <input type="number" id="tenureYears" placeholder="Years" 
                                       class="w-full px-4 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-emerald-500">
                            </div>
                            <div>
                                <input type="number" id="tenureMonths" placeholder="Months" 
                                       class="w-full px-4 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-emerald-500">
                            </div>
                        </div>
                    </div>
                    <button type="submit" class="w-full bg-emerald-600 text-white px-6 py-3 rounded-lg hover:bg-emerald-700 transition-colors font-semibold">
                        <i class="fas fa-calculator mr-2"></i>Calculate
                    </button>
                </form>

                <div id="fdResults" class="mt-6 hidden">
                    <div class="bg-emerald-50 rounded-lg p-6 space-y-4">
                        <div class="flex justify-between items-center">
                            <span class="text-gray-700 font-medium">Maturity Amount:</span>
                            <span class="text-emerald-600 font-bold text-2xl" id="maturityAmount">₹0</span>
                        </div>
                        <div class="flex justify-between items-center">
                            <span class="text-gray-700">Total Interest:</span>
                            <span class="text-emerald-600 font-bold text-xl" id="totalInterest">₹0</span>
                        </div>
                    </div>
                </div>
            </div>

            <div class="bg-white rounded-lg shadow-lg p-6">
                <h3 class="text-xl font-bold text-gray-900 mb-4">About FD</h3>
                <p class="text-gray-700 text-sm mb-4">Fixed Deposit (FD) is a safe investment option where you deposit a lump sum for a fixed period and earn guaranteed returns.</p>
            </div>
        </div>

        <div class="mt-12 bg-white rounded-lg shadow-lg p-8">
            <h2 class="text-3xl font-bold text-gray-900 mb-6">FAQs</h2>
            <div class="space-y-6">
                <div>
                    <h3 class="text-xl font-semibold text-gray-900 mb-2">What is FD?</h3>
                    <p class="text-gray-700">FD (Fixed Deposit) is a financial instrument where you invest a lump sum for a fixed period at a predetermined interest rate.</p>
                </div>
            </div>
        </div>
    </div>
</div>

<script>
document.getElementById('fdForm').addEventListener('submit', function(e) {
    e.preventDefault();
    const P = parseFloat(document.getElementById('principalAmount').value);
    const r = parseFloat(document.getElementById('interestRate').value) / 100;
    const years = parseFloat(document.getElementById('tenureYears').value) || 0;
    const months = parseFloat(document.getElementById('tenureMonths').value) || 0;
    const n = years + (months / 12);
    
    if (P > 0 && r > 0 && n > 0) {
        const maturityAmount = P * Math.pow(1 + r, n);
        const totalInterest = maturityAmount - P;
        
        document.getElementById('maturityAmount').textContent = '₹' + Math.round(maturityAmount).toLocaleString('en-IN');
        document.getElementById('totalInterest').textContent = '₹' + Math.round(totalInterest).toLocaleString('en-IN');
        document.getElementById('fdResults').classList.remove('hidden');
    }
});
</script>

<?php include __DIR__ . '/../includes/footer.php'; ?>

