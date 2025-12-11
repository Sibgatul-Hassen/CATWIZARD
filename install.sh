#!/bin/bash

# --- CatWizard Installer ---

# 1. Check for dependencies
if ! command -v cowsay &> /dev/null; then
    echo "cowsay is required. Please install it first (e.g., sudo apt install cowsay)."
    exit 1
fi

# Define installation paths
INSTALL_DIR="/usr/local/share/catwizard"
BIN_PATH="/usr/local/bin/catwizard"

echo "Installing CatWizard..."

# 2. Create the data directory
sudo mkdir -p "$INSTALL_DIR"

# 3. Copy files to the data directory
sudo cp catwizard "$INSTALL_DIR"
sudo cp catwizard.cow "$INSTALL_DIR"

# 4. Create a symlink for global execution
# The main script will be installed in /usr/local/bin
echo "#!/bin/bash" | sudo tee "$BIN_PATH" > /dev/null
echo 'exec '"$INSTALL_DIR/catwizard"' "$@"' | sudo tee -a "$BIN_PATH" > /dev/null
sudo chmod +x "$BIN_PATH"

# 5. Finish
echo ""
echo "CatWizard installed successfully!"
echo "To run, simply type: catwizard 'Your message here'"
echo ""
