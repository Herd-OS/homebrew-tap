class Herd < Formula
  desc "GitHub-native orchestration for agentic development systems"
  homepage "https://github.com/Herd-OS/herd"
  version "0.2.0-rc.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Herd-OS/herd/releases/download/v0.2.0-rc.2/herd-darwin-arm64"
      sha256 "cacbde77f817a19213318f1e2220e30e8c2753f4534d6841f18786bde64e613a"
    else
      url "https://github.com/Herd-OS/herd/releases/download/v0.2.0-rc.2/herd-darwin-amd64"
      sha256 "f2369fd8c2a6fecd4cb89c27de7dad5b497cafe9d642f4efd326f665931fa266"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Herd-OS/herd/releases/download/v0.2.0-rc.2/herd-linux-arm64"
      sha256 "41b092bd842a716c2ceef9dea1a003e156d1d5fbae542d04c4b5e7c4cf8a7fb9"
    else
      url "https://github.com/Herd-OS/herd/releases/download/v0.2.0-rc.2/herd-linux-amd64"
      sha256 "6e27ea99426ab81ad2d2d3c01616d8a8b26bb7c2d1b232a29ae2b1b0b96bd757"
    end
  end

  def install
    bin.install Dir["herd-*"].first => "herd"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/herd version")
  end
end
