class Herd < Formula
  desc "GitHub-native orchestration for agentic development systems"
  homepage "https://github.com/Herd-OS/herd"
  version "0.7.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Herd-OS/herd/releases/download/v0.7.0/herd-darwin-arm64"
      sha256 "f03be110ffc8ebc43113990aaabadcea16de107d0538845856f78fc75a18397e"
    else
      url "https://github.com/Herd-OS/herd/releases/download/v0.7.0/herd-darwin-amd64"
      sha256 "b4cec98e85f45b10b9fc9d8aad319d0e1aeb0d24587c9c71bb0c3ee10a777b85"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Herd-OS/herd/releases/download/v0.7.0/herd-linux-arm64"
      sha256 "5f1873c8839074b29574c8c70748d53f653d58d087ce726a736786cfa7fa2467"
    else
      url "https://github.com/Herd-OS/herd/releases/download/v0.7.0/herd-linux-amd64"
      sha256 "3c0cc1b6bd32e57b2710a73499604d0acbb39926744d715090a061a7c8f40869"
    end
  end

  def install
    bin.install Dir["herd-*"].first => "herd"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/herd version")
  end
end
