class Herd < Formula
  desc "GitHub-native orchestration for agentic development systems"
  homepage "https://github.com/Herd-OS/herd"
  version "0.1.0-rc.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Herd-OS/herd/releases/download/v0.1.0-rc.2/herd-darwin-arm64"
      sha256 "e99f6891723a47a6a3801eff7429a8b1ca8d05b342b00554e155735add5537f7"
    else
      url "https://github.com/Herd-OS/herd/releases/download/v0.1.0-rc.2/herd-darwin-amd64"
      sha256 "ca5c1f66d83c98e1b0ac872843ebfcc489b7b5f3ec3d614d3f45d74dfcb0b601"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Herd-OS/herd/releases/download/v0.1.0-rc.2/herd-linux-arm64"
      sha256 "a35ccac9ea7be11fa11926265fc006d58a0437b663c502f4e78b97d26c7bd584"
    else
      url "https://github.com/Herd-OS/herd/releases/download/v0.1.0-rc.2/herd-linux-amd64"
      sha256 "e406218a329614c5987475b0cb6bbd8f9ff4237bfd666b357b48af34442e1542"
    end
  end

  def install
    bin.install Dir["herd-*"].first => "herd"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/herd version")
  end
end
