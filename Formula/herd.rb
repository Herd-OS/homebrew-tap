class Herd < Formula
  desc "GitHub-native orchestration for agentic development systems"
  homepage "https://github.com/Herd-OS/herd"
  version "0.8.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Herd-OS/herd/releases/download/v0.8.1/herd-darwin-arm64"
      sha256 "1b9f89d894d4dab28b6bf3439651a20c9228d6f8e31371b78f97769604dd0931"
    else
      url "https://github.com/Herd-OS/herd/releases/download/v0.8.1/herd-darwin-amd64"
      sha256 "cc29cbd53083cde0958731f8a13e154b3cfb1dfb2ff69d73aaf3663562c011e0"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Herd-OS/herd/releases/download/v0.8.1/herd-linux-arm64"
      sha256 "5857dbcbff29967e985bf043f70273d01cecfbb968a3bee1390e44bfc4afef52"
    else
      url "https://github.com/Herd-OS/herd/releases/download/v0.8.1/herd-linux-amd64"
      sha256 "2316ad6d089c88a02fceb9b04016923b4b4e8a447cd6b6f014e8a68712038a2a"
    end
  end

  def install
    bin.install Dir["herd-*"].first => "herd"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/herd version")
  end
end
