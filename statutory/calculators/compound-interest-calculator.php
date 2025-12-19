<?php
$pageTitle = 'Compound Interest Calculator | SilverWebBuzz';
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
            <h1 class="text-4xl font-bold text-gray-900 mb-4">Compound Interest Calculator</h1>
            <p class="text-xl text-gray-600">Calculate compound interest on your investment</p>
        </div>

        <div class="grid grid-cols-1 lg:grid-cols-3 gap-8">
            <div class="lg:col-span-2 bg-white rounded-lg shadow-lg p-6">
                <h2 class="text-2xl font-bold text-gray-900 mb-6">Calculate Compound Interest</h2>
                <form id="compoundForm" class="space-y-6">
                    <div>
                        <label class="block text-sm font-medium text-gray-700 mb-2">Principal Amount (₹)</label>
                        <input type="number" id="principal" placeholder="Enter principal amount" required
                               class="w-full px-4 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-emerald-500">
                    </div>
                    <div>
                        <label class="block text-sm font-medium text-gray-700 mb-2">Interest Rate (% per annum)</label>
                        <input type="number" id="interestRate" step="0.01" placeholder="Enter interest rate" required
                               class="w-full px-4 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-emerald-500">
                    </div>
                    <div>
                        <label class="block text-sm font-medium text-gray-700 mb-2">Time Period (Years)</label>
                        <input type="number" id="timePeriod" placeholder="Enter time period" required
                               class="w-full px-4 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-emerald-500">
                    </div>
                    <div>
                        <label class="block text-sm font-medium text-gray-700 mb-2">Compounding Frequency</label>
                        <select id="compoundingFrequency" class="w-full px-4 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-emerald-500">
                            <option value="1">Annually</option>
                            <option value="2">Semi-Annually</option>
                            <option value="4">Quarterly</option>
                            <option value="12" selected>Monthly</option>
                            <option value="365">Daily</option>
                        </select>
                    </div>
                    <button type="submit" class="w-full bg-emerald-600 text-white px-6 py-3 rounded-lg hover:bg-emerald-700 transition-colors font-semibold">
                        <i class="fas fa-calculator mr-2"></i>Calculate
                    </button>
                </form>

                <div id="compoundResults" class="mt-6 hidden">
                    <div class="bg-emerald-50 rounded-lg p-6 space-y-4">
                        <div class="flex justify-between items-center">
                            <span class="text-gray-700 font-medium">Principal Amount:</span>
                            <span class="text-gray-900 font-semibold" id="principalResult">₹0</span>
                        </div>
                        <div class="flex justify-between items-center">
                            <span class="text-gray-700 font-medium">Compound Interest:</span>
                            <span class="text-emerald-600 font-bold text-xl" id="compoundInterest">₹0</span>
                        </div>
                        <div class="flex justify-between items-center border-t-2 border-emerald-500 pt-4">
                            <span class="text-gray-900 font-bold">Total Amount:</span>
                            <span class="text-emerald-600 font-bold text-2xl" id="totalAmount">₹0</span>
                        </div>
                    </div>
                </div>
            </div>

            <div class="bg-white rounded-lg shadow-lg p-6">
                <h3 class="text-xl font-bold text-gray-900 mb-4">About Compound Interest</h3>
                <p class="text-gray-700 text-sm mb-4">Compound interest is interest calculated on the initial principal and also on the accumulated interest of previous periods. It helps your money grow faster over time.</p>
                <div class="bg-emerald-50 rounded-lg p-4">
                    <p class="text-sm text-gray-700"><strong>Formula:</strong> A = P(1 + r/n)^(nt)</p>
                    <p class="text-xs text-gray-600 mt-2">Where A = Amount, P = Principal, r = Rate, n = Compounding frequency, t = Time</p>
                </div>
            </div>
        </div>

        <div class="mt-12 bg-white rounded-lg shadow-lg p-8">
            <h2 class="text-3xl font-bold text-gray-900 mb-6">FAQs</h2>
            <div class="space-y-6">
                <div>
                    <h3 class="text-xl font-semibold text-gray-900 mb-2">What is compound interest?</h3>
                    <p class="text-gray-700">Compound interest is interest earned on both the principal amount and previously earned interest, allowing your investment to grow exponentially over time.</p>
                </div>
            </div>
        </div>
    </div>
</div>

<script>
document.getElementById('compoundForm').addEventListener('submit', function(e) {
    e.preventDefault();
    const P = parseFloat(document.getElementById('principal').value);
    const r = parseFloat(document.getElementById('interestRate').value) / 100;
    const t = parseFloat(document.getElementById('timePeriod').value);
    const n = parseFloat(document.getElementById('compoundingFrequency').value);
    
    if (P > 0 && r > 0 && t > 0 && n > 0) {
        const A = P * Math.pow(1 + (r / n), n * t);
        const compoundInterest = A - P;
        
        document.getElementById('principalResult').textContent = '₹' + Math.round(P).toLocaleString('en-IN');
        document.getElementById('compoundInterest').textContent = '₹' + Math.round(compoundInterest).toLocaleString('en-IN');
        document.getElementById('totalAmount').textContent = '₹' + Math.round(A).toLocaleString('en-IN');
        document.getElementById('compoundResults').classList.remove('hidden');
    }
});
</script>

<?php include __DIR__ . '/../includes/footer.php'; ?>

