class Herd < Formula
  desc "GitHub-native orchestration for agentic development systems"
  homepage "https://github.com/Herd-OS/herd"
  version "0.1.0-rc.15"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Herd-OS/herd/releases/download/v0.1.0-rc.15/herd-darwin-arm64"
      sha256 "f7009e3501c223ba01d2edf7ac8b5e00ebeee509240eea0616710380f3cb968e"
    else
      url "https://github.com/Herd-OS/herd/releases/download/v0.1.0-rc.15/herd-darwin-amd64"
      sha256 "1a23983d5eff0889d9322f83bbf45aa8cd2b122f2a289ed3cc3afffae7720daa"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Herd-OS/herd/releases/download/v0.1.0-rc.15/herd-linux-arm64"
      sha256 "eed532e9f1b7082bf2e0eade85ab9eeedee9155a7019cac24de475ce2c2f3a8f"
    else
      url "https://github.com/Herd-OS/herd/releases/download/v0.1.0-rc.15/herd-linux-amd64"
      sha256 "1f2c5475ed04e0f68960efb5003a8ace4c51cf76a416d2dca0d3de6b177ac113"
    end
  end

  def install
    bin.install Dir["herd-*"].first => "herd"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/herd version")
  end
end
