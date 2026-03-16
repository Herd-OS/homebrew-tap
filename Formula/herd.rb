class Herd < Formula
  desc "GitHub-native orchestration for agentic development systems"
  homepage "https://github.com/Herd-OS/herd"
  version "0.1.0-rc.16"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Herd-OS/herd/releases/download/v0.1.0-rc.16/herd-darwin-arm64"
      sha256 "714b3d1a468b9f45a79ea460ab720528333b302cc2e5b444d8d5e34110628471"
    else
      url "https://github.com/Herd-OS/herd/releases/download/v0.1.0-rc.16/herd-darwin-amd64"
      sha256 "abafb35815b2451c59a0e19f189b42467f0fec4d10d6262485346bb97dd00500"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Herd-OS/herd/releases/download/v0.1.0-rc.16/herd-linux-arm64"
      sha256 "55e31eb8af6d8710764f319fcf45bc9ac89d080d3fe0ea2771b9b77eb835b10e"
    else
      url "https://github.com/Herd-OS/herd/releases/download/v0.1.0-rc.16/herd-linux-amd64"
      sha256 "a22269cdfcaa192bd03700743e8405adbea4ccb0657e934b1d85b3e79850f8dd"
    end
  end

  def install
    bin.install Dir["herd-*"].first => "herd"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/herd version")
  end
end
