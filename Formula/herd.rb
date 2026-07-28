class Herd < Formula
  desc "GitHub-native orchestration for agentic development systems"
  homepage "https://github.com/Herd-OS/herd"
  version "0.8.31"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Herd-OS/herd/releases/download/v0.8.31/herd-darwin-arm64"
      sha256 "031d740802f7767494f1749ede7b6327d5e4096ca85305acee7f3381d4bdd05d"
    else
      url "https://github.com/Herd-OS/herd/releases/download/v0.8.31/herd-darwin-amd64"
      sha256 "510ba644166b712dd954d2f4f48fa5c86062ac9dddef0ade6cd2e91101c1d872"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Herd-OS/herd/releases/download/v0.8.31/herd-linux-arm64"
      sha256 "e3c2cf852ea0d8439693c803c9f909e7bcf68fa622d9f046e2c7fc088a42db6c"
    else
      url "https://github.com/Herd-OS/herd/releases/download/v0.8.31/herd-linux-amd64"
      sha256 "4cd5aeb8bb3999ec6bd202d227aa1901728ca4a24b5b08812b78ec75a187a99b"
    end
  end

  def install
    bin.install Dir["herd-*"].first => "herd"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/herd version")
  end
end
