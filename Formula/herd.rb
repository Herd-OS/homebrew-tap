class Herd < Formula
  desc "GitHub-native orchestration for agentic development systems"
  homepage "https://github.com/Herd-OS/herd"
  version "0.3.3"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Herd-OS/herd/releases/download/v0.3.3/herd-darwin-arm64"
      sha256 "49aac4c4fc2a8baf0a01bac4cfde98f5ede92102812516599efbeb1de00cfb49"
    else
      url "https://github.com/Herd-OS/herd/releases/download/v0.3.3/herd-darwin-amd64"
      sha256 "26392b29773ce287b737c803f7e9640ceedf053fa813af6eb2154771522f9cfa"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Herd-OS/herd/releases/download/v0.3.3/herd-linux-arm64"
      sha256 "28330dd1a3306ecc32cfbc84e04d28ea910898a17b0a2fdba74309496954ba83"
    else
      url "https://github.com/Herd-OS/herd/releases/download/v0.3.3/herd-linux-amd64"
      sha256 "121d678a5b7c24a3c2daeec1b5e16fb12b33681b1439e8403ecb81a7923c59ad"
    end
  end

  def install
    bin.install Dir["herd-*"].first => "herd"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/herd version")
  end
end
