#!/usr/bin/env bash
set -euo pipefail

brew tap 4nuva/agent-terminal
brew trust --cask 4nuva/agent-terminal/agent-terminal
brew install --cask agent-terminal
"/Applications/Agent Terminal.app/Contents/MacOS/agent-terminal" setup
