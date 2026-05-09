class Herd < Formula
  desc "GitHub-native orchestration for agentic development systems"
  homepage "https://github.com/Herd-OS/herd"
  version "0.6.5"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Herd-OS/herd/releases/download/v0.6.5/herd-darwin-arm64"
      sha256 "79bdb0637bf3ae2154e55a91488d2c322e3b2e408550e1fdcf8e54eb2265656c"
    else
      url "https://github.com/Herd-OS/herd/releases/download/v0.6.5/herd-darwin-amd64"
      sha256 "82ac75648bda1ca59074244daa451fe90e78054956be348a6c5de9323eaf62f3"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Herd-OS/herd/releases/download/v0.6.5/herd-linux-arm64"
      sha256 "9cc16e4ea64154a2205c9d433035a2065cce670e1b0de336264e90c448e48f8c"
    else
      url "https://github.com/Herd-OS/herd/releases/download/v0.6.5/herd-linux-amd64"
      sha256 "de556e41ad12f0461543d09db43b99bfb23c1a6e07015c4b7af3182c0f996276"
    end
  end

  def install
    bin.install Dir["herd-*"].first => "herd"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/herd version")
  end
end
