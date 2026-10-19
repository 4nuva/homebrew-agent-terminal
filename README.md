# Agent Terminal Homebrew Tap

This public Homebrew tap installs Agent Terminal on macOS 13 and later.

```sh
brew tap 4nuva/agent-terminal
brew trust --cask 4nuva/agent-terminal/agent-terminal
brew install --cask agent-terminal
open -a "Agent Terminal" --args setup
```

Upgrade with `brew upgrade --cask agent-terminal`.

The Cask and versioned app archives are published here. The DMG is uploaded to
Cloudflare R2 and served at
`https://downloads.4nuva.dev/agent-terminal/Agent-Terminal-macOS-<arch>.dmg`.
