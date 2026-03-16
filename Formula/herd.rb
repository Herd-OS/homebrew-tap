class Herd < Formula
  desc "GitHub-native orchestration for agentic development systems"
  homepage "https://github.com/Herd-OS/herd"
  version "0.1.0-rc.24"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Herd-OS/herd/releases/download/v0.1.0-rc.24/herd-darwin-arm64"
      sha256 "7e50435ff8789383253f82ad0fce1b3d5eb96a5e5cc03edad6530114432da5fd"
    else
      url "https://github.com/Herd-OS/herd/releases/download/v0.1.0-rc.24/herd-darwin-amd64"
      sha256 "2ca0942deb9b5e5401745d20b8b5faee02af9d16dd6964887ee22a5b28ab42f0"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Herd-OS/herd/releases/download/v0.1.0-rc.24/herd-linux-arm64"
      sha256 "dce540446bee718e672fe93d61e75cc92989c77515caa355527e20dbd965c120"
    else
      url "https://github.com/Herd-OS/herd/releases/download/v0.1.0-rc.24/herd-linux-amd64"
      sha256 "25bb65420199eeefd9195745bdebf0d37640db3788a5db8f3cebfba8a2c0b241"
    end
  end

  def install
    bin.install Dir["herd-*"].first => "herd"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/herd version")
  end
end
