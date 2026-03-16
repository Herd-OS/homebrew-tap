class Herd < Formula
  desc "GitHub-native orchestration for agentic development systems"
  homepage "https://github.com/Herd-OS/herd"
  version "0.1.0-rc.23"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Herd-OS/herd/releases/download/v0.1.0-rc.23/herd-darwin-arm64"
      sha256 "6595f74867467d845e93a6720f2e2376eee9a429dd83fb0b5fc85b9a1c182c4b"
    else
      url "https://github.com/Herd-OS/herd/releases/download/v0.1.0-rc.23/herd-darwin-amd64"
      sha256 "a088e493a4bfc1ef28adeac94a39f6741adde50ef94f49163b46523a70ca7c46"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Herd-OS/herd/releases/download/v0.1.0-rc.23/herd-linux-arm64"
      sha256 "e15b3131c851f002cb02762f7731fbcae0ddf42e400c6c955e8eb2dc697f2428"
    else
      url "https://github.com/Herd-OS/herd/releases/download/v0.1.0-rc.23/herd-linux-amd64"
      sha256 "9d57b5c4996bf999291e1bb450ff5e815b2cd029824f1058d245c21158b3be4d"
    end
  end

  def install
    bin.install Dir["herd-*"].first => "herd"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/herd version")
  end
end
