class Herd < Formula
  desc "GitHub-native orchestration for agentic development systems"
  homepage "https://github.com/Herd-OS/herd"
  version "0.3.6"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Herd-OS/herd/releases/download/v0.3.6/herd-darwin-arm64"
      sha256 "7fa97d37a4f81f089a91523a3c9eae6afd38badca95f7f39e465c673fc5df9d4"
    else
      url "https://github.com/Herd-OS/herd/releases/download/v0.3.6/herd-darwin-amd64"
      sha256 "80cb1acd42e25f37d4c1e886fbaea54e65dfc5cbadac050432b5335c948ec7eb"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Herd-OS/herd/releases/download/v0.3.6/herd-linux-arm64"
      sha256 "029e35430f1c5b8b3684bbf496cbbcd051b3807a257024cbeeb425450b68a593"
    else
      url "https://github.com/Herd-OS/herd/releases/download/v0.3.6/herd-linux-amd64"
      sha256 "fcc814dd33a2b2dbe47ce0e1be6252293a7cd0a4ceb764512d379ea3a8f85e68"
    end
  end

  def install
    bin.install Dir["herd-*"].first => "herd"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/herd version")
  end
end
