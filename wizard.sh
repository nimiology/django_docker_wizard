#!/bin/bash

echo "🐳 Welcome to the Docker Wizard for Ubuntu!"
echo "This script will:"
echo "  ✅ Install Docker"
echo "  ✅ Clone your GitHub repo"
echo "  ✅ Build & run your Docker project"
echo "  ✅ Launch the NGINX Wizard for SSL and reverse proxy setup"
echo

# Step 1: Install Docker
echo "🔧 Installing Docker..."
sudo apt update
sudo apt install -y apt-transport-https ca-certificates curl software-properties-common

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg

echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

sudo apt update
apt-cache policy docker-ce
sudo apt install -y docker-ce

echo "🔍 Checking Docker status..."
sudo systemctl status docker --no-pager

# Step 2: Ask for GitHub repo URL
read -p "🔗 Enter your GitHub repo URL (e.g. https://github.com/username/repo.git): " REPO_URL

if [[ -z "$REPO_URL" ]]; then
  echo "❌ Repo URL is required. Exiting."
  exit 1
fi

# Step 3: Clone the repo
echo "📥 Cloning your repository..."
git clone "$REPO_URL" || { echo "❌ Clone failed. Check access or URL."; exit 1; }

# Extract folder name from repo URL
REPO_DIR=$(basename "$REPO_URL" .git)

cd "$REPO_DIR" || { echo "❌ Failed to enter project directory."; exit 1; }

# Step 4: Build and run the project
echo "🐋 Building and running your Docker project..."
if [ -f "docker-compose.yml" ]; then
  sudo docker compose up --build -d
else
  echo "❌ docker-compose.yml not found in repo. Exiting."
  exit 1
fi

# Step 5: Call the NGINX Wizard
echo "🧙 Launching NGINX Wizard..."
bash <(curl -s https://raw.githubusercontent.com/nimiology/nginx-wizard/main/wizard.sh)

echo "🎉 All done!"
