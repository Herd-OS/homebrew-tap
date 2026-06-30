class Herd < Formula
  desc "GitHub-native orchestration for agentic development systems"
  homepage "https://github.com/Herd-OS/herd"
  version "0.8.20"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Herd-OS/herd/releases/download/v0.8.20/herd-darwin-arm64"
      sha256 "765510395942d93b43a462fe1c17335272112c418e95fb100cf801257217598e"
    else
      url "https://github.com/Herd-OS/herd/releases/download/v0.8.20/herd-darwin-amd64"
      sha256 "2aeaae818e41169b6d35f05eb73cef7b84baafae5fbc92ee1bfacb1c3d5da0a8"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Herd-OS/herd/releases/download/v0.8.20/herd-linux-arm64"
      sha256 "cdc4777909395967760e18096088db53225a07afa8e76e69d9909ba1c8cafeb9"
    else
      url "https://github.com/Herd-OS/herd/releases/download/v0.8.20/herd-linux-amd64"
      sha256 "d71dd0f05d2bd273c789053b9c75210620c88cc7fdd9e7b642f8826245bea093"
    end
  end

  def install
    bin.install Dir["herd-*"].first => "herd"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/herd version")
  end
end
