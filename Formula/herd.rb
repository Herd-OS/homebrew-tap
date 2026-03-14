class Herd < Formula
  desc "GitHub-native orchestration for agentic development systems"
  homepage "https://github.com/Herd-OS/herd"
  version "0.1.0-rc.3"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Herd-OS/herd/releases/download/v0.1.0-rc.3/herd-darwin-arm64"
      sha256 "1147e44d8afe23e7a2a3047ca99ecb751d123b56a142242c1d2171fe53e425ee"
    else
      url "https://github.com/Herd-OS/herd/releases/download/v0.1.0-rc.3/herd-darwin-amd64"
      sha256 "a43bb330384da0a2cbff9229c62afe721ea4c53499d3619484db763479ad382c"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Herd-OS/herd/releases/download/v0.1.0-rc.3/herd-linux-arm64"
      sha256 "add96e93708c5b8eae588c166c357687b3e81575e29038c0bb663c709a4f5cab"
    else
      url "https://github.com/Herd-OS/herd/releases/download/v0.1.0-rc.3/herd-linux-amd64"
      sha256 "b2e43320182f846a1ac864274e3f0a7e597798c9c83d8b2665e19cdd76fbfd03"
    end
  end

  def install
    bin.install Dir["herd-*"].first => "herd"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/herd version")
  end
end
