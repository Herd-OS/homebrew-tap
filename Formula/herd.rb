class Herd < Formula
  desc "GitHub-native orchestration for agentic development systems"
  homepage "https://github.com/Herd-OS/herd"
  version "0.2.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Herd-OS/herd/releases/download/v0.2.2/herd-darwin-arm64"
      sha256 "87c3c7ba4616e40bf6de7f6a3865245e5ca1bab32797d58b97ad28b92a34db17"
    else
      url "https://github.com/Herd-OS/herd/releases/download/v0.2.2/herd-darwin-amd64"
      sha256 "ba7fe69e33f3401a7cabe4e20f040149e9ae9a54f392c1bd275dd05f706463bd"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Herd-OS/herd/releases/download/v0.2.2/herd-linux-arm64"
      sha256 "538f54dea62b9172b72215b3b646bbecbd822835c58a779e9e1cfcf2f611e721"
    else
      url "https://github.com/Herd-OS/herd/releases/download/v0.2.2/herd-linux-amd64"
      sha256 "4920a993621c08ddfb1fc7213b86816615b2c39e070dfac03d09948a4c070360"
    end
  end

  def install
    bin.install Dir["herd-*"].first => "herd"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/herd version")
  end
end
