class Herd < Formula
  desc "GitHub-native orchestration for agentic development systems"
  homepage "https://github.com/Herd-OS/herd"
  version "0.4.4"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Herd-OS/herd/releases/download/v0.4.4/herd-darwin-arm64"
      sha256 "44333209dd4c2c74ddee8ad4e6a11b19a4c91ab7062e1aedcd66c09f24d08ac7"
    else
      url "https://github.com/Herd-OS/herd/releases/download/v0.4.4/herd-darwin-amd64"
      sha256 "5559b74d32b57befc1e16ce8988ed361b07d7d450908eeed1aa58bea0ee752ac"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Herd-OS/herd/releases/download/v0.4.4/herd-linux-arm64"
      sha256 "5c43e840e319c5fccd418524f112c67bd62b163e6b217879857202915256ec5d"
    else
      url "https://github.com/Herd-OS/herd/releases/download/v0.4.4/herd-linux-amd64"
      sha256 "ec8aadc3c6ce25a2084c344f46039578d89f516dc21d5bf2fab0a3a4e10bded4"
    end
  end

  def install
    bin.install Dir["herd-*"].first => "herd"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/herd version")
  end
end
