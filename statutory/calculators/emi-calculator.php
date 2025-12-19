<?php
$pageTitle = 'EMI Calculator | SilverWebBuzz';
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
            <h1 class="text-4xl font-bold text-gray-900 mb-4">EMI Calculator</h1>
            <p class="text-xl text-gray-600">Calculate your Equated Monthly Installment for loans</p>
        </div>

        <div class="grid grid-cols-1 lg:grid-cols-3 gap-8">
            <div class="lg:col-span-2 bg-white rounded-lg shadow-lg p-6">
                <h2 class="text-2xl font-bold text-gray-900 mb-6">Calculate EMI</h2>
                <form id="emiForm" class="space-y-6">
                    <div>
                        <label class="block text-sm font-medium text-gray-700 mb-2">Loan Amount (₹)</label>
                        <input type="number" id="loanAmount" placeholder="Enter loan amount" required
                               class="w-full px-4 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-emerald-500">
                    </div>
                    <div>
                        <label class="block text-sm font-medium text-gray-700 mb-2">Interest Rate (% per annum)</label>
                        <input type="number" id="interestRate" step="0.01" placeholder="Enter interest rate" required
                               class="w-full px-4 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-emerald-500">
                    </div>
                    <div>
                        <label class="block text-sm font-medium text-gray-700 mb-2">Loan Tenure</label>
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
                        <i class="fas fa-calculator mr-2"></i>Calculate EMI
                    </button>
                </form>

                <div id="emiResults" class="mt-6 hidden">
                    <div class="bg-emerald-50 rounded-lg p-6 space-y-4">
                        <div class="flex justify-between items-center">
                            <span class="text-gray-700 font-medium">Monthly EMI:</span>
                            <span class="text-emerald-600 font-bold text-2xl" id="monthlyEMI">₹0</span>
                        </div>
                        <div class="flex justify-between items-center">
                            <span class="text-gray-700">Total Amount:</span>
                            <span class="text-gray-900 font-semibold" id="totalAmount">₹0</span>
                        </div>
                        <div class="flex justify-between items-center">
                            <span class="text-gray-700">Total Interest:</span>
                            <span class="text-gray-900 font-semibold" id="totalInterest">₹0</span>
                        </div>
                    </div>
                </div>
            </div>

            <div class="bg-white rounded-lg shadow-lg p-6">
                <h3 class="text-xl font-bold text-gray-900 mb-4">About EMI</h3>
                <p class="text-gray-700 text-sm mb-4">EMI (Equated Monthly Installment) is the fixed amount you pay monthly towards your loan, which includes both principal and interest components.</p>
                <div class="bg-emerald-50 rounded-lg p-4">
                    <p class="text-sm text-gray-700"><strong>Formula:</strong> EMI = [P × R × (1+R)^N] / [(1+R)^N - 1]</p>
                    <p class="text-xs text-gray-600 mt-2">Where P = Principal, R = Monthly Interest Rate, N = Number of months</p>
                </div>
            </div>
        </div>

        <div class="mt-12 bg-white rounded-lg shadow-lg p-8">
            <h2 class="text-3xl font-bold text-gray-900 mb-6">FAQs</h2>
            <div class="space-y-6">
                <div>
                    <h3 class="text-xl font-semibold text-gray-900 mb-2">What is EMI?</h3>
                    <p class="text-gray-700">EMI stands for Equated Monthly Installment. It's the fixed amount you pay each month to repay your loan, including both principal and interest.</p>
                </div>
                <div>
                    <h3 class="text-xl font-semibold text-gray-900 mb-2">How is EMI calculated?</h3>
                    <p class="text-gray-700">EMI is calculated using the formula: [P × R × (1+R)^N] / [(1+R)^N - 1], where P is the principal amount, R is the monthly interest rate, and N is the number of months.</p>
                </div>
                <div>
                    <h3 class="text-xl font-semibold text-gray-900 mb-2">Can I reduce my EMI?</h3>
                    <p class="text-gray-700">Yes, you can reduce EMI by increasing the loan tenure or negotiating a lower interest rate. However, a longer tenure means paying more total interest.</p>
                </div>
            </div>
        </div>
    </div>
</div>

<script>
document.getElementById('emiForm').addEventListener('submit', function(e) {
    e.preventDefault();
    const P = parseFloat(document.getElementById('loanAmount').value);
    const annualRate = parseFloat(document.getElementById('interestRate').value);
    const years = parseFloat(document.getElementById('tenureYears').value) || 0;
    const months = parseFloat(document.getElementById('tenureMonths').value) || 0;
    const N = years * 12 + months;
    const R = annualRate / 12 / 100;
    
    if (P > 0 && R > 0 && N > 0) {
        const EMI = (P * R * Math.pow(1 + R, N)) / (Math.pow(1 + R, N) - 1);
        const totalAmount = EMI * N;
        const totalInterest = totalAmount - P;
        
        document.getElementById('monthlyEMI').textContent = '₹' + Math.round(EMI).toLocaleString('en-IN');
        document.getElementById('totalAmount').textContent = '₹' + Math.round(totalAmount).toLocaleString('en-IN');
        document.getElementById('totalInterest').textContent = '₹' + Math.round(totalInterest).toLocaleString('en-IN');
        document.getElementById('emiResults').classList.remove('hidden');
    }
});
</script>

<?php include __DIR__ . '/../includes/footer.php'; ?>

