class Herd < Formula
  desc "GitHub-native orchestration for agentic development systems"
  homepage "https://github.com/Herd-OS/herd"
  version "0.2.18"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Herd-OS/herd/releases/download/v0.2.18/herd-darwin-arm64"
      sha256 "003a84360ff99fae7b7b00d7e1e78e4896f81d5cf637a8de81b06d1a46a974b2"
    else
      url "https://github.com/Herd-OS/herd/releases/download/v0.2.18/herd-darwin-amd64"
      sha256 "ccb6d01af65bbe2785a97633247f34cb9fe271f85236fd45612b4481b6917373"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Herd-OS/herd/releases/download/v0.2.18/herd-linux-arm64"
      sha256 "01a1e6bb2349983bccd3bc2e4631658e8e76da07088c2899cd7ef0baebde08d2"
    else
      url "https://github.com/Herd-OS/herd/releases/download/v0.2.18/herd-linux-amd64"
      sha256 "df00f364734e74bd4a504bd13128ea414b7f6e93ca8050ca9cac8510940db416"
    end
  end

  def install
    bin.install Dir["herd-*"].first => "herd"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/herd version")
  end
end
