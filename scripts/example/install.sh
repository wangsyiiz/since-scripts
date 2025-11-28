#!/usr/bin/env bash
set -euo pipefail

echo "This is the example install script."
echo "Customize this script as needed for your use case."

# Example: show help option
if [ "${1:-}" = "--help" ] || [ "${1:-}" = "-h" ]; then
  echo "Usage: $0 [--help]"
  echo "  --help, -h    Show this help message"
  exit 0
fi

echo "Example script executed successfully."
