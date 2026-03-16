class Herd < Formula
  desc "GitHub-native orchestration for agentic development systems"
  homepage "https://github.com/Herd-OS/herd"
  version "0.1.0-rc.17"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Herd-OS/herd/releases/download/v0.1.0-rc.17/herd-darwin-arm64"
      sha256 "7f4b907d13c1c5f427be41e65b3106cf1a40e38305a61bf4fd5a2afa5fe5555a"
    else
      url "https://github.com/Herd-OS/herd/releases/download/v0.1.0-rc.17/herd-darwin-amd64"
      sha256 "a5b5876340dbcc880197b4c5f7ada04a16498bf09f0bbcf21e4d5ad607ff0f21"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Herd-OS/herd/releases/download/v0.1.0-rc.17/herd-linux-arm64"
      sha256 "45614a3bb1995ae84f40ead22c40eeee5626b90db05f54a0bfc586501d4e260d"
    else
      url "https://github.com/Herd-OS/herd/releases/download/v0.1.0-rc.17/herd-linux-amd64"
      sha256 "afe2bdd0752f88b15f5f5c1c3055e6a22d34d7fb4ff0ac641bbd02daa16f2128"
    end
  end

  def install
    bin.install Dir["herd-*"].first => "herd"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/herd version")
  end
end
