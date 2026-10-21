cask "agent-terminal" do
  version "0.4.3"
  url "https://github.com/4nuva/homebrew-agent-terminal/releases/download/v#{version}/Agent-Terminal-0.4.3-macos-arm64.zip"
  sha256 "bb5f38e82042fc183b9bb6a7957101909ce19571615ad704a17c3682f40f61ad"

  name "Agent Terminal"
  desc "Desktop terminal host for the Agent Terminal mobile companion"
  homepage "https://github.com/4nuva/homebrew-agent-terminal"

  depends_on arch: :arm64
  depends_on macos: :ventura

  app "Agent Terminal.app"
  uninstall quit: "com.agentterminal.desktop"

  caveats <<~EOS
    If macOS blocks the first launch, approve Agent Terminal in System Settings > Privacy & Security.
  EOS
end
