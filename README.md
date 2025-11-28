# since-scripts

A collection of small shell scripts and utilities maintained by wangsyiiz.

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](LICENSE)

## Overview

This repository collects useful scripts and tooling for quick tasks. Each script
should include a metadata file and basic usage instructions.

## Release tags

Automated releases are created on push to `main`. Tag format: `YYYY.MM.DD.NUMBER` — e.g. `2025.11.26.123`.

## Branch Protection Setup

If you have enabled branch protection on the `main` branch, the automated workflows (`update-index.yml`, `pages.yml`) need additional configuration to push changes:

### Option 1: Personal Access Token (PAT) - Recommended

1. Create a Personal Access Token (classic) with `repo` scope:
   - Go to GitHub → Settings → Developer settings → Personal access tokens → Tokens (classic)
   - Click "Generate new token (classic)"
   - Select `repo` scope (full control of private repositories)
   - Copy the generated token

2. Add the token as a repository secret:
   - Go to your repository → Settings → Secrets and variables → Actions
   - Click "New repository secret"
   - Name: `REPO_PAT`
   - Value: paste your PAT

3. Ensure the PAT owner has permission to bypass branch protection rules:
   - Go to repository → Settings → Branches → Branch protection rules
   - Edit the `main` branch rule
   - Under "Allow specified actors to bypass required pull requests", add the PAT owner

### Option 2: GitHub App

Create a GitHub App with `Contents: write` permission and use its installation token instead of PAT.

### Option 3: Branch Protection Bypass Rule

Add GitHub Actions to the bypass list in branch protection settings (requires admin access).

## Contributing

See CONTRIBUTING.md for contribution guidelines. Pull requests are preferred.

## License

This project is licensed under the MIT License — see the LICENSE file for details.
