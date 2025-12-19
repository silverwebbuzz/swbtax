<?php
$pageTitle = 'Income Tax Calculator - FY 2025-2026 | SilverWebBuzz';
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
                <i class="fas fa-arrow-left h-5 w-5 mr-2"></i>
                Back to Home
            </a>
            <h1 class="text-4xl font-bold text-gray-900 mb-4">Income Tax Calculator</h1>
            <p class="text-xl text-gray-600">Calculate your income tax liability for FY 2025-2026 (AY 2026-27)</p>
        </div>

        <div class="grid grid-cols-1 lg:grid-cols-3 gap-8">
            <!-- Calculator Form -->
            <div class="lg:col-span-2">
                <div class="bg-white rounded-lg shadow-lg p-6 mb-6">
                    <h2 class="text-2xl font-bold text-gray-900 mb-6">Calculate Your Tax</h2>
                    
                    <form id="taxCalculatorForm" class="space-y-6">
                        <div>
                            <label class="block text-sm font-medium text-gray-700 mb-2">Financial Year</label>
                            <select id="financialYear" class="w-full px-4 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-emerald-500">
                                <option value="2025-26">FY 2025-2026 (AY 2026-27)</option>
                                <option value="2024-25">FY 2024-2025 (AY 2025-26)</option>
                            </select>
                        </div>

                        <div>
                            <label class="block text-sm font-medium text-gray-700 mb-2">Age Group</label>
                            <select id="ageGroup" class="w-full px-4 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-emerald-500">
                                <option value="below60">Below 60 years</option>
                                <option value="60-80">60-80 years</option>
                                <option value="above80">Above 80 years</option>
                            </select>
                        </div>

                        <div>
                            <label class="block text-sm font-medium text-gray-700 mb-2">Tax Regime</label>
                            <select id="taxRegime" class="w-full px-4 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-emerald-500">
                                <option value="new">New Tax Regime</option>
                                <option value="old">Old Tax Regime</option>
                            </select>
                        </div>

                        <div>
                            <label class="block text-sm font-medium text-gray-700 mb-2">Annual Income (₹)</label>
                            <input type="number" id="annualIncome" placeholder="Enter your annual income" 
                                   class="w-full px-4 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-emerald-500" required>
                        </div>

                        <div>
                            <label class="block text-sm font-medium text-gray-700 mb-2">Deductions (₹)</label>
                            <input type="number" id="deductions" placeholder="Enter total deductions (80C, 80D, etc.)" 
                                   class="w-full px-4 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-emerald-500" value="0">
                        </div>

                        <button type="submit" class="w-full bg-emerald-600 text-white px-6 py-3 rounded-lg hover:bg-emerald-700 transition-colors font-semibold">
                            <i class="fas fa-calculator mr-2"></i>Calculate Tax
                        </button>
                    </form>
                </div>

                <!-- Results -->
                <div id="taxResults" class="bg-white rounded-lg shadow-lg p-6 hidden">
                    <h3 class="text-2xl font-bold text-gray-900 mb-4">Tax Calculation Results</h3>
                    <div class="space-y-4">
                        <div class="flex justify-between items-center p-4 bg-gray-50 rounded-lg">
                            <span class="text-gray-700 font-medium">Taxable Income:</span>
                            <span class="text-gray-900 font-bold" id="taxableIncome">₹0</span>
                        </div>
                        <div class="flex justify-between items-center p-4 bg-gray-50 rounded-lg">
                            <span class="text-gray-700 font-medium">Income Tax:</span>
                            <span class="text-gray-900 font-bold" id="incomeTax">₹0</span>
                        </div>
                        <div class="flex justify-between items-center p-4 bg-gray-50 rounded-lg">
                            <span class="text-gray-700 font-medium">Cess (4%):</span>
                            <span class="text-gray-900 font-bold" id="cess">₹0</span>
                        </div>
                        <div class="flex justify-between items-center p-4 bg-emerald-50 rounded-lg border-2 border-emerald-500">
                            <span class="text-gray-900 font-bold">Total Tax Liability:</span>
                            <span class="text-emerald-600 font-bold text-xl" id="totalTax">₹0</span>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Sidebar Info -->
            <div class="space-y-6">
                <div class="bg-white rounded-lg shadow-lg p-6">
                    <h3 class="text-xl font-bold text-gray-900 mb-4">Tax Slabs (New Regime)</h3>
                    <div class="space-y-2 text-sm">
                        <div class="flex justify-between"><span>Up to ₹4 lakh</span><span class="font-semibold">Nil</span></div>
                        <div class="flex justify-between"><span>₹4-8 lakh</span><span class="font-semibold">5%</span></div>
                        <div class="flex justify-between"><span>₹8-12 lakh</span><span class="font-semibold">10%</span></div>
                        <div class="flex justify-between"><span>₹12-16 lakh</span><span class="font-semibold">15%</span></div>
                        <div class="flex justify-between"><span>₹16-20 lakh</span><span class="font-semibold">20%</span></div>
                        <div class="flex justify-between"><span>₹20-24 lakh</span><span class="font-semibold">25%</span></div>
                        <div class="flex justify-between"><span>Above ₹24 lakh</span><span class="font-semibold">30%</span></div>
                    </div>
                </div>

                <div class="bg-emerald-50 rounded-lg p-6">
                    <h3 class="text-lg font-bold text-gray-900 mb-2">Need Help?</h3>
                    <p class="text-gray-700 text-sm mb-4">Our tax experts can help you file your ITR and maximize your savings.</p>
                    <a href="/#contact" class="block w-full bg-emerald-600 text-white text-center px-4 py-2 rounded-lg hover:bg-emerald-700 transition-colors">
                        Contact Expert
                    </a>
                </div>
            </div>
        </div>

        <!-- FAQs Section -->
        <div class="mt-12 bg-white rounded-lg shadow-lg p-8">
            <h2 class="text-3xl font-bold text-gray-900 mb-6">Frequently Asked Questions</h2>
            <div class="space-y-6">
                <div>
                    <h3 class="text-xl font-semibold text-gray-900 mb-2">What is the Income Tax Calculator?</h3>
                    <p class="text-gray-700">The Income Tax Calculator is an online tool that helps you calculate your tax liability for a financial year based on your income, deductions, and applicable tax slabs. It simplifies complex tax calculations and helps you plan your taxes effectively.</p>
                </div>
                <div>
                    <h3 class="text-xl font-semibold text-gray-900 mb-2">How to use the Income Tax Calculator?</h3>
                    <p class="text-gray-700">Simply enter your annual income, select your age group and tax regime, add any deductions you're eligible for, and click Calculate. The calculator will show your total tax liability including cess.</p>
                </div>
                <div>
                    <h3 class="text-xl font-semibold text-gray-900 mb-2">What is the difference between Old and New Tax Regime?</h3>
                    <p class="text-gray-700">The old tax regime allows you to claim various deductions and exemptions (like HRA, 80C, 80D, etc.) but has higher tax rates. The new tax regime offers lower tax rates but eliminates most deductions and exemptions.</p>
                </div>
                <div>
                    <h3 class="text-xl font-semibold text-gray-900 mb-2">What deductions can I claim?</h3>
                    <p class="text-gray-700">Common deductions include Section 80C (up to ₹1.5 lakh), Section 80D (health insurance), Section 80G (donations), HRA, and others. Enter the total amount of all deductions in the calculator.</p>
                </div>
                <div>
                    <h3 class="text-xl font-semibold text-gray-900 mb-2">Is the calculator accurate?</h3>
                    <p class="text-gray-700">Yes, our calculator follows the Income Tax Act, 1961 and uses the latest tax slabs and rates. However, for complex tax situations, we recommend consulting with a tax expert.</p>
                </div>
            </div>
        </div>
    </div>
