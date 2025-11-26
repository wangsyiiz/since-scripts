#!/usr/bin/env bash

set -euo pipefail

echo "Hello from since-scripts example!"

# Example: simulate an install action
if [ "$1" = "--help" ] || [ "$1" = "-h" ]; then
  echo "Usage: $0 [name]"
  exit 0
fi

name=${1:-world}

echo "Installing for: $name"

echo "Done."
