cask "agent-terminal" do
  version "0.4.0"
  url "https://github.com/4nuva/homebrew-agent-terminal/releases/download/v#{version}/Agent-Terminal-0.4.0-macos-arm64.zip"
  sha256 "d554b294985fd389521b1ec9af5c755d44e9e3e7fe7150720a598c9765570da5"

  name "Agent Terminal"
  desc "Desktop terminal host for the Agent Terminal mobile companion"
  homepage "https://github.com/4nuva/homebrew-agent-terminal"

  depends_on arch: :arm64
  depends_on macos: ">= :ventura"

  app "Agent Terminal.app"
  uninstall quit: "com.agentterminal.desktop"

  caveats <<~EOS
    If macOS blocks the first launch, approve Agent Terminal in System Settings > Privacy & Security.
  EOS
end
