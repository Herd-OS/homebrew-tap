class Herd < Formula
  desc "GitHub-native orchestration for agentic development systems"
  homepage "https://github.com/Herd-OS/herd"
  version "0.2.5"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Herd-OS/herd/releases/download/v0.2.5/herd-darwin-arm64"
      sha256 "c43af404c301fcc94de81591eb2400998fb2eef4c7efa8c8cf7c25b9e446837f"
    else
      url "https://github.com/Herd-OS/herd/releases/download/v0.2.5/herd-darwin-amd64"
      sha256 "d4346f907a1e53797995431fea21d2c97d753ba5489b23ef3ef7e5661797aa7b"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Herd-OS/herd/releases/download/v0.2.5/herd-linux-arm64"
      sha256 "f0bf446ef0b220587de10aff6daaf4966aed6b8dd272b25c2b8c4c1829dad137"
    else
      url "https://github.com/Herd-OS/herd/releases/download/v0.2.5/herd-linux-amd64"
      sha256 "ff344ba1b11690d007dbd1d6337d204f7f86c3b0803ed9b6a0c76b8f27e42534"
    end
  end

  def install
    bin.install Dir["herd-*"].first => "herd"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/herd version")
  end
end
