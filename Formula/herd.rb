class Herd < Formula
  desc "GitHub-native orchestration for agentic development systems"
  homepage "https://github.com/Herd-OS/herd"
  version "0.1.0-rc.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Herd-OS/herd/releases/download/v0.1.0-rc.1/herd-darwin-arm64"
      sha256 "6418d1722a54754b30bb34242ab16fd46bfef3dfdce7cef4799f048b8a502be4"
    else
      url "https://github.com/Herd-OS/herd/releases/download/v0.1.0-rc.1/herd-darwin-amd64"
      sha256 "1a29fcaddc6c31e825256b8e75485f7ae9e8d7ff242e2ff7cc7055c1a2cd04db"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Herd-OS/herd/releases/download/v0.1.0-rc.1/herd-linux-arm64"
      sha256 "219a7f520fccc1f1a075b8fabb9eac5d5604aa445e733684b63f1b691b17b27d"
    else
      url "https://github.com/Herd-OS/herd/releases/download/v0.1.0-rc.1/herd-linux-amd64"
      sha256 "1ac19dac9a8090c8b2bc5106c29442a2ae262184ebd7c65244ef35068f9bdb80"
    end
  end

  def install
    bin.install Dir["herd-*"].first => "herd"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/herd version")
  end
end
