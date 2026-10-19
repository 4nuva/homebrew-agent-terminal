# Agent Terminal installers

Install Agent Terminal and run its setup from your terminal.

## macOS

```sh
curl -fsSL https://raw.githubusercontent.com/4nuva/homebrew-agent-terminal/main/install.sh | bash
```

The script taps this repository, trusts and installs the Cask, then runs setup.
Upgrade later with `brew upgrade --cask agent-terminal`.

## Windows

```powershell
irm https://raw.githubusercontent.com/4nuva/homebrew-agent-terminal/main/install.ps1 | iex
```

The script installs for the current user under
`%LOCALAPPDATA%\Programs\Agent Terminal` by default. To choose another install
folder, set it before running the command:

```powershell
$env:AGENT_TERMINAL_INSTALL_DIR = 'D:\Programs\Agent Terminal'
irm https://raw.githubusercontent.com/4nuva/homebrew-agent-terminal/main/install.ps1 | iex
```

Setup runs from the selected folder. Installing under a protected folder such
as Program Files may require an elevated PowerShell window.

The Cask and versioned macOS app archives are published here. The DMG is hosted
at
`https://downloads.4nuva.dev/agent-terminal/Agent-Terminal-macOS-<arch>.dmg`.
