#!/bin/bash
###############################################################################
# Phase 0 - Step 1: Install Local Tools
# Run this on your local machine (Windows WSL2 /Linux/Mac)
###############################################################################
set -e  # Tells the shell to exit immediately if any command returns a non-zero exit code.

echo "================================"
echo "CKA LAB - Tools Installation"
echo "================================"

# Azure CLI Installation
echo "[1/5] Installing Azure CLI..."
if ! command -v az &> /dev/null; then
    curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash
else
    echo "✔ Azure CLI is already installed: $(az --version | head -n 1)"
fi