</div>

<script>
document.getElementById('taxCalculatorForm').addEventListener('submit', function(e) {
    e.preventDefault();
    
    const income = parseFloat(document.getElementById('annualIncome').value) || 0;
    const deductions = parseFloat(document.getElementById('deductions').value) || 0;
    const regime = document.getElementById('taxRegime').value;
    const ageGroup = document.getElementById('ageGroup').value;
    
    const taxableIncome = Math.max(0, income - (regime === 'old' ? deductions : 0));
    
    let tax = 0;
    
    if (regime === 'new') {
        // New Tax Regime (FY 2025-26)
        if (taxableIncome <= 400000) {
            tax = 0;
        } else if (taxableIncome <= 800000) {
            tax = (taxableIncome - 400000) * 0.05;
        } else if (taxableIncome <= 1200000) {
            tax = 20000 + (taxableIncome - 800000) * 0.10;
        } else if (taxableIncome <= 1600000) {
            tax = 60000 + (taxableIncome - 1200000) * 0.15;
        } else if (taxableIncome <= 2000000) {
            tax = 120000 + (taxableIncome - 1600000) * 0.20;
        } else if (taxableIncome <= 2400000) {
            tax = 200000 + (taxableIncome - 2000000) * 0.25;
        } else {
            tax = 300000 + (taxableIncome - 2400000) * 0.30;
        }
        
        // Rebate u/s 87A for income up to ₹12 lakh
        if (taxableIncome <= 1200000 && tax > 0) {
            tax = Math.max(0, tax - 60000);
        }
    } else {
        // Old Tax Regime
        let exemptionLimit = 250000;
        if (ageGroup === '60-80') exemptionLimit = 300000;
        if (ageGroup === 'above80') exemptionLimit = 500000;
        
        const taxable = Math.max(0, taxableIncome - exemptionLimit);
        
        if (taxable <= 250000) {
            tax = taxable * 0.05;
        } else if (taxable <= 1000000) {
            tax = 12500 + (taxable - 250000) * 0.20;
        } else {
            tax = 161250 + (taxable - 1000000) * 0.30;
        }
        
        // Rebate u/s 87A
        if (taxableIncome <= 700000 && tax > 0) {
            tax = Math.max(0, tax - 25000);
        }
    }
    
    const cess = tax * 0.04;
    const totalTax = tax + cess;
    
    document.getElementById('taxableIncome').textContent = '₹' + taxableIncome.toLocaleString('en-IN');
    document.getElementById('incomeTax').textContent = '₹' + tax.toLocaleString('en-IN');
    document.getElementById('cess').textContent = '₹' + cess.toLocaleString('en-IN');
    document.getElementById('totalTax').textContent = '₹' + totalTax.toLocaleString('en-IN');
    
    document.getElementById('taxResults').classList.remove('hidden');
    document.getElementById('taxResults').scrollIntoView({ behavior: 'smooth', block: 'nearest' });
});
</script>

<?php include __DIR__ . '/../includes/footer.php'; ?>

