class Herd < Formula
  desc "GitHub-native orchestration for agentic development systems"
  homepage "https://github.com/Herd-OS/herd"
  version "0.6.8"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Herd-OS/herd/releases/download/v0.6.8/herd-darwin-arm64"
      sha256 "0e95f625c52a15fbb570fa5d58a0d4a01c240e9b2d063076ce59ad75ca645f35"
    else
      url "https://github.com/Herd-OS/herd/releases/download/v0.6.8/herd-darwin-amd64"
      sha256 "f2fffc567ecd208271ecc43308bd2602e7c9e0b3994bb7d76b4ef62d0bc3021c"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Herd-OS/herd/releases/download/v0.6.8/herd-linux-arm64"
      sha256 "647c545a375f25267583a5f402199f40825391d033176a3e7f1b97514d268a8e"
    else
      url "https://github.com/Herd-OS/herd/releases/download/v0.6.8/herd-linux-amd64"
      sha256 "953684c6e00fb79b400fc68b6cdfb3ce04f58f2659575ee96ae006a640b5b5e0"
    end
  end

  def install
    bin.install Dir["herd-*"].first => "herd"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/herd version")
  end
end
