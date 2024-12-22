# Buildifier Installation and Setup

**Buildifier** is a tool that formats Bazel `BUILD`, `WORKSPACE`, `.bzl`, and `.sky` files to enforce a consistent style. After installation and setup, these files will be automatically formatted on save within Visual Studio Code.

## Installation

To install Buildifier on macOS/Darwin/Linux, run:

```bash
make install-buildifier
```

## Updating Your Shell Configuration

After installation, you may need to ensure that Buildifier’s installation directory is in your system `PATH`. Add the following line to your shell configuration file (e.g., `~/.zshrc` or `~/.bashrc`):

```bash
echo 'export PATH="/usr/local/bin:$PATH"' >> ~/.zshrc
```

Then, reload your shell configuration:

```bash
source ~/.zshrc
```

If `which buildifier` does not return the expected path, confirm the actual installation directory and adjust accordingly. On Apple Silicon systems, Homebrew often installs binaries into `/opt/homebrew/bin`.

## Integrating with VS Code

1. **Install the Bazel Extension:**  
   In Visual Studio Code, install the official **Bazel** extension. This extension integrates with Bazel and supports file formatting using Buildifier.

2. **Automatic Formatting on Save:**
   Once you have installed the **Bazel Extension:** your `BUILD`, `WORKSPACE`, `.bzl`, and `.sky` files will be automatically formatted by Buildifier every time you save the file. This is based on preconfigured settings in the `.vscode/settings.json` file.

## Verifying Installation

To verify Buildifier is working correctly:

1. Run `which buildifier` in your terminal and ensure it prints a valid path.
2. Open a `WORKSPACE`, `BUILD` OR `.bzl` file in VS Code and make a formatting change.
3. Save the file and confirm that it reverts to the Buildifier style.
