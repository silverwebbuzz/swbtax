<?php
$pageTitle = 'Salary Calculator | SilverWebBuzz';
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
            <h1 class="text-4xl font-bold text-gray-900 mb-4">Salary Calculator</h1>
            <p class="text-xl text-gray-600">Calculate your take-home salary and deductions</p>
        </div>

        <div class="grid grid-cols-1 lg:grid-cols-3 gap-8">
            <div class="lg:col-span-2 bg-white rounded-lg shadow-lg p-6">
                <h2 class="text-2xl font-bold text-gray-900 mb-6">Calculate Salary</h2>
                <form id="salaryForm" class="space-y-6">
                    <div>
                        <label class="block text-sm font-medium text-gray-700 mb-2">Annual CTC (₹)</label>
                        <input type="number" id="annualCTC" placeholder="Enter annual CTC" required
                               class="w-full px-4 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-emerald-500">
                    </div>
                    <div>
                        <label class="block text-sm font-medium text-gray-700 mb-2">Basic Salary (% of CTC)</label>
                        <input type="number" id="basicPercent" value="40" placeholder="Enter basic salary percentage" required
                               class="w-full px-4 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-emerald-500">
                    </div>
                    <button type="submit" class="w-full bg-emerald-600 text-white px-6 py-3 rounded-lg hover:bg-emerald-700 transition-colors font-semibold">
                        <i class="fas fa-calculator mr-2"></i>Calculate Salary
                    </button>
                </form>

                <div id="salaryResults" class="mt-6 hidden">
                    <div class="bg-emerald-50 rounded-lg p-6 space-y-4">
                        <div class="flex justify-between items-center">
                            <span class="text-gray-700 font-medium">Monthly Gross Salary:</span>
                            <span class="text-gray-900 font-semibold" id="monthlyGross">₹0</span>
                        </div>
                        <div class="flex justify-between items-center">
                            <span class="text-gray-700">PF Deduction (12%):</span>
                            <span class="text-gray-900 font-semibold" id="pfDeduction">₹0</span>
                        </div>
                        <div class="flex justify-between items-center">
                            <span class="text-gray-700">Income Tax (Estimated):</span>
                            <span class="text-gray-900 font-semibold" id="incomeTax">₹0</span>
                        </div>
                        <div class="flex justify-between items-center border-t-2 border-emerald-500 pt-4">
                            <span class="text-gray-900 font-bold">Take Home Salary:</span>
                            <span class="text-emerald-600 font-bold text-2xl" id="takeHome">₹0</span>
                        </div>
                    </div>
                </div>
            </div>

            <div class="bg-white rounded-lg shadow-lg p-6">
                <h3 class="text-xl font-bold text-gray-900 mb-4">Salary Components</h3>
                <ul class="text-sm text-gray-700 space-y-2">
                    <li>• Basic Salary</li>
                    <li>• HRA</li>
                    <li>• Allowances</li>
                    <li>• PF (12%)</li>
                    <li>• Income Tax</li>
                </ul>
            </div>
        </div>

        <div class="mt-12 bg-white rounded-lg shadow-lg p-8">
            <h2 class="text-3xl font-bold text-gray-900 mb-6">FAQs</h2>
            <div class="space-y-6">
                <div>
                    <h3 class="text-xl font-semibold text-gray-900 mb-2">What is CTC?</h3>
                    <p class="text-gray-700">CTC (Cost to Company) is the total cost an employer spends on an employee, including salary, benefits, and contributions.</p>
                </div>
            </div>
        </div>
    </div>
</div>

<script>
document.getElementById('salaryForm').addEventListener('submit', function(e) {
    e.preventDefault();
    const ctc = parseFloat(document.getElementById('annualCTC').value);
    const basicPercent = parseFloat(document.getElementById('basicPercent').value) / 100;
    
    const monthlyGross = ctc / 12;
    const basicSalary = monthlyGross * basicPercent;
    const pfDeduction = basicSalary * 0.12;
    
    // Estimate income tax (simplified)
    const annualTaxable = ctc - (pfDeduction * 12);
    let annualTax = 0;
    if (annualTaxable > 500000) {
        if (annualTaxable <= 1000000) {
            annualTax = 12500 + (annualTaxable - 500000) * 0.20;
        } else {
            annualTax = 112500 + (annualTaxable - 1000000) * 0.30;
        }
    } else if (annualTaxable > 250000) {
        annualTax = (annualTaxable - 250000) * 0.05;
    }
    const monthlyTax = annualTax / 12;
    
    const takeHome = monthlyGross - pfDeduction - monthlyTax;
    
    document.getElementById('monthlyGross').textContent = '₹' + Math.round(monthlyGross).toLocaleString('en-IN');
    document.getElementById('pfDeduction').textContent = '₹' + Math.round(pfDeduction).toLocaleString('en-IN');
    document.getElementById('incomeTax').textContent = '₹' + Math.round(monthlyTax).toLocaleString('en-IN');
    document.getElementById('takeHome').textContent = '₹' + Math.round(takeHome).toLocaleString('en-IN');
    document.getElementById('salaryResults').classList.remove('hidden');
});
</script>

<?php include __DIR__ . '/../includes/footer.php'; ?>

