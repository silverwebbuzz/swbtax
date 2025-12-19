<?php
$pageTitle = 'GST Calculator | SilverWebBuzz';
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
            <h1 class="text-4xl font-bold text-gray-900 mb-4">GST Calculator</h1>
            <p class="text-xl text-gray-600">Calculate GST amount and net price</p>
        </div>

        <div class="grid grid-cols-1 lg:grid-cols-3 gap-8">
            <div class="lg:col-span-2 bg-white rounded-lg shadow-lg p-6">
                <h2 class="text-2xl font-bold text-gray-900 mb-6">Calculate GST</h2>
                <form id="gstForm" class="space-y-6">
                    <div>
                        <label class="block text-sm font-medium text-gray-700 mb-2">Amount (₹)</label>
                        <input type="number" id="amount" placeholder="Enter amount" required
                               class="w-full px-4 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-emerald-500">
                    </div>
                    <div>
                        <label class="block text-sm font-medium text-gray-700 mb-2">GST Rate (%)</label>
                        <select id="gstRate" class="w-full px-4 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-emerald-500">
                            <option value="5">5%</option>
                            <option value="12">12%</option>
                            <option value="18" selected>18%</option>
                            <option value="28">28%</option>
                        </select>
                    </div>
                    <div>
                        <label class="block text-sm font-medium text-gray-700 mb-2">Calculation Type</label>
                        <select id="calcType" class="w-full px-4 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-emerald-500">
                            <option value="exclusive">Amount is exclusive of GST</option>
                            <option value="inclusive">Amount is inclusive of GST</option>
                        </select>
                    </div>
                    <button type="submit" class="w-full bg-emerald-600 text-white px-6 py-3 rounded-lg hover:bg-emerald-700 transition-colors font-semibold">
                        <i class="fas fa-calculator mr-2"></i>Calculate GST
                    </button>
                </form>

                <div id="gstResults" class="mt-6 hidden">
                    <div class="bg-emerald-50 rounded-lg p-6 space-y-4">
                        <div class="flex justify-between items-center">
                            <span class="text-gray-700 font-medium">Original Amount:</span>
                            <span class="text-gray-900 font-semibold" id="originalAmount">₹0</span>
                        </div>
                        <div class="flex justify-between items-center">
                            <span class="text-gray-700 font-medium">GST Amount:</span>
                            <span class="text-emerald-600 font-bold text-xl" id="gstAmount">₹0</span>
                        </div>
                        <div class="flex justify-between items-center border-t-2 border-emerald-500 pt-4">
                            <span class="text-gray-900 font-bold">Total Amount:</span>
                            <span class="text-emerald-600 font-bold text-2xl" id="totalAmount">₹0</span>
                        </div>
                    </div>
                </div>
            </div>

            <div class="bg-white rounded-lg shadow-lg p-6">
                <h3 class="text-xl font-bold text-gray-900 mb-4">GST Rates in India</h3>
                <div class="space-y-2 text-sm">
                    <div class="flex justify-between"><span>5%</span><span class="font-semibold">Essential items</span></div>
                    <div class="flex justify-between"><span>12%</span><span class="font-semibold">Standard items</span></div>
                    <div class="flex justify-between"><span>18%</span><span class="font-semibold">Most goods/services</span></div>
                    <div class="flex justify-between"><span>28%</span><span class="font-semibold">Luxury items</span></div>
                </div>
            </div>
        </div>

        <div class="mt-12 bg-white rounded-lg shadow-lg p-8">
            <h2 class="text-3xl font-bold text-gray-900 mb-6">FAQs</h2>
            <div class="space-y-6">
                <div>
                    <h3 class="text-xl font-semibold text-gray-900 mb-2">What is GST?</h3>
                    <p class="text-gray-700">GST (Goods and Services Tax) is a comprehensive indirect tax levied on the supply of goods and services in India. It replaced multiple indirect taxes like VAT, service tax, etc.</p>
                </div>
                <div>
                    <h3 class="text-xl font-semibold text-gray-900 mb-2">What are the GST rates?</h3>
                    <p class="text-gray-700">GST is charged at 5%, 12%, 18%, and 28% depending on the type of goods or services. Some items are exempt from GST.</p>
                </div>
                <div>
                    <h3 class="text-xl font-semibold text-gray-900 mb-2">How to calculate GST?</h3>
                    <p class="text-gray-700">If amount is exclusive of GST: GST = Amount × (GST Rate / 100), Total = Amount + GST. If amount is inclusive: GST = Amount × (GST Rate / (100 + GST Rate)), Net Amount = Amount - GST.</p>
                </div>
            </div>
        </div>
    </div>
</div>

<script>
document.getElementById('gstForm').addEventListener('submit', function(e) {
    e.preventDefault();
    const amount = parseFloat(document.getElementById('amount').value);
    const rate = parseFloat(document.getElementById('gstRate').value);
    const calcType = document.getElementById('calcType').value;
    
    let originalAmount, gstAmount, totalAmount;
    
    if (calcType === 'exclusive') {
        originalAmount = amount;
        gstAmount = amount * (rate / 100);
        totalAmount = originalAmount + gstAmount;
    } else {
        totalAmount = amount;
        originalAmount = amount / (1 + rate / 100);
        gstAmount = totalAmount - originalAmount;
    }
    
    document.getElementById('originalAmount').textContent = '₹' + Math.round(originalAmount).toLocaleString('en-IN');
    document.getElementById('gstAmount').textContent = '₹' + Math.round(gstAmount).toLocaleString('en-IN');
    document.getElementById('totalAmount').textContent = '₹' + Math.round(totalAmount).toLocaleString('en-IN');
    document.getElementById('gstResults').classList.remove('hidden');
});
</script>

<?php include __DIR__ . '/../includes/footer.php'; ?>

