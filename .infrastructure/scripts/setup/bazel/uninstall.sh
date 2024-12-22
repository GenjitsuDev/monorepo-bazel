#!/usr/bin/env bash

set -e # Exit on error

echo "Uninstalling Bazel..."

# Detect the operating system
OS="$(uname -s)"

if [[ "$OS" == "Darwin" ]]; then
  # macOS Uninstallation (Homebrew)
  echo "Detected macOS. Uninstalling Bazel/Bazelisk installed via Homebrew..."

  if command -v brew &>/dev/null; then
    if brew list --formula | grep -q "bazelisk"; then
      echo "Uninstalling Bazelisk..."
      brew uninstall bazelisk
    fi
    if brew list --formula | grep -q "bazel"; then
      echo "Uninstalling Bazel..."
      brew uninstall bazel
    fi
    echo "Bazel has been uninstalled successfully."
  else
    echo "Homebrew is not installed. Nothing to uninstall."
  fi

elif [[ "$OS" == "Linux" ]]; then
  # Linux Uninstallation (APT)
  echo "Detected Linux. Uninstalling Bazel installed via APT..."

  if command -v apt &>/dev/null; then
    echo "Removing Bazel..."
    sudo apt-get remove --purge -y bazel
    sudo rm -f /etc/apt/sources.list.d/bazel.list
    sudo rm -f /usr/share/keyrings/bazel-archive-keyring.gpg

    echo "Updating package lists..."
    sudo apt-get update

    echo "Bazel has been uninstalled successfully."
  else
    echo "APT is not available. Nothing to uninstall."
  fi

else
  echo "Unsupported operating system: $OS"
  exit 1
fi

echo "Uninstallation complete."
