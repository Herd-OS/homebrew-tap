class Herd < Formula
  desc "GitHub-native orchestration for agentic development systems"
  homepage "https://github.com/Herd-OS/herd"
  version "0.5.5"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Herd-OS/herd/releases/download/v0.5.5/herd-darwin-arm64"
      sha256 "85a6e80dbd61e6d3caa11746113d5e77733a5bbe625581f57b6162fbba9e577f"
    else
      url "https://github.com/Herd-OS/herd/releases/download/v0.5.5/herd-darwin-amd64"
      sha256 "cf148aa918d156e0ec3ba312dee7b9861940aea005ea1ddea2d30b2461b59584"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Herd-OS/herd/releases/download/v0.5.5/herd-linux-arm64"
      sha256 "e100f77d9d542ac5426bc7338477bfc46c02de3b92c711d5b0f2954a06731583"
    else
      url "https://github.com/Herd-OS/herd/releases/download/v0.5.5/herd-linux-amd64"
      sha256 "e9ae78e97a16c19a16de37176eb9ea59432403fe43ca7c46c2177ca9f96d93bb"
    end
  end

  def install
    bin.install Dir["herd-*"].first => "herd"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/herd version")
  end
end
