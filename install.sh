#!/usr/bin/env bash
set -euo pipefail

brew tap 4nuva/agent-terminal
brew update
brew trust --cask 4nuva/agent-terminal/agent-terminal
if brew list --cask agent-terminal >/dev/null 2>&1; then
  brew upgrade --cask agent-terminal
else
  brew install --cask agent-terminal
fi
"/Applications/Agent Terminal.app/Contents/MacOS/agent-terminal" setup </dev/tty
