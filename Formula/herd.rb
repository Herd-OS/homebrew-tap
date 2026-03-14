class Herd < Formula
  desc "GitHub-native orchestration for agentic development systems"
  homepage "https://github.com/Herd-OS/herd"
  version "0.1.0-rc.7"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Herd-OS/herd/releases/download/v0.1.0-rc.7/herd-darwin-arm64"
      sha256 "f5eeecc2d44ab047f686ba655cbd7a506a45d4ce2afac2fe1081f1a84f342228"
    else
      url "https://github.com/Herd-OS/herd/releases/download/v0.1.0-rc.7/herd-darwin-amd64"
      sha256 "47a549fa6f73f7cfbd759a89e3d8eaa32c4dd63473a26db8733908760eb6f38f"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Herd-OS/herd/releases/download/v0.1.0-rc.7/herd-linux-arm64"
      sha256 "3351dc69b8f51cf8479a88a570a6e770a9cb92d021fce268032dce10ddc495c6"
    else
      url "https://github.com/Herd-OS/herd/releases/download/v0.1.0-rc.7/herd-linux-amd64"
      sha256 "c284397e2470cad65a1cd84da43857a16afe91ac64b1ffdee0f26cbef08c5b8f"
    end
  end

  def install
    bin.install Dir["herd-*"].first => "herd"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/herd version")
  end
end
