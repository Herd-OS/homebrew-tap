class Herd < Formula
  desc "GitHub-native orchestration for agentic development systems"
  homepage "https://github.com/Herd-OS/herd"
  version "0.8.27"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Herd-OS/herd/releases/download/v0.8.27/herd-darwin-arm64"
      sha256 "a1bba9a8c46a2dabc66a3a8c8a2acf0497114b2887e2d3f2f4313a46b3115ce4"
    else
      url "https://github.com/Herd-OS/herd/releases/download/v0.8.27/herd-darwin-amd64"
      sha256 "5b56348028a28d616455a2833116fc8b0bb2f20449b2389093a9137e81d37a4b"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Herd-OS/herd/releases/download/v0.8.27/herd-linux-arm64"
      sha256 "6f94cc65ffdbf609f5935423badb37edc26819db06398f82b89a88ee22563659"
    else
      url "https://github.com/Herd-OS/herd/releases/download/v0.8.27/herd-linux-amd64"
      sha256 "56ea23fe974b5f3c4828eb89923c3653cd602268675896f5124bc4d8ba37bdc6"
    end
  end

  def install
    bin.install Dir["herd-*"].first => "herd"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/herd version")
  end
end
