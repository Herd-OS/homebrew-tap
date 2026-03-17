class Herd < Formula
  desc "GitHub-native orchestration for agentic development systems"
  homepage "https://github.com/Herd-OS/herd"
  version "0.1.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Herd-OS/herd/releases/download/v0.1.0/herd-darwin-arm64"
      sha256 "5787c361c799a5d216967345dd2fa34095209a2e9489dd8eb664d09b53360f70"
    else
      url "https://github.com/Herd-OS/herd/releases/download/v0.1.0/herd-darwin-amd64"
      sha256 "1e2a49feebe4a47fbea12a71827792e6409587406b85f4193d24109a89b5c78d"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Herd-OS/herd/releases/download/v0.1.0/herd-linux-arm64"
      sha256 "c8f10c73c814d815ef30f2b3c4eb48ed62615c37306cb7f3ae9c6346e96d1c89"
    else
      url "https://github.com/Herd-OS/herd/releases/download/v0.1.0/herd-linux-amd64"
      sha256 "32d65cb872fb2e1eaf62c37507c521cccb6809f27c75b5cc2cfba5ec369c1daf"
    end
  end

  def install
    bin.install Dir["herd-*"].first => "herd"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/herd version")
  end
end
