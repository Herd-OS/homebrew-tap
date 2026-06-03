class Herd < Formula
  desc "GitHub-native orchestration for agentic development systems"
  homepage "https://github.com/Herd-OS/herd"
  version "0.8.7"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Herd-OS/herd/releases/download/v0.8.7/herd-darwin-arm64"
      sha256 "9250f6f27e70ed405f2258bba338c1032dc3500c48bb052f1c01cec50929124b"
    else
      url "https://github.com/Herd-OS/herd/releases/download/v0.8.7/herd-darwin-amd64"
      sha256 "cadd43ee5c570bc0326706cfec22838940cbf30281aec06a04fb8d544bf3f109"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Herd-OS/herd/releases/download/v0.8.7/herd-linux-arm64"
      sha256 "f5d9326ecf9b940fd6ed6f7d741988576c4a532d3a1ade74920947c381f553d2"
    else
      url "https://github.com/Herd-OS/herd/releases/download/v0.8.7/herd-linux-amd64"
      sha256 "2a85284af88da99b058b72677719f2ee8237e9b66dbbac206e22b8c8c4e0f6d7"
    end
  end

  def install
    bin.install Dir["herd-*"].first => "herd"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/herd version")
  end
end
