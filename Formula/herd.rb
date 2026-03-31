class Herd < Formula
  desc "GitHub-native orchestration for agentic development systems"
  homepage "https://github.com/Herd-OS/herd"
  version "0.2.12"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Herd-OS/herd/releases/download/v0.2.12/herd-darwin-arm64"
      sha256 "f1d034de2a20c165f0bcbb1db69ad49dafd98869a4ba70de35e737bb48968148"
    else
      url "https://github.com/Herd-OS/herd/releases/download/v0.2.12/herd-darwin-amd64"
      sha256 "59f67ca8c2e747b14b51c3a06fc621653dd285045afc2584bd3e3466fbde948e"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Herd-OS/herd/releases/download/v0.2.12/herd-linux-arm64"
      sha256 "793deb15720601b08b716ce2dbed50893f3b4f964d3bff879a99d8cced0788b4"
    else
      url "https://github.com/Herd-OS/herd/releases/download/v0.2.12/herd-linux-amd64"
      sha256 "0a5c318d175ca6ffacf3fc6be0677634146a94549f0d01de38435e91e4a8bcd2"
    end
  end

  def install
    bin.install Dir["herd-*"].first => "herd"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/herd version")
  end
end
