class Herd < Formula
  desc "GitHub-native orchestration for agentic development systems"
  homepage "https://github.com/Herd-OS/herd"
  version "0.8.14"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Herd-OS/herd/releases/download/v0.8.14/herd-darwin-arm64"
      sha256 "03e091e10b92efcdaa7d3f99ac36bdcdc20452d2f61d43d2d878685c3ed17e30"
    else
      url "https://github.com/Herd-OS/herd/releases/download/v0.8.14/herd-darwin-amd64"
      sha256 "52d08e0aa80a451e2fd3d55843e287546f2569dd7197f8ba47402b7ed65da3dd"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Herd-OS/herd/releases/download/v0.8.14/herd-linux-arm64"
      sha256 "3ef81039fd243ebf49a216585fd34fde7abb3c3b5710b0ea5e37d12647bd3c7a"
    else
      url "https://github.com/Herd-OS/herd/releases/download/v0.8.14/herd-linux-amd64"
      sha256 "cc8fce05d4aea68b0ce9b6b64ab9c2eeec5bbdd3a97f035838fbbf58749c8d12"
    end
  end

  def install
    bin.install Dir["herd-*"].first => "herd"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/herd version")
  end
end
