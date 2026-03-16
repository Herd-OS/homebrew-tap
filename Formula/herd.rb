class Herd < Formula
  desc "GitHub-native orchestration for agentic development systems"
  homepage "https://github.com/Herd-OS/herd"
  version "0.1.0-rc.20"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Herd-OS/herd/releases/download/v0.1.0-rc.20/herd-darwin-arm64"
      sha256 "019d109ebe92004c526893ca9bb431c10fd3ee71d0a6c7ab0fb0bb54bb32f57c"
    else
      url "https://github.com/Herd-OS/herd/releases/download/v0.1.0-rc.20/herd-darwin-amd64"
      sha256 "55216c664f1007f1d128ea61371e73a69f481c248a001726b9b1611cc7fed312"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Herd-OS/herd/releases/download/v0.1.0-rc.20/herd-linux-arm64"
      sha256 "a3d6fd2272b6362c45739e704a71e81d1c1ce507fd9b2a799cc7233928eba802"
    else
      url "https://github.com/Herd-OS/herd/releases/download/v0.1.0-rc.20/herd-linux-amd64"
      sha256 "cc50a38c1a92122e1c0c7a29ab8dcceef2aaf7385c2e164907c38079a38119c1"
    end
  end

  def install
    bin.install Dir["herd-*"].first => "herd"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/herd version")
  end
end
