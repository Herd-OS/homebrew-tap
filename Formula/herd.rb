class Herd < Formula
  desc "GitHub-native orchestration for agentic development systems"
  homepage "https://github.com/Herd-OS/herd"
  version "0.1.0-rc.26"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Herd-OS/herd/releases/download/v0.1.0-rc.26/herd-darwin-arm64"
      sha256 "31fa32e8491e7ed696a064bede30aa26c4ddbc9b7b7e127d0bf2c54f593a1f09"
    else
      url "https://github.com/Herd-OS/herd/releases/download/v0.1.0-rc.26/herd-darwin-amd64"
      sha256 "8bc3a368d734c247fc24803549d62c9da838caa1b150074a40c9b559dd36a398"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Herd-OS/herd/releases/download/v0.1.0-rc.26/herd-linux-arm64"
      sha256 "8f5b1a76b39559b68358b136a8dbb14e593ab20586bbdcdf2d8f6bcab5b31fc7"
    else
      url "https://github.com/Herd-OS/herd/releases/download/v0.1.0-rc.26/herd-linux-amd64"
      sha256 "eec9bffcb21f1507ac599518ac14f19f359b173755f6b126099189db80209a2c"
    end
  end

  def install
    bin.install Dir["herd-*"].first => "herd"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/herd version")
  end
end
