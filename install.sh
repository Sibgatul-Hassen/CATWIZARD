#!/bin/bash

# --- CatWizard Curl Installer ---

REPO_USER="YourUsername"  # <<< CRITICAL: CHANGE THIS TO YOUR GITHUB USERNAME
REPO_NAME="catwizard"
REPO_URL="https://raw.githubusercontent.com/$REPO_USER/$REPO_NAME/main"

INSTALL_DIR="/usr/local/share/$REPO_NAME"
BIN_PATH="/usr/local/bin/$REPO_NAME"

echo "🧙‍♂️ Starting CatWizard Installation..."

# 1. Check for dependencies
if ! command -v cowsay &> /dev/null; then
    echo "Error: 'cowsay' dependency not found."
    echo "Please install cowsay first (e.g., sudo apt install cowsay)."
    exit 1
fi

# 2. Check for root privileges (required for /usr/local)
if [ "$EUID" -ne 0 ]; then
    echo "Please run the installer with sudo:"
    echo "curl -s $REPO_URL/install.sh | sudo bash"
    exit 1
fi

# 3. Download and Install Files
echo "-> Creating data directory: $INSTALL_DIR"
mkdir -p "$INSTALL_DIR" || { echo "Failed to create install directory."; exit 1; }

echo "-> Downloading catwizard files..."
# Download main executable script
curl -s "$REPO_URL/catwizard" -o "$INSTALL_DIR/catwizard"
chmod +x "$INSTALL_DIR/catwizard"

# Download cow file
curl -s "$REPO_URL/catwizard.cow" -o "$INSTALL_DIR/catwizard.cow"

# 4. Create the symbolic link for global execution
echo "-> Creating global executable link: $BIN_PATH"
# Create a small wrapper script in /usr/local/bin
echo "#!/bin/bash" > "$BIN_PATH"
echo 'exec '"$INSTALL_DIR/$REPO_NAME"' "$@"' >> "$BIN_PATH"
chmod +x "$BIN_PATH"

echo ""
echo "🎉 CatWizard installed successfully!"
echo "Run it now: catwizard 'Your message here'"