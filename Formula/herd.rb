class Herd < Formula
  desc "GitHub-native orchestration for agentic development systems"
  homepage "https://github.com/Herd-OS/herd"
  version "0.8.29"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Herd-OS/herd/releases/download/v0.8.29/herd-darwin-arm64"
      sha256 "918fa2c41428f26824506c2ddd59f97ad2e0e95604c2b3602f3ba4262f16e1fe"
    else
      url "https://github.com/Herd-OS/herd/releases/download/v0.8.29/herd-darwin-amd64"
      sha256 "1ba7a14aa4507603360626584a5778f78261886ef6fdb081832d3d463e0f01ee"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Herd-OS/herd/releases/download/v0.8.29/herd-linux-arm64"
      sha256 "8df200d2d21a1c1fcebd509228ab5829355a39fd09fb65ee98ec438e4dcb21fc"
    else
      url "https://github.com/Herd-OS/herd/releases/download/v0.8.29/herd-linux-amd64"
      sha256 "c3d8fdc7f0a2f059db05a13d82f325dc3982516a9494dc262fcf0fac1c613984"
    end
  end

  def install
    bin.install Dir["herd-*"].first => "herd"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/herd version")
  end
end
