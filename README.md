# Since Scripts

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](LICENSE)
[![GitHub Pages](https://img.shields.io/badge/GitHub-Pages-blue)](https://wangsyiiz.github.io/since-scripts/)

A curated collection of cross-platform shell scripts and utilities for quick automation tasks. Browse and discover scripts via our [web interface](https://wangsyiiz.github.io/since-scripts/).

🌐 **[中文文档](README_zh-CN.md)** | **English**

## 📖 Table of Contents

- [Overview](#overview)
- [Features](#features)
- [Usage](#usage)
  - [Web Interface](#web-interface)
  - [Command Line](#command-line)
- [Project Structure](#project-structure)
- [Contributing](#contributing)
  - [How to Contribute](#how-to-contribute)
  - [Script Requirements](#script-requirements)
  - [Pull Request Guidelines](#pull-request-guidelines)
- [Release Tags](#release-tags)
- [License](#license)

## Overview

This repository is a collection of useful scripts and utilities maintained by [wangsyiiz](https://github.com/wangsyiiz). Each script is designed to be:

- **Cross-platform**: Supporting Linux, macOS, and Windows where applicable
- **Self-contained**: Easy to download and run with minimal dependencies
- **Well-documented**: Each script includes usage instructions and metadata

## Features

- 🔍 **Web-based search interface** for discovering scripts
- 📦 **One-liner installation** via curl, wget, or PowerShell
- 🔄 **Automated CI/CD** for validation and releases
- 📋 **Structured metadata** for each script (name, description, version, author)
- 🖥️ **Cross-platform support** (Linux, macOS, Windows)

## Usage

### Web Interface

Visit the [Since Scripts website](https://wangsyiiz.github.io/since-scripts/) to browse, search, and copy installation commands for any script.

### Command Line

Each script can be executed directly from the command line:

#### Linux / macOS (using curl)

```bash
curl -sSL https://wangsyiiz.github.io/since-scripts/example/install.sh | bash
```

#### Linux / macOS (using wget)

```bash
wget -qO- https://wangsyiiz.github.io/since-scripts/example/install.sh | bash
```

#### Windows (PowerShell)

```powershell
powershell -NoProfile -ExecutionPolicy Bypass -Command "iex (New-Object Net.WebClient).DownloadString('https://wangsyiiz.github.io/since-scripts/example/install.ps1')"
```

#### Windows (pwsh - PowerShell Core)

```powershell
pwsh -c "iwr -useb https://wangsyiiz.github.io/since-scripts/example/install.ps1 | iex"
```

## Project Structure

```
since-scripts/
├── scripts/                    # All scripts are stored here
│   └── <script-name>/          # Each script has its own directory
│       ├── meta.yml            # Required: Script metadata
│       ├── install.sh          # Linux/macOS installation script
│       ├── install.ps1         # Windows PowerShell script
│       └── README.md           # Optional: Detailed documentation
├── tools/                      # Internal tooling
│   └── indexer/                # Script index generator
├── scripts.json                # Auto-generated script index
├── index.html                  # Web interface
├── CONTRIBUTING.md             # Contribution guidelines
└── README.md                   # This file
```

## Contributing

We welcome contributions! Please read the guidelines below before submitting your scripts.

### How to Contribute

1. **Fork** the repository
2. **Create a feature branch** for your changes:
   ```bash
   git checkout -b feature/my-new-script
   ```
3. **Add your script** following the [Script Requirements](#script-requirements)
4. **Test locally** to ensure everything works:
   ```bash
   # Lint shell scripts
   shellcheck scripts/my-script/install.sh
   
   # Format shell scripts
   shfmt -w -i 2 scripts/my-script/install.sh
   ```
5. **Submit a Pull Request** following the [PR Guidelines](#pull-request-guidelines)

### Script Requirements

Each script must include the following:

#### 1. Directory Structure

Create a new directory under `scripts/` with your script name:

```
scripts/my-script/
├── meta.yml       # Required
├── install.sh     # Required for Linux/macOS
├── install.ps1    # Required for Windows (if supporting Windows)
└── README.md      # Recommended
```

#### 2. Metadata File (`meta.yml`)

Every script **must** include a `meta.yml` file with the following fields:

```yaml
name: My Script Name
version: 1.0.0
description: A brief description of what the script does
author: your-github-username
license: MIT
platforms:
  - linux
  - macOS
  - windows
```

#### 3. Shell Script (`install.sh`)

Shell scripts should:

- Start with `#!/usr/bin/env bash`
- Use `set -euo pipefail` for strict error handling
- Include a brief comment header explaining the script's purpose
- Support `--help` or `-h` flags for usage information
- Be POSIX-compatible where possible for maximum portability

Example:

```bash
#!/usr/bin/env bash
set -euo pipefail

# My Script - A brief description
# Author: your-github-username
# License: MIT

# Show help if requested
if [ "${1:-}" = "--help" ] || [ "${1:-}" = "-h" ]; then
    echo "Usage: $0 [options]"
    echo "  --help, -h    Show this help message"
    exit 0
fi

# Your script logic here
echo "Hello from my script!"
```

#### 4. PowerShell Script (`install.ps1`)

PowerShell scripts should:

- Include a comment header explaining the script's purpose
- Handle errors appropriately
- Follow PowerShell best practices

Example:

```powershell
# My Script - A brief description
# Author: your-github-username
# License: MIT

Write-Host "Hello from my script!"
```

#### 5. README.md (Recommended)

Include a `README.md` in your script directory with:

- Description of what the script does
- Supported platforms
- Usage instructions
- Any prerequisites or dependencies
- Examples

### Pull Request Guidelines

Before submitting a PR, ensure:

- [ ] Your code builds and runs locally
- [ ] Shell scripts pass `shellcheck` with no major warnings
- [ ] Shell scripts are formatted with `shfmt -w -i 2`
- [ ] PowerShell scripts pass `Invoke-ScriptAnalyzer` with no errors or warnings
- [ ] New scripts include a `meta.yml` file with all required fields
- [ ] New scripts include usage examples and documentation
- [ ] The PR description clearly explains what the script does

#### PR Checklist Template

When creating a PR, please use the following checklist:

```markdown
## Description
Brief description of the script and its purpose.

## Checklist
- [ ] Added `meta.yml` with all required fields
- [ ] Added `install.sh` for Linux/macOS support
- [ ] Added `install.ps1` for Windows support (if applicable)
- [ ] Added `README.md` with usage instructions
- [ ] Tested on target platforms
- [ ] Scripts pass shellcheck/PSScriptAnalyzer
- [ ] Scripts are properly formatted
```

## Release Tags

Automated releases are created on push to `main`. The tag format follows: `YYYY.MM.DD.NUMBER`

Example: `2025.11.26.123`

## License

This project is licensed under the MIT License — see the [LICENSE](LICENSE) file for details.

---

**Questions or Issues?** Open an [issue](https://github.com/wangsyiiz/since-scripts/issues) to discuss larger changes or ask questions.
