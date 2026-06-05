class Herd < Formula
  desc "GitHub-native orchestration for agentic development systems"
  homepage "https://github.com/Herd-OS/herd"
  version "0.8.11"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Herd-OS/herd/releases/download/v0.8.11/herd-darwin-arm64"
      sha256 "c5c7fed7669774daa3a2bedf578b31cc9d5038beef815f402867ce2477a806fd"
    else
      url "https://github.com/Herd-OS/herd/releases/download/v0.8.11/herd-darwin-amd64"
      sha256 "de2c96e13473fc6456d1c59816178ff4bd7b8b5040f9b24f864a1708d6e825b2"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Herd-OS/herd/releases/download/v0.8.11/herd-linux-arm64"
      sha256 "00827edecd8f0ae0b5acf2ae8daab41744f7e49b27b14e042b13366495bfdc85"
    else
      url "https://github.com/Herd-OS/herd/releases/download/v0.8.11/herd-linux-amd64"
      sha256 "5452f3d7b7d44655052595a25ba33497a8e5b56fa0785ad42706582eea6b3f13"
    end
  end

  def install
    bin.install Dir["herd-*"].first => "herd"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/herd version")
  end
end
