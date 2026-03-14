class Herd < Formula
  desc "GitHub-native orchestration for agentic development systems"
  homepage "https://github.com/Herd-OS/herd"
  version "0.1.0-rc.5"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Herd-OS/herd/releases/download/v0.1.0-rc.5/herd-darwin-arm64"
      sha256 "16d31427d204306689800d18e95e0c5d1d0fef5a7b634e232906088d8e2a811b"
    else
      url "https://github.com/Herd-OS/herd/releases/download/v0.1.0-rc.5/herd-darwin-amd64"
      sha256 "d7eb3577bce30db17cb30d84d8f75ed51d641558315a719a826050705a879f70"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Herd-OS/herd/releases/download/v0.1.0-rc.5/herd-linux-arm64"
      sha256 "001dc0b2a9401ec54bbf6f3d9d4c99783cafd9f53784e096fd4ef941be9c5633"
    else
      url "https://github.com/Herd-OS/herd/releases/download/v0.1.0-rc.5/herd-linux-amd64"
      sha256 "e2613c9639e4643eefbd119d5d80a65c2dedd0776e6e2fd7816fe1b41ca04761"
    end
  end

  def install
    bin.install Dir["herd-*"].first => "herd"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/herd version")
  end
end
