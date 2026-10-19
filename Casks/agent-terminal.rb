cask "agent-terminal" do
  version "0.4.1"
  url "https://github.com/4nuva/homebrew-agent-terminal/releases/download/v#{version}/Agent-Terminal-0.4.1-macos-arm64.zip"
  sha256 "f5478b307971b86d3868fb3d42bba2eb51a3f81fae0db148389399b29bda15fc"

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
