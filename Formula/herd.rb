class Herd < Formula
  desc "GitHub-native orchestration for agentic development systems"
  homepage "https://github.com/Herd-OS/herd"
  version "0.2.15"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Herd-OS/herd/releases/download/v0.2.15/herd-darwin-arm64"
      sha256 "c5faa25feb507c4345e1c4e72bd9669b16bd68f8e15d0473a2be41123515e8f9"
    else
      url "https://github.com/Herd-OS/herd/releases/download/v0.2.15/herd-darwin-amd64"
      sha256 "f59c7e69bd3fce8df6a0d0081c698a142a9272a87718d051bf56083388227a95"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Herd-OS/herd/releases/download/v0.2.15/herd-linux-arm64"
      sha256 "bab5b2d9cfd5b1dd6074dbd81cd4b332b5ef2f29fba8ffb1e86c575d77507b15"
    else
      url "https://github.com/Herd-OS/herd/releases/download/v0.2.15/herd-linux-amd64"
      sha256 "f9d3c9d74c5c6158d2bb3a37ce7d5a1c9d517511b582c5d631a48d7a06e1550b"
    end
  end

  def install
    bin.install Dir["herd-*"].first => "herd"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/herd version")
  end
end
