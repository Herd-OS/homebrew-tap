class Herd < Formula
  desc "GitHub-native orchestration for agentic development systems"
  homepage "https://github.com/Herd-OS/herd"
  version "0.2.14"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Herd-OS/herd/releases/download/v0.2.14/herd-darwin-arm64"
      sha256 "32bbdcdfab69f14294e9ed0fb04c2ec8fca6013c6f8290d938a870c7fbae6aca"
    else
      url "https://github.com/Herd-OS/herd/releases/download/v0.2.14/herd-darwin-amd64"
      sha256 "2a749c9beac58b44842d2e6c62a4b07df8aa7e8aacf6ee15cdfd6e156b2d2e17"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Herd-OS/herd/releases/download/v0.2.14/herd-linux-arm64"
      sha256 "8019c05f31e4c3408083de6e61d75b4c052c173fa0631ca5a4b3ca27b99239a8"
    else
      url "https://github.com/Herd-OS/herd/releases/download/v0.2.14/herd-linux-amd64"
      sha256 "d4837929576171d2b494e79f768dc9b607e1e15e8494f390d0b40299ad5aaadf"
    end
  end

  def install
    bin.install Dir["herd-*"].first => "herd"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/herd version")
  end
end
