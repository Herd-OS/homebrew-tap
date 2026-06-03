class Herd < Formula
  desc "GitHub-native orchestration for agentic development systems"
  homepage "https://github.com/Herd-OS/herd"
  version "0.8.8"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Herd-OS/herd/releases/download/v0.8.8/herd-darwin-arm64"
      sha256 "cf2c9df858c6eaa9838b0023a5e0597c5c4e060e75a196d74c29354ed2f4fd8b"
    else
      url "https://github.com/Herd-OS/herd/releases/download/v0.8.8/herd-darwin-amd64"
      sha256 "f8adbd67cad485edbff238a4bcff5a73249e5f5ac9eab43258f805e7a8b58c4a"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Herd-OS/herd/releases/download/v0.8.8/herd-linux-arm64"
      sha256 "398b3807fbba344815df6af821f827d2c21092df8699d063d36e421fb42d8dd3"
    else
      url "https://github.com/Herd-OS/herd/releases/download/v0.8.8/herd-linux-amd64"
      sha256 "75ab4e4692f8ab057a3a75be506925ed42dad954f0653bdffa2bf643761e5b6e"
    end
  end

  def install
    bin.install Dir["herd-*"].first => "herd"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/herd version")
  end
end
