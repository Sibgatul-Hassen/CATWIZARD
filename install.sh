#!/usr/bin/env bash
set -e

REPO_BASE="https://raw.githubusercontent.com/Sibgatul-Hassen/catwizard/main"
INSTALL_DIR="/usr/local/share/catwizard"
BIN_PATH="/usr/local/bin/catwizard"

echo "🧙 Installing CatWizard..."

# Remove old installation if it exists
sudo rm -rf "$INSTALL_DIR"
sudo mkdir -p "$INSTALL_DIR"

# Download the self-contained catwizard script
sudo curl -fsSL "$REPO_BASE/catwizard" -o "$INSTALL_DIR/catwizard"

# Download the cow art
sudo curl -fsSL "$REPO_BASE/catwizard.cow" -o "$INSTALL_DIR/catwizard.cow"

# Make it executable
sudo chmod +x "$INSTALL_DIR/catwizard"

# Symlink to /usr/local/bin for easy access
sudo ln -sf "$INSTALL_DIR/catwizard" "$BIN_PATH"

echo "✅ CatWizard installed successfully!"
echo "👉 Run it with: catwizard \"your message\""
