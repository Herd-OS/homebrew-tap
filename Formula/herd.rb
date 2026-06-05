class Herd < Formula
  desc "GitHub-native orchestration for agentic development systems"
  homepage "https://github.com/Herd-OS/herd"
  version "0.8.12"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Herd-OS/herd/releases/download/v0.8.12/herd-darwin-arm64"
      sha256 "dfbfad60e2557e5b0f119d034856390c46c87a0f6cfd3742bccc1856269c1fb0"
    else
      url "https://github.com/Herd-OS/herd/releases/download/v0.8.12/herd-darwin-amd64"
      sha256 "e9db5adc0cb7c28ddebe0e6d31f9b1a86a5f82ee155c31b57f4ed301e90b4f73"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Herd-OS/herd/releases/download/v0.8.12/herd-linux-arm64"
      sha256 "763eed3a65510fa2746dd2abcbb230065c6ee411b9587d04008446bd4d3283bc"
    else
      url "https://github.com/Herd-OS/herd/releases/download/v0.8.12/herd-linux-amd64"
      sha256 "b0c2dadd38c2a687867b87afeff10419045d36cecfe111f653e6605241d76882"
    end
  end

  def install
    bin.install Dir["herd-*"].first => "herd"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/herd version")
  end
end
