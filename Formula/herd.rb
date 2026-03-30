class Herd < Formula
  desc "GitHub-native orchestration for agentic development systems"
  homepage "https://github.com/Herd-OS/herd"
  version "0.2.9"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Herd-OS/herd/releases/download/v0.2.9/herd-darwin-arm64"
      sha256 "54166e79ed45f621d9d3ab7d4e69207a5c8d165aad87c3eda7bd4493e4006a64"
    else
      url "https://github.com/Herd-OS/herd/releases/download/v0.2.9/herd-darwin-amd64"
      sha256 "5a203609eb1096d7abede2b704b9ee37f9dc075bf802435cfa76225800260cfd"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Herd-OS/herd/releases/download/v0.2.9/herd-linux-arm64"
      sha256 "3abd24c61c9de8da4f08fc3b6a4325826e9ed6acaa30743ef483ac26ccb70715"
    else
      url "https://github.com/Herd-OS/herd/releases/download/v0.2.9/herd-linux-amd64"
      sha256 "4d13c08f6672a62d09b57b65beebffe4fe93908fe9143cf216ccfc3b05be78f8"
    end
  end

  def install
    bin.install Dir["herd-*"].first => "herd"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/herd version")
  end
end
