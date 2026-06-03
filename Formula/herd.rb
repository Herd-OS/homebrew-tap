class Herd < Formula
  desc "GitHub-native orchestration for agentic development systems"
  homepage "https://github.com/Herd-OS/herd"
  version "0.8.6"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Herd-OS/herd/releases/download/v0.8.6/herd-darwin-arm64"
      sha256 "a3c3bf6b09d5d3e04b4ff6b7994a53d2b049eec50bdc5445b6d7517bb7d075c9"
    else
      url "https://github.com/Herd-OS/herd/releases/download/v0.8.6/herd-darwin-amd64"
      sha256 "58a4fa4dbdbc478838cdae0caa91e0017cebb9873b534f05db45fc2d8f062987"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Herd-OS/herd/releases/download/v0.8.6/herd-linux-arm64"
      sha256 "e34f185589a11c3ef3ee70b2e6d8f028e5668f4cb90f9e729cc9604a0884cdeb"
    else
      url "https://github.com/Herd-OS/herd/releases/download/v0.8.6/herd-linux-amd64"
      sha256 "1225e21524cf41e6b68855e887171216b608d960b539c0787fd3122282baed08"
    end
  end

  def install
    bin.install Dir["herd-*"].first => "herd"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/herd version")
  end
end
