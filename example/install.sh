#!/usr/bin/env bash
set -euo pipefail

# Example script for Linux and macOS
# This script demonstrates cross-platform support

# Show help if requested
if [ "${1:-}" = "--help" ] || [ "${1:-}" = "-h" ]; then
    echo "Usage: $0 [--help]"
    echo "  --help, -h    Show this help message"
    exit 0
fi

OS="$(uname -s)"

case "$OS" in
    Linux*)
        echo "Running on Linux"
        echo "This is an example installation script for Linux."
        ;;
    Darwin*)
        echo "Running on macOS"
        echo "This is an example installation script for macOS."
        ;;
    *)
        echo "Unknown operating system: $OS"
        echo "This script supports Linux and macOS."
        exit 1
        ;;
esac

echo "Example script executed successfully!"
