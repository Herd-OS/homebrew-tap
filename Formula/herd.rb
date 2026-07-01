class Herd < Formula
  desc "GitHub-native orchestration for agentic development systems"
  homepage "https://github.com/Herd-OS/herd"
  version "0.8.23"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Herd-OS/herd/releases/download/v0.8.23/herd-darwin-arm64"
      sha256 "5e97ad7d3582e523b24e02a01c6c743c3331b488bdf8eb62a8935deaf76a2fc7"
    else
      url "https://github.com/Herd-OS/herd/releases/download/v0.8.23/herd-darwin-amd64"
      sha256 "f7cd11a14a03ba023937859db4ff14671641624a7da35ac85a888eaa10e13884"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Herd-OS/herd/releases/download/v0.8.23/herd-linux-arm64"
      sha256 "bdbf7bcfdfdc9127e9992d7bb916b6d9f6d0025d1711ad0e7df3deeb53708c9c"
    else
      url "https://github.com/Herd-OS/herd/releases/download/v0.8.23/herd-linux-amd64"
      sha256 "5e756d6def02c64c4f127452da517e345788810080417c831532e3022559f4fe"
    end
  end

  def install
    bin.install Dir["herd-*"].first => "herd"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/herd version")
  end
end
