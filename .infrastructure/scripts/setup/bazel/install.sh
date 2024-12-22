#!/usr/bin/env bash

set -e # Exit on error

echo "Installing Bazel..."

# Detect the operating system
OS="$(uname -s)"

if [[ "$OS" == "Darwin" ]]; then
  # macOS Installation using Homebrew
  echo "Detected macOS. Installing Bazelisk (recommended Bazel launcher) with Homebrew..."
  if ! command -v brew &>/dev/null; then
    echo "Homebrew is not installed. Please install Homebrew first: https://brew.sh/"
    exit 1
  fi

  # Install Bazelisk (Bazel launcher)
  brew install bazelisk
  bazel --version

  echo "You can Run 'bazel --version' to verify the installation."

elif [[ "$OS" == "Linux" ]]; then
  # Linux Installation using apt (Debian/Ubuntu)
  echo "Detected Linux. Installing Bazel via APT..."

  # Install required tools
  sudo apt update
  sudo apt install -y curl gnupg

  # Add Bazel repository and install Bazel
  curl -fsSL https://bazel.build/bazel-release.pub.gpg | gpg --dearmor >bazel-archive-keyring.gpg
  sudo mv bazel-archive-keyring.gpg /usr/share/keyrings
  echo "deb [arch=amd64 signed-by=/usr/share/keyrings/bazel-archive-keyring.gpg] https://bazel.build/apt stable jdk1.8" |
    sudo tee /etc/apt/sources.list.d/bazel.list

  sudo apt update && sudo apt install -y bazel
  bazel --version
  echo "Bazel installation completed! Run 'bazel --version' to verify."

else
  echo "Unsupported operating system: $OS"
  exit 1
fi
