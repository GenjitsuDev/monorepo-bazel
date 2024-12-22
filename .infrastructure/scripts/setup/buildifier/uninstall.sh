#!/usr/bin/env bash

set -e # Exit on error

echo "Uninstalling Buildifier..."

OS="$(uname -s)"

if [[ "$OS" == "Darwin" ]]; then
  # macOS Uninstallation using Homebrew
  echo "Detected macOS. Uninstalling Buildifier with Homebrew..."
  if ! command -v brew &>/dev/null; then
    echo "Homebrew is not installed. Please install Homebrew first: https://brew.sh/"
    exit 1
  fi

  brew uninstall buildifier || {
    echo "Buildifier not found or already uninstalled."
  }

  echo "Buildifier uninstalled!"

elif [[ "$OS" == "Linux" ]]; then
  # Linux Uninstallation
  echo "Detected Linux. Removing Buildifier binary from /usr/local/bin..."

  if [ -f "/usr/local/bin/buildifier" ]; then
    sudo rm /usr/local/bin/buildifier
    echo "Buildifier uninstalled!"
  else
    echo "Buildifier not found in /usr/local/bin."
  fi

else
  echo "Unsupported operating system: $OS"
  exit 1
fi
