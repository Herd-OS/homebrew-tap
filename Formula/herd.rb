class Herd < Formula
  desc "GitHub-native orchestration for agentic development systems"
  homepage "https://github.com/Herd-OS/herd"
  version "0.6.4"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Herd-OS/herd/releases/download/v0.6.4/herd-darwin-arm64"
      sha256 "222e5414c3018b3e5ee8c7ef87e8a2c4413e13e9b902adcba65cd6fa805e3c5f"
    else
      url "https://github.com/Herd-OS/herd/releases/download/v0.6.4/herd-darwin-amd64"
      sha256 "dc58b8e044fba7f08301fd8bde686df4720d12411d855631845bebe13fb7e62f"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Herd-OS/herd/releases/download/v0.6.4/herd-linux-arm64"
      sha256 "43b9f9f769bb8aea2d15de150bd82b9995736009f27c9a254e46cf2cf8b089b3"
    else
      url "https://github.com/Herd-OS/herd/releases/download/v0.6.4/herd-linux-amd64"
      sha256 "95f046f928020f291d40ebb8e6fb3353c35576f95e803fed1de615aacd9668e7"
    end
  end

  def install
    bin.install Dir["herd-*"].first => "herd"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/herd version")
  end
end
