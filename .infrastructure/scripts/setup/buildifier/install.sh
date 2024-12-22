#!/usr/bin/env bash

set -e # Exit on error

echo "Installing Buildifier..."

OS="$(uname -s)"

if [[ "$OS" == "Darwin" ]]; then
  # macOS Installation using Homebrew
  echo "Detected macOS. Installing Buildifier with Homebrew..."
  if ! command -v brew &>/dev/null; then
    echo "Homebrew is not installed. Please install Homebrew first: https://brew.sh/"
    exit 1
  fi

  brew install buildifier
  echo "Buildifier installed!"
  echo "Run 'buildifier --help' to verify."

elif [[ "$OS" == "Linux" ]]; then
  # Linux Installation (from prebuilt binary)
  echo "Detected Linux. Installing Buildifier from prebuilt binary..."

  # Ensure required tools
  sudo apt-get update && sudo apt-get install -y curl

  # Download the latest Buildifier binary (amd64 for demonstration)
  BUILDIFIER_VERSION="6.1.3" # You can update this to the latest version
  curl -Lo buildifier "https://github.com/bazelbuild/buildtools/releases/download/${BUILDIFIER_VERSION}/buildifier-linux-amd64"

  chmod +x buildifier
  sudo mv buildifier /usr/local/bin/

  echo "Buildifier installed!"
  echo "Run 'buildifier --help' to verify."

else
  echo "Unsupported operating system: $OS"
  exit 1
fi
