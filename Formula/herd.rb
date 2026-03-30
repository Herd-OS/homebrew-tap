class Herd < Formula
  desc "GitHub-native orchestration for agentic development systems"
  homepage "https://github.com/Herd-OS/herd"
  version "0.2.10"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Herd-OS/herd/releases/download/v0.2.10/herd-darwin-arm64"
      sha256 "f4ac6793ef44e977b8944255c0096cbc8308207ec6bbacd5fd09f5479702719c"
    else
      url "https://github.com/Herd-OS/herd/releases/download/v0.2.10/herd-darwin-amd64"
      sha256 "a2605e2c8f7495e43cdd00626acd7ff3976fb896fbc77e8e51638e763f16c167"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Herd-OS/herd/releases/download/v0.2.10/herd-linux-arm64"
      sha256 "0f7a846ecdaea4ee4dc004071473a62e41e4c835d29b609c745b199cf1245d77"
    else
      url "https://github.com/Herd-OS/herd/releases/download/v0.2.10/herd-linux-amd64"
      sha256 "7f3590842adf5c4bc135b378ec3bf62ba967752b865b92bdce61976fe80d7974"
    end
  end

  def install
    bin.install Dir["herd-*"].first => "herd"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/herd version")
  end
end
