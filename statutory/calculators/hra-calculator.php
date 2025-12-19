<?php
$pageTitle = 'HRA Calculator | SilverWebBuzz';
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
            <h1 class="text-4xl font-bold text-gray-900 mb-4">HRA Calculator</h1>
            <p class="text-xl text-gray-600">Calculate House Rent Allowance exemption and tax savings</p>
        </div>

        <div class="grid grid-cols-1 lg:grid-cols-3 gap-8">
            <div class="lg:col-span-2 bg-white rounded-lg shadow-lg p-6">
                <h2 class="text-2xl font-bold text-gray-900 mb-6">Calculate HRA Exemption</h2>
                <form id="hraForm" class="space-y-6">
                    <div>
                        <label class="block text-sm font-medium text-gray-700 mb-2">Basic Salary (₹ per month)</label>
                        <input type="number" id="basicSalary" placeholder="Enter basic salary" required
                               class="w-full px-4 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-emerald-500">
                    </div>
                    <div>
                        <label class="block text-sm font-medium text-gray-700 mb-2">HRA Received (₹ per month)</label>
                        <input type="number" id="hraReceived" placeholder="Enter HRA received" required
                               class="w-full px-4 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-emerald-500">
                    </div>
                    <div>
                        <label class="block text-sm font-medium text-gray-700 mb-2">Rent Paid (₹ per month)</label>
                        <input type="number" id="rentPaid" placeholder="Enter monthly rent" required
                               class="w-full px-4 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-emerald-500">
                    </div>
                    <div>
                        <label class="block text-sm font-medium text-gray-700 mb-2">City Type</label>
                        <select id="cityType" class="w-full px-4 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-emerald-500">
                            <option value="metro">Metro (Delhi, Mumbai, Chennai, Kolkata)</option>
                            <option value="non-metro">Non-Metro</option>
                        </select>
                    </div>
                    <button type="submit" class="w-full bg-emerald-600 text-white px-6 py-3 rounded-lg hover:bg-emerald-700 transition-colors font-semibold">
                        <i class="fas fa-calculator mr-2"></i>Calculate HRA
                    </button>
                </form>

                <div id="hraResults" class="mt-6 hidden">
                    <div class="bg-emerald-50 rounded-lg p-6 space-y-4">
                        <div class="flex justify-between items-center">
                            <span class="text-gray-700 font-medium">HRA Exemption:</span>
                            <span class="text-emerald-600 font-bold text-2xl" id="hraExemption">₹0</span>
                        </div>
                        <div class="flex justify-between items-center">
                            <span class="text-gray-700">Taxable HRA:</span>
                            <span class="text-gray-900 font-semibold" id="taxableHRA">₹0</span>
                        </div>
                        <div class="flex justify-between items-center">
                            <span class="text-gray-700">Annual Tax Savings (30%):</span>
                            <span class="text-emerald-600 font-bold text-xl" id="taxSavings">₹0</span>
                        </div>
                    </div>
                </div>
            </div>

            <div class="bg-white rounded-lg shadow-lg p-6">
                <h3 class="text-xl font-bold text-gray-900 mb-4">HRA Rules</h3>
                <p class="text-gray-700 text-sm mb-4">HRA exemption is the minimum of:</p>
                <ul class="text-sm text-gray-700 space-y-2 list-disc list-inside">
                    <li>Actual HRA received</li>
                    <li>Rent paid minus 10% of basic salary</li>
                    <li>50% of basic (metro) or 40% (non-metro)</li>
                </ul>
            </div>
        </div>

        <div class="mt-12 bg-white rounded-lg shadow-lg p-8">
            <h2 class="text-3xl font-bold text-gray-900 mb-6">FAQs</h2>
            <div class="space-y-6">
                <div>
                    <h3 class="text-xl font-semibold text-gray-900 mb-2">What is HRA?</h3>
                    <p class="text-gray-700">HRA (House Rent Allowance) is a component of salary provided by employers to employees for renting accommodation. A portion of HRA is exempt from tax.</p>
                </div>
                <div>
                    <h3 class="text-xl font-semibold text-gray-900 mb-2">How is HRA exemption calculated?</h3>
                    <p class="text-gray-700">HRA exemption is the minimum of: (1) Actual HRA received, (2) Rent paid minus 10% of basic salary, (3) 50% of basic salary for metro cities or 40% for non-metro cities.</p>
                </div>
            </div>
        </div>
    </div>
</div>

<script>
document.getElementById('hraForm').addEventListener('submit', function(e) {
    e.preventDefault();
    const basic = parseFloat(document.getElementById('basicSalary').value);
    const hraReceived = parseFloat(document.getElementById('hraReceived').value);
    const rentPaid = parseFloat(document.getElementById('rentPaid').value);
    const cityType = document.getElementById('cityType').value;
    
    const option1 = hraReceived;
    const option2 = rentPaid - (basic * 0.10);
    const option3 = cityType === 'metro' ? basic * 0.50 : basic * 0.40;
    
    const hraExemption = Math.min(option1, Math.max(0, option2), option3);
    const taxableHRA = hraReceived - hraExemption;
    const annualTaxSavings = hraExemption * 12 * 0.30; // Assuming 30% tax bracket
    
    document.getElementById('hraExemption').textContent = '₹' + Math.round(hraExemption).toLocaleString('en-IN');
    document.getElementById('taxableHRA').textContent = '₹' + Math.round(taxableHRA).toLocaleString('en-IN');
    document.getElementById('taxSavings').textContent = '₹' + Math.round(annualTaxSavings).toLocaleString('en-IN');
    document.getElementById('hraResults').classList.remove('hidden');
});
</script>

<?php include __DIR__ . '/../includes/footer.php'; ?>

