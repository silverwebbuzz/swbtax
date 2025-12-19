<?php
$pageTitle = 'Home Loan EMI Calculator | SilverWebBuzz';
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
            <h1 class="text-4xl font-bold text-gray-900 mb-4">Home Loan EMI Calculator</h1>
            <p class="text-xl text-gray-600">Calculate your home loan EMI and plan your home purchase</p>
        </div>

        <div class="grid grid-cols-1 lg:grid-cols-3 gap-8">
            <div class="lg:col-span-2 bg-white rounded-lg shadow-lg p-6">
                <h2 class="text-2xl font-bold text-gray-900 mb-6">Calculate Home Loan EMI</h2>
                <form id="homeLoanForm" class="space-y-6">
                    <div>
                        <label class="block text-sm font-medium text-gray-700 mb-2">Loan Amount (₹)</label>
                        <input type="number" id="loanAmount" placeholder="Enter home loan amount" required
                               class="w-full px-4 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-emerald-500">
                    </div>
                    <div>
                        <label class="block text-sm font-medium text-gray-700 mb-2">Interest Rate (% per annum)</label>
                        <input type="number" id="interestRate" step="0.01" placeholder="Enter interest rate" required
                               class="w-full px-4 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-emerald-500">
                    </div>
                    <div>
                        <label class="block text-sm font-medium text-gray-700 mb-2">Loan Tenure (Years)</label>
                        <input type="number" id="loanTenure" placeholder="Enter loan tenure" required
                               class="w-full px-4 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-emerald-500">
                    </div>
                    <button type="submit" class="w-full bg-emerald-600 text-white px-6 py-3 rounded-lg hover:bg-emerald-700 transition-colors font-semibold">
                        <i class="fas fa-calculator mr-2"></i>Calculate EMI
                    </button>
                </form>

                <div id="homeLoanResults" class="mt-6 hidden">
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
                <h3 class="text-xl font-bold text-gray-900 mb-4">Home Loan Tips</h3>
                <ul class="text-sm text-gray-700 space-y-2">
                    <li>• Compare rates from multiple lenders</li>
                    <li>• Check eligibility before applying</li>
                    <li>• Consider prepayment to save interest</li>
                    <li>• Maintain good credit score</li>
                </ul>
            </div>
        </div>

        <div class="mt-12 bg-white rounded-lg shadow-lg p-8">
            <h2 class="text-3xl font-bold text-gray-900 mb-6">FAQs</h2>
            <div class="space-y-6">
                <div>
                    <h3 class="text-xl font-semibold text-gray-900 mb-2">What is Home Loan EMI?</h3>
                    <p class="text-gray-700">Home Loan EMI is the fixed monthly payment you make to repay your home loan, which includes both principal and interest components.</p>
                </div>
                <div>
                    <h3 class="text-xl font-semibold text-gray-900 mb-2">What factors affect home loan EMI?</h3>
                    <p class="text-gray-700">EMI depends on loan amount, interest rate, and loan tenure. Higher loan amount or interest rate increases EMI, while longer tenure reduces EMI.</p>
                </div>
            </div>
        </div>
    </div>
</div>

<script>
document.getElementById('homeLoanForm').addEventListener('submit', function(e) {
    e.preventDefault();
    const P = parseFloat(document.getElementById('loanAmount').value);
    const annualRate = parseFloat(document.getElementById('interestRate').value);
    const years = parseFloat(document.getElementById('loanTenure').value);
    const N = years * 12;
    const R = annualRate / 12 / 100;
    
    if (P > 0 && R > 0 && N > 0) {
        const EMI = (P * R * Math.pow(1 + R, N)) / (Math.pow(1 + R, N) - 1);
        const totalAmount = EMI * N;
        const totalInterest = totalAmount - P;
        
        document.getElementById('monthlyEMI').textContent = '₹' + Math.round(EMI).toLocaleString('en-IN');
        document.getElementById('totalAmount').textContent = '₹' + Math.round(totalAmount).toLocaleString('en-IN');
        document.getElementById('totalInterest').textContent = '₹' + Math.round(totalInterest).toLocaleString('en-IN');
        document.getElementById('homeLoanResults').classList.remove('hidden');
    }
});
</script>

<?php include __DIR__ . '/../includes/footer.php'; ?>

