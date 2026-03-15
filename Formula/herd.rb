class Herd < Formula
  desc "GitHub-native orchestration for agentic development systems"
  homepage "https://github.com/Herd-OS/herd"
  version "0.1.0-rc.9"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Herd-OS/herd/releases/download/v0.1.0-rc.9/herd-darwin-arm64"
      sha256 "95b814afed519eef72fb94787befd9daf3d628bd5e3eb19faa886e2ae331612e"
    else
      url "https://github.com/Herd-OS/herd/releases/download/v0.1.0-rc.9/herd-darwin-amd64"
      sha256 "9a08259f130b57a4847f089d3b2358a42ddcb6ac1eb2edae550d1ab0a2f796da"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Herd-OS/herd/releases/download/v0.1.0-rc.9/herd-linux-arm64"
      sha256 "9a8fed3e11f3848ca51efe3ced2afbfae8013ca05d5959e2b3908600387e6ad2"
    else
      url "https://github.com/Herd-OS/herd/releases/download/v0.1.0-rc.9/herd-linux-amd64"
      sha256 "57549ec71b77a4e0fb2a40a3884968a195df89e97750eeeb2dfcb59f40ca9742"
    end
  end

  def install
    bin.install Dir["herd-*"].first => "herd"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/herd version")
  end
end
