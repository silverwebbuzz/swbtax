<?php
$pageTitle = 'NPS Calculator | SilverWebBuzz';
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
            <h1 class="text-4xl font-bold text-gray-900 mb-4">NPS Calculator</h1>
            <p class="text-xl text-gray-600">Calculate returns on your National Pension System investment</p>
        </div>

        <div class="grid grid-cols-1 lg:grid-cols-3 gap-8">
            <div class="lg:col-span-2 bg-white rounded-lg shadow-lg p-6">
                <h2 class="text-2xl font-bold text-gray-900 mb-6">Calculate NPS Returns</h2>
                <form id="npsForm" class="space-y-6">
                    <div>
                        <label class="block text-sm font-medium text-gray-700 mb-2">Monthly Contribution (₹)</label>
                        <input type="number" id="monthlyContribution" placeholder="Enter monthly NPS contribution" required
                               class="w-full px-4 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-emerald-500">
                    </div>
                    <div>
                        <label class="block text-sm font-medium text-gray-700 mb-2">Expected Annual Return (%)</label>
                        <input type="number" id="expectedReturn" step="0.01" value="10" placeholder="Enter expected return" required
                               class="w-full px-4 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-emerald-500">
                    </div>
                    <div>
                        <label class="block text-sm font-medium text-gray-700 mb-2">Investment Period (Years)</label>
                        <input type="number" id="investmentPeriod" placeholder="Enter investment period" required
                               class="w-full px-4 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-emerald-500">
                    </div>
                    <button type="submit" class="w-full bg-emerald-600 text-white px-6 py-3 rounded-lg hover:bg-emerald-700 transition-colors font-semibold">
                        <i class="fas fa-calculator mr-2"></i>Calculate
                    </button>
                </form>

                <div id="npsResults" class="mt-6 hidden">
                    <div class="bg-emerald-50 rounded-lg p-6 space-y-4">
                        <div class="flex justify-between items-center">
                            <span class="text-gray-700 font-medium">Total Contribution:</span>
                            <span class="text-gray-900 font-semibold" id="totalContribution">₹0</span>
                        </div>
                        <div class="flex justify-between items-center">
                            <span class="text-gray-700 font-medium">Estimated Corpus:</span>
                            <span class="text-emerald-600 font-bold text-2xl" id="estimatedCorpus">₹0</span>
                        </div>
                        <div class="flex justify-between items-center">
                            <span class="text-gray-700 font-medium">Estimated Returns:</span>
                            <span class="text-emerald-600 font-bold text-xl" id="estimatedReturns">₹0</span>
                        </div>
                    </div>
                </div>
            </div>

            <div class="bg-white rounded-lg shadow-lg p-6">
                <h3 class="text-xl font-bold text-gray-900 mb-4">About NPS</h3>
                <p class="text-gray-700 text-sm mb-4">NPS (National Pension System) is a voluntary retirement savings scheme that helps you build a retirement corpus with tax benefits under Section 80C and 80CCD.</p>
            </div>
        </div>

        <div class="mt-12 bg-white rounded-lg shadow-lg p-8">
            <h2 class="text-3xl font-bold text-gray-900 mb-6">FAQs</h2>
            <div class="space-y-6">
                <div>
                    <h3 class="text-xl font-semibold text-gray-900 mb-2">What is NPS?</h3>
                    <p class="text-gray-700">NPS is a government-backed retirement savings scheme that offers tax benefits and helps you build a retirement corpus through regular contributions.</p>
                </div>
            </div>
        </div>
    </div>
</div>

<script>
document.getElementById('npsForm').addEventListener('submit', function(e) {
    e.preventDefault();
    const P = parseFloat(document.getElementById('monthlyContribution').value);
    const r = parseFloat(document.getElementById('expectedReturn').value) / 100 / 12;
    const n = parseFloat(document.getElementById('investmentPeriod').value) * 12;
    
    if (P > 0 && r > 0 && n > 0) {
        const corpus = P * (((Math.pow(1 + r, n) - 1) / r) * (1 + r));
        const totalContribution = P * n;
        const estimatedReturns = corpus - totalContribution;
        
        document.getElementById('totalContribution').textContent = '₹' + Math.round(totalContribution).toLocaleString('en-IN');
        document.getElementById('estimatedCorpus').textContent = '₹' + Math.round(corpus).toLocaleString('en-IN');
        document.getElementById('estimatedReturns').textContent = '₹' + Math.round(estimatedReturns).toLocaleString('en-IN');
        document.getElementById('npsResults').classList.remove('hidden');
    }
});
</script>

<?php include __DIR__ . '/../includes/footer.php'; ?>

