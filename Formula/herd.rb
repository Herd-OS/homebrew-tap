class Herd < Formula
  desc "GitHub-native orchestration for agentic development systems"
  homepage "https://github.com/Herd-OS/herd"
  version "0.1.0-rc.14"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Herd-OS/herd/releases/download/v0.1.0-rc.14/herd-darwin-arm64"
      sha256 "3b43dd0df4bdaa4a2ea21d94324660234a9f52d494f15a413290b46dd9a98750"
    else
      url "https://github.com/Herd-OS/herd/releases/download/v0.1.0-rc.14/herd-darwin-amd64"
      sha256 "e386f0b918a67a8e1d755f91f2255f52a2a0190b17766b60ed690bae5548b8f1"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Herd-OS/herd/releases/download/v0.1.0-rc.14/herd-linux-arm64"
      sha256 "99dd470324ca8d221ba8c3e8121fb37b3ad218a882e36e465fc9d97bacc879cc"
    else
      url "https://github.com/Herd-OS/herd/releases/download/v0.1.0-rc.14/herd-linux-amd64"
      sha256 "4151bb2641dccbe1749d0dea5b7343bf64ac86b79b8b02a065368c0992fc5e47"
    end
  end

  def install
    bin.install Dir["herd-*"].first => "herd"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/herd version")
  end
end
