class Herd < Formula
  desc "GitHub-native orchestration for agentic development systems"
  homepage "https://github.com/Herd-OS/herd"
  version "0.8.33"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Herd-OS/herd/releases/download/v0.8.33/herd-darwin-arm64"
      sha256 "3071d3d0f32cd7b4276bf1ee0fad2af7140639526d7e468f39b596d1d47097e8"
    else
      url "https://github.com/Herd-OS/herd/releases/download/v0.8.33/herd-darwin-amd64"
      sha256 "4935e6617791a253d198183ddc0c2f3e4e472cd733b6f34e084c8b4edd204529"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Herd-OS/herd/releases/download/v0.8.33/herd-linux-arm64"
      sha256 "8bf9c154efa2d9f39ca47652ede477a5930664c6a6481c6a1ed86f6615c903a4"
    else
      url "https://github.com/Herd-OS/herd/releases/download/v0.8.33/herd-linux-amd64"
      sha256 "6ab363b79fbeb1fe4a36bef494e01c2c242b68e5063d50f9713de62d5759fbd4"
    end
  end

  def install
    bin.install Dir["herd-*"].first => "herd"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/herd version")
  end
end
