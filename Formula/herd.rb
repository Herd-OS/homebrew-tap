class Herd < Formula
  desc "GitHub-native orchestration for agentic development systems"
  homepage "https://github.com/Herd-OS/herd"
  version "0.1.0-rc.21"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Herd-OS/herd/releases/download/v0.1.0-rc.21/herd-darwin-arm64"
      sha256 "5f5dfd626ab2efece0f1d615d7d267f00af40fde111c8d77c453406aee8d0454"
    else
      url "https://github.com/Herd-OS/herd/releases/download/v0.1.0-rc.21/herd-darwin-amd64"
      sha256 "801deb3f59362c588416a6f8b042af38d90a044e1e7f766391d96378dde0ca9e"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Herd-OS/herd/releases/download/v0.1.0-rc.21/herd-linux-arm64"
      sha256 "c1a9472ea8ff401403a17349f9f79998ecd8018e36bf1db0c9a15e86e6d12d71"
    else
      url "https://github.com/Herd-OS/herd/releases/download/v0.1.0-rc.21/herd-linux-amd64"
      sha256 "56b0806d17fa4d2979c77b26fccc4d72797602b1b7d8ef75328c6ae9bc6c656e"
    end
  end

  def install
    bin.install Dir["herd-*"].first => "herd"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/herd version")
  end
end
