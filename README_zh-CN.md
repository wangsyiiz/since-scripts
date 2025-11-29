# Since Scripts

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](LICENSE)
[![GitHub Pages](https://img.shields.io/badge/GitHub-Pages-blue)](https://wangsyiiz.github.io/since-scripts/)

一个精心整理的跨平台 Shell 脚本和实用工具集合，用于快速自动化任务。通过我们的[网页界面](https://wangsyiiz.github.io/since-scripts/)浏览和发现脚本。

🌐 **中文** | **[English](README.md)**

## 📖 目录

- [概述](#概述)
- [特性](#特性)
- [使用方法](#使用方法)
  - [网页界面](#网页界面)
  - [命令行](#命令行)
- [项目结构](#项目结构)
- [贡献指南](#贡献指南)
  - [如何贡献](#如何贡献)
  - [脚本要求](#脚本要求)
  - [Pull Request 规范](#pull-request-规范)
- [发布标签](#发布标签)
- [许可证](#许可证)

## 概述

本仓库是由 [wangsyiiz](https://github.com/wangsyiiz) 维护的实用脚本和工具集合。每个脚本都具有以下特点：

- **跨平台**：支持 Linux、macOS 和 Windows（如适用）
- **独立运行**：易于下载和运行，依赖最小化
- **文档完善**：每个脚本都包含使用说明和元数据

## 特性

- 🔍 **基于网页的搜索界面**，方便发现脚本
- 📦 **一行命令安装**，通过 curl、wget 或 PowerShell
- 🔄 **自动化 CI/CD**，用于验证和发布
- 📋 **结构化元数据**，每个脚本包含名称、描述、版本、作者信息
- 🖥️ **跨平台支持**（Linux、macOS、Windows）

## 使用方法

### 网页界面

访问 [Since Scripts 网站](https://wangsyiiz.github.io/since-scripts/) 浏览、搜索并复制任意脚本的安装命令。

### 命令行

每个脚本都可以直接从命令行执行：

#### Linux / macOS（使用 curl）

```bash
curl -sSL https://wangsyiiz.github.io/since-scripts/example/install.sh | bash
```

#### Linux / macOS（使用 wget）

```bash
wget -qO- https://wangsyiiz.github.io/since-scripts/example/install.sh | bash
```

#### Windows（PowerShell）

```powershell
powershell -NoProfile -ExecutionPolicy Bypass -Command "iex (New-Object Net.WebClient).DownloadString('https://wangsyiiz.github.io/since-scripts/example/install.ps1')"
```

#### Windows（pwsh - PowerShell Core）

```powershell
pwsh -c "iwr -useb https://wangsyiiz.github.io/since-scripts/example/install.ps1 | iex"
```

## 项目结构

```
since-scripts/
├── scripts/                    # 所有脚本存放目录
│   └── <script-name>/          # 每个脚本有独立的目录
│       ├── meta.yml            # 必需：脚本元数据
│       ├── install.sh          # Linux/macOS 安装脚本
│       ├── install.ps1         # Windows PowerShell 脚本
│       └── README.md           # 可选：详细文档
├── tools/                      # 内部工具
│   └── indexer/                # 脚本索引生成器
├── scripts.json                # 自动生成的脚本索引
├── index.html                  # 网页界面
├── CONTRIBUTING.md             # 贡献指南
└── README.md                   # 本文件
```

## 贡献指南

我们欢迎贡献！请在提交脚本前阅读以下指南。

### 如何贡献

1. **Fork** 本仓库
2. **创建功能分支**：
   ```bash
   git checkout -b feature/my-new-script
   ```
3. **添加脚本**，遵循[脚本要求](#脚本要求)
4. **本地测试**，确保一切正常：
   ```bash
   # 检查 shell 脚本
   shellcheck scripts/my-script/install.sh
   
   # 格式化 shell 脚本
   shfmt -w -i 2 scripts/my-script/install.sh
   ```
5. **提交 Pull Request**，遵循 [PR 规范](#pull-request-规范)

### 脚本要求

每个脚本必须包含以下内容：

#### 1. 目录结构

在 `scripts/` 下创建以脚本名称命名的新目录：

```
scripts/my-script/
├── meta.yml       # 必需
├── install.sh     # Linux/macOS 必需
├── install.ps1    # Windows 必需（如支持 Windows）
└── README.md      # 推荐
```

#### 2. 元数据文件（`meta.yml`）

每个脚本**必须**包含 `meta.yml` 文件，包含以下字段：

```yaml
name: 脚本名称
version: 1.0.0
description: 脚本功能的简要描述
author: your-github-username
license: MIT
platforms:
  - linux
  - macOS
  - windows
```

#### 3. Shell 脚本（`install.sh`）

Shell 脚本应该：

- 以 `#!/usr/bin/env bash` 开头
- 使用 `set -euo pipefail` 进行严格的错误处理
- 包含简要的注释头，说明脚本用途
- 支持 `--help` 或 `-h` 参数显示使用帮助
- 尽可能兼容 POSIX 以获得最大可移植性

示例：

```bash
#!/usr/bin/env bash
set -euo pipefail

# My Script - 简要描述
# 作者: your-github-username
# 许可证: MIT

# 显示帮助信息
if [ "${1:-}" = "--help" ] || [ "${1:-}" = "-h" ]; then
    echo "用法: $0 [选项]"
    echo "  --help, -h    显示帮助信息"
    exit 0
fi

# 脚本逻辑
echo "Hello from my script!"
```

#### 4. PowerShell 脚本（`install.ps1`）

PowerShell 脚本应该：

- 包含注释头说明脚本用途
- 适当处理错误
- 遵循 PowerShell 最佳实践

示例：

```powershell
# My Script - 简要描述
# 作者: your-github-username
# 许可证: MIT

Write-Host "Hello from my script!"
```

#### 5. README.md（推荐）

在脚本目录中包含 `README.md`，内容包括：

- 脚本功能描述
- 支持的平台
- 使用说明
- 前置条件或依赖项
- 使用示例

### Pull Request 规范

提交 PR 前，请确保：

- [ ] 代码在本地可以构建和运行
- [ ] Shell 脚本通过 `shellcheck` 检查，无重大警告
- [ ] Shell 脚本使用 `shfmt -w -i 2` 格式化
- [ ] PowerShell 脚本通过 `Invoke-ScriptAnalyzer` 检查，无错误或警告
- [ ] 新脚本包含 `meta.yml` 文件及所有必需字段
- [ ] 新脚本包含使用示例和文档
- [ ] PR 描述清楚说明脚本的功能

#### PR 检查清单模板

创建 PR 时，请使用以下检查清单：

```markdown
## 描述
脚本及其用途的简要描述。

## 检查清单
- [ ] 添加了包含所有必需字段的 `meta.yml`
- [ ] 添加了 `install.sh` 支持 Linux/macOS
- [ ] 添加了 `install.ps1` 支持 Windows（如适用）
- [ ] 添加了包含使用说明的 `README.md`
- [ ] 在目标平台上测试通过
- [ ] 脚本通过 shellcheck/PSScriptAnalyzer 检查
- [ ] 脚本格式正确
```

## 发布标签

推送到 `main` 分支时会自动创建发布。标签格式为：`YYYY.MM.DD.NUMBER`

示例：`2025.11.26.123`

## 许可证

本项目采用 MIT 许可证 - 详见 [LICENSE](LICENSE) 文件。

---

**有问题？** 请创建 [Issue](https://github.com/wangsyiiz/since-scripts/issues) 讨论较大的改动或提问。
