# 🐳 Django Docker Wizard

An interactive Bash script to help you set up a Dockerized Django app quickly and easily — complete with SSL and NGINX reverse proxy configuration.

---

## 🚀 What It Does

This script will:

- ✅ Install Docker on your Ubuntu server
- 📥 Clone your Django project from GitHub
- 🛠️ Build and run it with `docker-compose`
- 🧙 Call the [NGINX Wizard](https://github.com/nimiology/nginx-wizard) to:
  - Configure NGINX
  - Enable HTTPS via Let's Encrypt
  - Add WebSocket and proxy support
  - Serve static/media files

---

## 📦 Requirements

- Ubuntu-based server (tested on 20.04+)
- A public GitHub repository (or SSH/private with auth configured)
- Your repo must contain a valid `docker-compose.yml`
- Domain name must already point to your server

---

## 🧪 Quick Start

```bash
bash <(curl -s https://raw.githubusercontent.com/nimiology/django_docker_wizard/main/wizard.sh)
```

You’ll be prompted to:

1. Provide your GitHub repo URL (e.g. `https://github.com/username/project.git`)
2. The script will:
   - Clone your project to `./app_project`
   - Run `docker-compose up --build -d`
   - Launch the NGINX setup wizard

---

## 🧠 Why Use This?

Because setting up production-ready Django deployments with Docker, NGINX, and SSL shouldn't take hours — just one command.

---

## 📁 Project Structure

```bash
django_docker_wizard/
├── docker-wizard.sh         # Main setup script
└── README.md
```

---

## 🔒 Security Notes

- Your repo must be accessible from the server (via HTTPS or SSH)
- This script does not store or cache any tokens or credentials
- Ensure your firewall allows ports 80 and 443

---

## 🧊 License

MIT — use, modify, or contribute back ❤️

---

## ✨ Author

Built by [@nimiology](https://github.com/nimiology) — developer of 🔥 automation tools.
