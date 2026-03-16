class Herd < Formula
  desc "GitHub-native orchestration for agentic development systems"
  homepage "https://github.com/Herd-OS/herd"
  version "0.1.0-rc.13"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Herd-OS/herd/releases/download/v0.1.0-rc.13/herd-darwin-arm64"
      sha256 "4abfb00278c56ffc9716fb450f6751c5acb089aac0e6e8b5d200274c4bd6ef12"
    else
      url "https://github.com/Herd-OS/herd/releases/download/v0.1.0-rc.13/herd-darwin-amd64"
      sha256 "0e899cd230ed30d92cea3c543f49dc304fc8e4c842f6304d9a1b9bf2daf5ef50"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Herd-OS/herd/releases/download/v0.1.0-rc.13/herd-linux-arm64"
      sha256 "9d5e78227975492c56cce99da33d72f91b4417c5c5acab7917571769fac9c722"
    else
      url "https://github.com/Herd-OS/herd/releases/download/v0.1.0-rc.13/herd-linux-amd64"
      sha256 "7a8848115c51191a52c58a9144dcdb2b38e6646718fa075f49b14ae92a4bcffb"
    end
  end

  def install
    bin.install Dir["herd-*"].first => "herd"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/herd version")
  end
end
