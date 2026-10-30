cask "agent-terminal" do
  version "0.4.6"
  url "https://github.com/4nuva/homebrew-agent-terminal/releases/download/v#{version}/Agent-Terminal-0.4.6-macos-arm64.zip"
  sha256 "fd19ffef9367dc39cb1f635a955120f04a3d034d3487b654987f85824bba31d6"

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
