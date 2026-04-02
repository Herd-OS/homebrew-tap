class Herd < Formula
  desc "GitHub-native orchestration for agentic development systems"
  homepage "https://github.com/Herd-OS/herd"
  version "0.2.17"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Herd-OS/herd/releases/download/v0.2.17/herd-darwin-arm64"
      sha256 "ff07772f48957cf51df3407d96a3e1de9efd639395a7e694c834f31597819314"
    else
      url "https://github.com/Herd-OS/herd/releases/download/v0.2.17/herd-darwin-amd64"
      sha256 "19664b0e6905b5d026504820c3504cc0c60dc0a80fd74702e545aff959d3da89"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Herd-OS/herd/releases/download/v0.2.17/herd-linux-arm64"
      sha256 "c02210dbce299a71fef756284bba50ab645aa28c9337f84639f7ee960440d76e"
    else
      url "https://github.com/Herd-OS/herd/releases/download/v0.2.17/herd-linux-amd64"
      sha256 "5c371e5645a508cdc09805ea5896f7fdb37e16f4e8633a4ad7ada68a61a149d1"
    end
  end

  def install
    bin.install Dir["herd-*"].first => "herd"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/herd version")
  end
end
