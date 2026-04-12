class Herd < Formula
  desc "GitHub-native orchestration for agentic development systems"
  homepage "https://github.com/Herd-OS/herd"
  version "0.3.4"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Herd-OS/herd/releases/download/v0.3.4/herd-darwin-arm64"
      sha256 "6aba9a31ada93bb6a190042854fd7910bc47a0f469381c49c24e3c231df25727"
    else
      url "https://github.com/Herd-OS/herd/releases/download/v0.3.4/herd-darwin-amd64"
      sha256 "661d489d5d8be882015dfbcc2363d291e14c9b39e88913de81269765019f2e5e"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Herd-OS/herd/releases/download/v0.3.4/herd-linux-arm64"
      sha256 "58f541ab511e058cd2a4a9926421afecb02b68e0e4d76b0475a4da074ff9331d"
    else
      url "https://github.com/Herd-OS/herd/releases/download/v0.3.4/herd-linux-amd64"
      sha256 "d2ee96fc44307afeb5432e71791fda64f531da55d301d3027e182eae3130e95a"
    end
  end

  def install
    bin.install Dir["herd-*"].first => "herd"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/herd version")
  end
end
