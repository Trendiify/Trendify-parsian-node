# 🚀 Trendify Node

**Trendify Node** is the Node component of the Trendify PasarGuard platform.

این Repository مربوط به بخش **Node** پلتفرم Trendify PasarGuard است.

---

## ⚡ Quick Install | نصب سریع

<div align="center">

<a href="https://trendify-installer-pasargad.barcelona-campp.workers.dev/" target="_blank">
  <img src="https://img.shields.io/badge/🚀%20Install%20Trendify-5865F2?style=for-the-badge&logo=cloudflare&logoColor=white" alt="Install Trendify">
</a>

</div>

### 🇬🇧 English

Use the **Trendify Installer** to automatically create your own Node and Panel repositories and deploy the required Cloudflare Worker.

👉 **[🚀 Open Trendify Installer](https://trendify-installer-pasargad.barcelona-campp.workers.dev/)**

The installer automatically:

* Creates a random Node repository
* Creates a random Panel repository
* Copies the official Trendify Node source
* Copies the official Trendify Panel source
* Creates and deploys a Cloudflare Worker
* Provides the generated repository and Worker links

After installation, Railway and PasarGuard Node configuration are completed manually.

---

### 🇮🇷 فارسی

با استفاده از **Trendify Installer** می‌توانید Repository شخصی Node و Panel خود را به‌صورت خودکار ایجاد کنید و Worker موردنیاز Cloudflare را بسازید.

👉 **[🚀 ورود به Trendify Installer](https://trendify-installer-pasargad.barcelona-campp.workers.dev/)**

Installer به‌صورت خودکار:

* یک Repository تصادفی برای Node ایجاد می‌کند
* یک Repository تصادفی برای Panel ایجاد می‌کند
* سورس رسمی Trendify Node را کپی می‌کند
* سورس رسمی Trendify Panel را کپی می‌کند
* Cloudflare Worker را ایجاد و Deploy می‌کند
* لینک Repositoryها و Worker را نمایش می‌دهد

بعد از نصب، تنظیمات **Railway، PasarGuard Node و سایر بخش‌ها** به‌صورت دستی انجام می‌شوند.

---

## 🧩 Architecture | معماری

```text
Trendify Installer
        │
        ├── GitHub
        │    ├── Node Repository
        │    └── Panel Repository
        │
        └── Cloudflare
             └── Trendify Worker
```

---

## 🛠️ Node

The Node component is designed to work with the PasarGuard ecosystem.

این بخش برای استفاده به‌عنوان **PasarGuard Node** طراحی شده است.

---

## 📦 Deployment

The Node repository can be built using Docker.

این Repository قابلیت Build شدن با Docker را دارد.

```bash
docker build -t trendify-node .
```

---

## ⚠️ Important | مهم

The installer does **not** configure Railway, PasarGuard, Xray, users, hosts, or client configurations automatically.

Installer بخش‌های زیر را به‌صورت خودکار تنظیم نمی‌کند:

* Railway
* PasarGuard
* Xray
* Node configuration
* Host configuration
* User configuration
* VLESS client configuration

These steps are configured separately as part of the Trendify setup guide.

---

## 🌐 Trendify

**Trendify** is a project built around PasarGuard, Xray and Cloudflare infrastructure.

ترندیفای یک پروژه مبتنی بر PasarGuard، Xray و زیرساخت Cloudflare است.

---

<div align="center">

**Trendify — PasarGuard Infrastructure**

</div>
