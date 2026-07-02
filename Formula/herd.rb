class Herd < Formula
  desc "GitHub-native orchestration for agentic development systems"
  homepage "https://github.com/Herd-OS/herd"
  version "0.8.25"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Herd-OS/herd/releases/download/v0.8.25/herd-darwin-arm64"
      sha256 "0dcc853cb3bbea98b85396eb4b1d118dbfc529e8a876a44e92602d9424812849"
    else
      url "https://github.com/Herd-OS/herd/releases/download/v0.8.25/herd-darwin-amd64"
      sha256 "347871d80d7cdf1d379f2d0e861629bb418e9ed646294f2c6b4c0a5267328699"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Herd-OS/herd/releases/download/v0.8.25/herd-linux-arm64"
      sha256 "bababe1f7f4a3212edcd6d59a4c6d59af9642fa28f349c6044306b87aff5a9d6"
    else
      url "https://github.com/Herd-OS/herd/releases/download/v0.8.25/herd-linux-amd64"
      sha256 "5e7aa17f7d9bd1ebe92e1a8962f1a964d0d93ae9ce1740bd998ba30833956d1d"
    end
  end

  def install
    bin.install Dir["herd-*"].first => "herd"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/herd version")
  end
end
