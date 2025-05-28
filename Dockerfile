FROM python:3.9-slim

# تثبيت متطلبات Chrome وChromedriver
RUN apt-get update && \
    apt-get install -y wget gnupg && \
    wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add - && \
    echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list && \
    apt-get update && \
    apt-get install -y google-chrome-stable && \
    rm -rf /var/lib/apt/lists/*

# تثبيت chromedriver
RUN wget https://chromedriver.storage.googleapis.com/$(wget -qO- https://chromedriver.storage.googleapis.com/LATEST_RELEASE)/chromedriver_linux64.zip && \
    unzip chromedriver_linux64.zip && \
    mv chromedriver /usr/bin/ && \
    chmod +x /usr/bin/chromedriver

# نسخ ملفات المشروع
WORKDIR /app
COPY . .

# تثبيت المكتبات المطلوبة
RUN pip install selenium requests

# تشغيل السكريبت
CMD ["python", "main.py"]
