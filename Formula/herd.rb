class Herd < Formula
  desc "GitHub-native orchestration for agentic development systems"
  homepage "https://github.com/Herd-OS/herd"
  version "0.8.24"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Herd-OS/herd/releases/download/v0.8.24/herd-darwin-arm64"
      sha256 "3af6a38c4c2b3a19c625182cce7eb435a349e49efbd61b1cb253e75de557337e"
    else
      url "https://github.com/Herd-OS/herd/releases/download/v0.8.24/herd-darwin-amd64"
      sha256 "859682193ef105aade0fab128d69205377350a8fd0ae952503dc7e4d761db7d9"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Herd-OS/herd/releases/download/v0.8.24/herd-linux-arm64"
      sha256 "79c3561cce1021d0aee1b415c8f10b0a540aa28f15ddf8ab5972f2db65ad3105"
    else
      url "https://github.com/Herd-OS/herd/releases/download/v0.8.24/herd-linux-amd64"
      sha256 "ddedcb04830630f9cdeac4f63c3d561b20592485db3e45c6956908b19b7eae64"
    end
  end

  def install
    bin.install Dir["herd-*"].first => "herd"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/herd version")
  end
end
