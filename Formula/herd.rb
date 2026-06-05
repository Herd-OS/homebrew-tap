class Herd < Formula
  desc "GitHub-native orchestration for agentic development systems"
  homepage "https://github.com/Herd-OS/herd"
  version "0.8.13"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Herd-OS/herd/releases/download/v0.8.13/herd-darwin-arm64"
      sha256 "3f1aacff21ce446832cdbaafa24346f074ff6cffc2cb7c82b56b7fed7f0c1fea"
    else
      url "https://github.com/Herd-OS/herd/releases/download/v0.8.13/herd-darwin-amd64"
      sha256 "fa01e05d599c847ee60e958f7ada01f2b65ba66a42b13153db00b5b454ad4a16"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Herd-OS/herd/releases/download/v0.8.13/herd-linux-arm64"
      sha256 "e01b79fbbd722bf0e475e55bed825f4bb414e483b1b598655671b6d60cea3059"
    else
      url "https://github.com/Herd-OS/herd/releases/download/v0.8.13/herd-linux-amd64"
      sha256 "72c02dc5f23392ab216144a0f3fc6cc9f0b1d33327aaaed05b61cc967de1cb19"
    end
  end

  def install
    bin.install Dir["herd-*"].first => "herd"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/herd version")
  end
end
