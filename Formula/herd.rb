class Herd < Formula
  desc "GitHub-native orchestration for agentic development systems"
  homepage "https://github.com/Herd-OS/herd"
  version "0.8.34"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Herd-OS/herd/releases/download/v0.8.34/herd-darwin-arm64"
      sha256 "0539863b4765c377ce111c30dd77f9846462f68078ee33f38d367a93996869a4"
    else
      url "https://github.com/Herd-OS/herd/releases/download/v0.8.34/herd-darwin-amd64"
      sha256 "c6dfd1b119fa27b1a7f57e0e1399007e18058ed4ef12675310f9bde76743d9e5"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Herd-OS/herd/releases/download/v0.8.34/herd-linux-arm64"
      sha256 "a2ec3bd5639574f1b44f369f8e5d80e86c71f36ae2a9c04b9b902baedcd9cbeb"
    else
      url "https://github.com/Herd-OS/herd/releases/download/v0.8.34/herd-linux-amd64"
      sha256 "7a91f0c17e60210213af676fb55af6748f3023ec0708159199e77ba83f27b12c"
    end
  end

  def install
    bin.install Dir["herd-*"].first => "herd"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/herd version")
  end
end
