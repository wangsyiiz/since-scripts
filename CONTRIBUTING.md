Contributing to since-scripts

Thank you for wanting to contribute! Please follow these guidelines to make review and maintenance easier.

1) Adding a new script
- Create a folder under `scripts/` with a short kebab-case name (e.g. `my-tool`).
- Add your script file(s) (e.g. `install.sh`). Use a Unix shebang (#!/usr/bin/env bash or #!/usr/bin/env sh).
- Add a `metadata.yml` file in the same folder with the required fields (see below).

2) metadata.yml (required fields)
- name: Human-friendly name
- version: Semantic version (e.g. 1.0.0)
- description: Short description of what the script does
- author: Your name or handle
- license: e.g. MIT
- entrypoint: Relative path to the main script file (e.g. install.sh)

Example metadata.yml

name: Hello World Installer
version: 0.1.0
description: Example script that prints Hello World
author: wangsyiiz
license: MIT
entrypoint: install.sh

3) Linting / formatting
- We run basic checks on pull requests: shellcheck and shfmt. Please run these locally before opening a PR.

ShellCheck (install via your package manager):

    shellcheck scripts/your-script/install.sh

shfmt (formatting):

    shfmt -w scripts/your-script/*.sh

4) Pull request checklist
- [ ] I added/updated metadata.yml
- [ ] Scripts pass shellcheck (no critical errors)
- [ ] Scripts are formatted with shfmt
- [ ] I added usage instructions and examples if applicable

5) Tests and CI
- This repository runs a PR workflow that will automatically run shellcheck and shfmt checks.

Thanks for contributing!