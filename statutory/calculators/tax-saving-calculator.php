<?php
$pageTitle = 'Tax Saving Calculator | SilverWebBuzz';
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
            <h1 class="text-4xl font-bold text-gray-900 mb-4">Tax Saving Calculator</h1>
            <p class="text-xl text-gray-600">Calculate tax savings from your investments and deductions</p>
        </div>

        <div class="grid grid-cols-1 lg:grid-cols-3 gap-8">
            <div class="lg:col-span-2 bg-white rounded-lg shadow-lg p-6">
                <h2 class="text-2xl font-bold text-gray-900 mb-6">Calculate Tax Savings</h2>
                <form id="taxSavingForm" class="space-y-6">
                    <div>
                        <label class="block text-sm font-medium text-gray-700 mb-2">Annual Income (₹)</label>
                        <input type="number" id="annualIncome" placeholder="Enter annual income" required
                               class="w-full px-4 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-emerald-500">
                    </div>
                    <div>
                        <label class="block text-sm font-medium text-gray-700 mb-2">Section 80C Investment (₹)</label>
                        <input type="number" id="section80C" placeholder="Max ₹1.5 lakh" 
                               class="w-full px-4 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-emerald-500">
                    </div>
                    <div>
                        <label class="block text-sm font-medium text-gray-700 mb-2">Section 80D (Health Insurance) (₹)</label>
                        <input type="number" id="section80D" placeholder="Enter amount" 
                               class="w-full px-4 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-emerald-500">
                    </div>
                    <div>
                        <label class="block text-sm font-medium text-gray-700 mb-2">Other Deductions (₹)</label>
                        <input type="number" id="otherDeductions" placeholder="Enter other deductions" 
                               class="w-full px-4 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-emerald-500">
                    </div>
                    <button type="submit" class="w-full bg-emerald-600 text-white px-6 py-3 rounded-lg hover:bg-emerald-700 transition-colors font-semibold">
                        <i class="fas fa-calculator mr-2"></i>Calculate Tax Savings
                    </button>
                </form>

                <div id="taxSavingResults" class="mt-6 hidden">
                    <div class="bg-emerald-50 rounded-lg p-6 space-y-4">
                        <div class="flex justify-between items-center">
                            <span class="text-gray-700 font-medium">Total Deductions:</span>
                            <span class="text-gray-900 font-semibold" id="totalDeductions">₹0</span>
                        </div>
                        <div class="flex justify-between items-center">
                            <span class="text-gray-700 font-medium">Taxable Income:</span>
                            <span class="text-gray-900 font-semibold" id="taxableIncome">₹0</span>
                        </div>
                        <div class="flex justify-between items-center border-t-2 border-emerald-500 pt-4">
                            <span class="text-gray-900 font-bold">Tax Savings:</span>
                            <span class="text-emerald-600 font-bold text-2xl" id="taxSavings">₹0</span>
                        </div>
                    </div>
                </div>
            </div>

            <div class="bg-white rounded-lg shadow-lg p-6">
                <h3 class="text-xl font-bold text-gray-900 mb-4">Tax Saving Options</h3>
                <ul class="text-sm text-gray-700 space-y-2">
                    <li>• Section 80C (₹1.5 lakh)</li>
                    <li>• Section 80D (Health Insurance)</li>
                    <li>• Section 80G (Donations)</li>
                    <li>• HRA Exemption</li>
                    <li>• Home Loan Interest</li>
                </ul>
            </div>
        </div>

        <div class="mt-12 bg-white rounded-lg shadow-lg p-8">
            <h2 class="text-3xl font-bold text-gray-900 mb-6">FAQs</h2>
            <div class="space-y-6">
                <div>
                    <h3 class="text-xl font-semibold text-gray-900 mb-2">How to save tax?</h3>
                    <p class="text-gray-700">You can save tax by investing in tax-saving instruments under Section 80C (ELSS, PPF, NSC, etc.), health insurance under 80D, and claiming other eligible deductions.</p>
                </div>
            </div>
        </div>
    </div>
</div>

<script>
document.getElementById('taxSavingForm').addEventListener('submit', function(e) {
    e.preventDefault();
    const income = parseFloat(document.getElementById('annualIncome').value);
    const sec80C = Math.min(parseFloat(document.getElementById('section80C').value) || 0, 150000);
    const sec80D = parseFloat(document.getElementById('section80D').value) || 0;
    const other = parseFloat(document.getElementById('otherDeductions').value) || 0;
    
    const totalDeductions = sec80C + sec80D + other;
    const taxableIncome = Math.max(0, income - totalDeductions);
    
    // Calculate tax on original income
    let taxBefore = 0;
    if (income > 500000) {
        if (income <= 1000000) {
            taxBefore = 12500 + (income - 500000) * 0.20;
        } else {
            taxBefore = 112500 + (income - 1000000) * 0.30;
        }
    } else if (income > 250000) {
        taxBefore = (income - 250000) * 0.05;
    }
    
    // Calculate tax after deductions
    let taxAfter = 0;
    if (taxableIncome > 500000) {
        if (taxableIncome <= 1000000) {
            taxAfter = 12500 + (taxableIncome - 500000) * 0.20;
        } else {
            taxAfter = 112500 + (taxableIncome - 1000000) * 0.30;
        }
    } else if (taxableIncome > 250000) {
        taxAfter = (taxableIncome - 250000) * 0.05;
    }
    
    const taxSavings = taxBefore - taxAfter;
    
    document.getElementById('totalDeductions').textContent = '₹' + Math.round(totalDeductions).toLocaleString('en-IN');
    document.getElementById('taxableIncome').textContent = '₹' + Math.round(taxableIncome).toLocaleString('en-IN');
    document.getElementById('taxSavings').textContent = '₹' + Math.round(taxSavings).toLocaleString('en-IN');
    document.getElementById('taxSavingResults').classList.remove('hidden');
});
</script>

<?php include __DIR__ . '/../includes/footer.php'; ?>

