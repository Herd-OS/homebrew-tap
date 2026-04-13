class Herd < Formula
  desc "GitHub-native orchestration for agentic development systems"
  homepage "https://github.com/Herd-OS/herd"
  version "0.3.9"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Herd-OS/herd/releases/download/v0.3.9/herd-darwin-arm64"
      sha256 "476a1528761a69ed07b563f00dbaa5a09412b3823830faf642934fe0a392622a"
    else
      url "https://github.com/Herd-OS/herd/releases/download/v0.3.9/herd-darwin-amd64"
      sha256 "adfaa1020a4dd2d26c8922a3ae5dc1013d42156cc397cfe3aaafc17d598e3610"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Herd-OS/herd/releases/download/v0.3.9/herd-linux-arm64"
      sha256 "89b5123d0ac59f72acb2631f87de171a0bfb12f8bba981f5c1ffdb6282274586"
    else
      url "https://github.com/Herd-OS/herd/releases/download/v0.3.9/herd-linux-amd64"
      sha256 "b64a6b3fdec70b839d2eb86c0fa22072936d5e4bf061c3f4fe8d1097cfc577e0"
    end
  end

  def install
    bin.install Dir["herd-*"].first => "herd"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/herd version")
  end
end
