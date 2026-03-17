class Herd < Formula
  desc "GitHub-native orchestration for agentic development systems"
  homepage "https://github.com/Herd-OS/herd"
  version "0.2.0-rc.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Herd-OS/herd/releases/download/v0.2.0-rc.1/herd-darwin-arm64"
      sha256 "9b5a8a592e021ff5d1233b88a34f36ce1019ee2d0bedb4772d6968df5cc63310"
    else
      url "https://github.com/Herd-OS/herd/releases/download/v0.2.0-rc.1/herd-darwin-amd64"
      sha256 "f8695b81a56c2384bdb18b0e5166b676e4939b02d24be66045885c877a35656b"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Herd-OS/herd/releases/download/v0.2.0-rc.1/herd-linux-arm64"
      sha256 "4876a3b57bc7d31b5c1b408acc6a1f074f8c4207922956d86b83d3ca19d30bed"
    else
      url "https://github.com/Herd-OS/herd/releases/download/v0.2.0-rc.1/herd-linux-amd64"
      sha256 "b80d81fe796236c698587941c6dea3b80f1f868fe3ad937279fbbf1c48c21deb"
    end
  end

  def install
    bin.install Dir["herd-*"].first => "herd"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/herd version")
  end
end
