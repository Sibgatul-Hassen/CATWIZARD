#!/usr/bin/env bash
set -e

REPO_BASE="https://raw.githubusercontent.com/Sibgatul-Hassen/catwizard/main"

INSTALL_DIR="/usr/local/share/catwizard"
BIN_PATH="/usr/local/bin/catwizard"

echo "🧙 Installing CatWizard..."

# 1. Dependency check
# if ! command -v cowsay >/dev/null 2>&1; then
#     echo "❌ cowsay is required."
#     echo "Install it using: sudo apt install cowsay"
#     exit 1
# fi

# 2. Create install directory
sudo rm -rf "$INSTALL_DIR"
sudo mkdir -p "$INSTALL_DIR"

# 3. Download files from GitHub
sudo curl -fsSL "$REPO_BASE/catwizard" \
  -o "$INSTALL_DIR/catwizard"

sudo curl -fsSL "$REPO_BASE/catwizard.cow" \
  -o "$INSTALL_DIR/catwizard.cow"

# 4. Permissions
sudo chmod +x "$INSTALL_DIR/catwizard"

# 5. Symlink executable
sudo ln -sf "$INSTALL_DIR/catwizard" "$BIN_PATH"

echo "✅ CatWizard installed successfully!"
echo "👉 Run it with: catwizard \"your message\""
