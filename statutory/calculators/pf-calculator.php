<?php
$pageTitle = 'PF Calculator | SilverWebBuzz';
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
            <h1 class="text-4xl font-bold text-gray-900 mb-4">PF Calculator</h1>
            <p class="text-xl text-gray-600">Calculate your Employee Provident Fund balance</p>
        </div>

        <div class="grid grid-cols-1 lg:grid-cols-3 gap-8">
            <div class="lg:col-span-2 bg-white rounded-lg shadow-lg p-6">
                <h2 class="text-2xl font-bold text-gray-900 mb-6">Calculate PF Balance</h2>
                <form id="pfForm" class="space-y-6">
                    <div>
                        <label class="block text-sm font-medium text-gray-700 mb-2">Basic Salary + DA (₹ per month)</label>
                        <input type="number" id="basicSalary" placeholder="Enter basic salary + DA" required
                               class="w-full px-4 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-emerald-500">
                    </div>
                    <div>
                        <label class="block text-sm font-medium text-gray-700 mb-2">Current PF Balance (₹)</label>
                        <input type="number" id="currentBalance" placeholder="Enter current PF balance" value="0"
                               class="w-full px-4 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-emerald-500">
                    </div>
                    <div>
                        <label class="block text-sm font-medium text-gray-700 mb-2">Years of Service</label>
                        <input type="number" id="yearsOfService" placeholder="Enter years of service" required
                               class="w-full px-4 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-emerald-500">
                    </div>
                    <button type="submit" class="w-full bg-emerald-600 text-white px-6 py-3 rounded-lg hover:bg-emerald-700 transition-colors font-semibold">
                        <i class="fas fa-calculator mr-2"></i>Calculate
                    </button>
                </form>

                <div id="pfResults" class="mt-6 hidden">
                    <div class="bg-emerald-50 rounded-lg p-6 space-y-4">
                        <div class="flex justify-between items-center">
                            <span class="text-gray-700 font-medium">Employee Contribution (12%):</span>
                            <span class="text-gray-900 font-semibold" id="employeeContribution">₹0</span>
                        </div>
                        <div class="flex justify-between items-center">
                            <span class="text-gray-700 font-medium">Employer Contribution (12%):</span>
                            <span class="text-gray-900 font-semibold" id="employerContribution">₹0</span>
                        </div>
                        <div class="flex justify-between items-center border-t-2 border-emerald-500 pt-4">
                            <span class="text-gray-900 font-bold">Estimated PF Balance:</span>
                            <span class="text-emerald-600 font-bold text-2xl" id="estimatedBalance">₹0</span>
                        </div>
                    </div>
                </div>
            </div>

            <div class="bg-white rounded-lg shadow-lg p-6">
                <h3 class="text-xl font-bold text-gray-900 mb-4">About PF</h3>
                <p class="text-gray-700 text-sm mb-4">EPF (Employee Provident Fund) is a retirement savings scheme where both employee and employer contribute 12% of basic salary + DA each month.</p>
            </div>
        </div>

        <div class="mt-12 bg-white rounded-lg shadow-lg p-8">
            <h2 class="text-3xl font-bold text-gray-900 mb-6">FAQs</h2>
            <div class="space-y-6">
                <div>
                    <h3 class="text-xl font-semibold text-gray-900 mb-2">What is PF?</h3>
                    <p class="text-gray-700">PF (Provident Fund) is a retirement savings scheme where 12% of your basic salary + DA is deducted and your employer contributes an equal amount.</p>
                </div>
            </div>
        </div>
    </div>
</div>

<script>
document.getElementById('pfForm').addEventListener('submit', function(e) {
    e.preventDefault();
    const basic = parseFloat(document.getElementById('basicSalary').value);
    const currentBalance = parseFloat(document.getElementById('currentBalance').value) || 0;
    const years = parseFloat(document.getElementById('yearsOfService').value);
    
    const monthlyEmployee = basic * 0.12;
    const monthlyEmployer = basic * 0.12;
    const monthlyTotal = monthlyEmployee + monthlyEmployer;
    const annualTotal = monthlyTotal * 12;
    const estimatedBalance = currentBalance + (annualTotal * years);
    
    document.getElementById('employeeContribution').textContent = '₹' + Math.round(monthlyEmployee * 12).toLocaleString('en-IN') + '/year';
    document.getElementById('employerContribution').textContent = '₹' + Math.round(monthlyEmployer * 12).toLocaleString('en-IN') + '/year';
    document.getElementById('estimatedBalance').textContent = '₹' + Math.round(estimatedBalance).toLocaleString('en-IN');
    document.getElementById('pfResults').classList.remove('hidden');
});
</script>

<?php include __DIR__ . '/../includes/footer.php'; ?>

