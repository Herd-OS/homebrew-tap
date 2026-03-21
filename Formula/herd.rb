class Herd < Formula
  desc "GitHub-native orchestration for agentic development systems"
  homepage "https://github.com/Herd-OS/herd"
  version "0.2.3"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Herd-OS/herd/releases/download/v0.2.3/herd-darwin-arm64"
      sha256 "2a152cf4aba7cd14ba59eb0876634056bf381792ce947f54c8136b0919740ec0"
    else
      url "https://github.com/Herd-OS/herd/releases/download/v0.2.3/herd-darwin-amd64"
      sha256 "8f8cdf362889dcaba17d7c25193f8d0cf4c1206382adba723e762f952dbef3fe"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Herd-OS/herd/releases/download/v0.2.3/herd-linux-arm64"
      sha256 "dd3b446dac2390fff89ed10555ca70a8bfec575abb3694fb3933e00456633546"
    else
      url "https://github.com/Herd-OS/herd/releases/download/v0.2.3/herd-linux-amd64"
      sha256 "d76ecb769ccf726cbbe0fbb80cb133cedcd7d61e388347f6d7bb251d12ec0765"
    end
  end

  def install
    bin.install Dir["herd-*"].first => "herd"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/herd version")
  end
end
