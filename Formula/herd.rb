class Herd < Formula
  desc "GitHub-native orchestration for agentic development systems"
  homepage "https://github.com/Herd-OS/herd"
  version "0.2.0-rc.5"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Herd-OS/herd/releases/download/v0.2.0-rc.5/herd-darwin-arm64"
      sha256 "5702aaf5c71c7f0db9227b1e40ebd8960f930e8163bde6ebbb5a314235bcccc9"
    else
      url "https://github.com/Herd-OS/herd/releases/download/v0.2.0-rc.5/herd-darwin-amd64"
      sha256 "e690aadf53d209527ae8adaf56e658ffa6ef7f68c307f30daf45ad4b0bb5798b"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Herd-OS/herd/releases/download/v0.2.0-rc.5/herd-linux-arm64"
      sha256 "1918acade8fdce6d3bcc0b9afe7932c8764bda45fbd3e61a6b7e916dca3da835"
    else
      url "https://github.com/Herd-OS/herd/releases/download/v0.2.0-rc.5/herd-linux-amd64"
      sha256 "ecbd35eee3f3a37004b290639e2674911f526a1616a69c8fbe3b4272dbede053"
    end
  end

  def install
    bin.install Dir["herd-*"].first => "herd"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/herd version")
  end
end
