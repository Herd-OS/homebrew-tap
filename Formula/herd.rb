class Herd < Formula
  desc "GitHub-native orchestration for agentic development systems"
  homepage "https://github.com/Herd-OS/herd"
  version "0.8.32"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Herd-OS/herd/releases/download/v0.8.32/herd-darwin-arm64"
      sha256 "31ad9f9a82dc69d365ea47f6154aac79fbdf921f76bba95b14b2c452b47b84d6"
    else
      url "https://github.com/Herd-OS/herd/releases/download/v0.8.32/herd-darwin-amd64"
      sha256 "465a0a06db34d587d1387d3f38a30bea085b26e229cc100b24028d623383d2ab"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Herd-OS/herd/releases/download/v0.8.32/herd-linux-arm64"
      sha256 "95a19ab8d1e644a0d6633c521cae09c2ead751b69f1b23282b753ad2b50ebe55"
    else
      url "https://github.com/Herd-OS/herd/releases/download/v0.8.32/herd-linux-amd64"
      sha256 "3c44f9cbfa761752f058b34c4e96fb93fc4f0591adc8007701479b290cabf5ea"
    end
  end

  def install
    bin.install Dir["herd-*"].first => "herd"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/herd version")
  end
end
