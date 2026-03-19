class Herd < Formula
  desc "GitHub-native orchestration for agentic development systems"
  homepage "https://github.com/Herd-OS/herd"
  version "0.2.0-rc.6"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Herd-OS/herd/releases/download/v0.2.0-rc.6/herd-darwin-arm64"
      sha256 "7a7a5b3b89a334c586ee847a8e5018f6d0565f55c3f4302c5852cce586f6a4a8"
    else
      url "https://github.com/Herd-OS/herd/releases/download/v0.2.0-rc.6/herd-darwin-amd64"
      sha256 "935e26a9c4d5c9f0d3999e70382168b64e107995b07a10057c166acafee57b70"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Herd-OS/herd/releases/download/v0.2.0-rc.6/herd-linux-arm64"
      sha256 "1f5b6732a24bc57d1a51cdd9cb4661ae4c1459c8e0e5c80c2170439697096178"
    else
      url "https://github.com/Herd-OS/herd/releases/download/v0.2.0-rc.6/herd-linux-amd64"
      sha256 "db4d8642c007205f719c0b0365bc106bafc23c6c30aa07b99583be2d5ad385ed"
    end
  end

  def install
    bin.install Dir["herd-*"].first => "herd"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/herd version")
  end
end
