cask "agent-terminal" do
  version "0.4.5"
  url "https://github.com/4nuva/homebrew-agent-terminal/releases/download/v#{version}/Agent-Terminal-0.4.5-macos-arm64.zip"
  sha256 "f0d9b424371c5e70d20b1b8e72bac2ba5c0118b8a736672ea6f33e5d0eead616"

  name "Agent Terminal"
  desc "Desktop terminal host for the Agent Terminal mobile companion"
  homepage "https://github.com/4nuva/homebrew-agent-terminal"

  depends_on arch: :arm64
  depends_on macos: :ventura

  auto_updates true
  app "Agent Terminal.app"
  uninstall quit: "com.agentterminal.desktop"

  caveats <<~EOS
    If macOS blocks the first launch, approve Agent Terminal in System Settings > Privacy & Security.
  EOS
end
