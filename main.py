from selenium import webdriver
from selenium.webdriver.chrome.options import Options

chrome_options = Options()
chrome_options.add_argument("--headless")  # التشغيل بدون واجهة
chrome_options.add_argument("--no-sandbox")
chrome_options.add_argument("--disable-dev-shm-usage")

# تهيئة المتصفح مع الـ Proxy (إذا كان مطلوبًا)
PROXY = "http://55b3d4be:vygt7axz1hxw@proxy.toolip.io:31114"
chrome_options.add_argument(f'--proxy-server={PROXY}')

driver = webdriver.Chrome(options=chrome_options)
