class Herd < Formula
  desc "GitHub-native orchestration for agentic development systems"
  homepage "https://github.com/Herd-OS/herd"
  version "0.6.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Herd-OS/herd/releases/download/v0.6.1/herd-darwin-arm64"
      sha256 "b7e53cbd71851025b7afde50dd454c589e9806c8d557c68449ed380aeb9b1029"
    else
      url "https://github.com/Herd-OS/herd/releases/download/v0.6.1/herd-darwin-amd64"
      sha256 "b5c1d6ce7bafb0809c3335b1fec38248342e3aac8bf628774fb3964376849d2a"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Herd-OS/herd/releases/download/v0.6.1/herd-linux-arm64"
      sha256 "31a463fabcabd29a14fdbd3edbe2c5a343b5ba42a14c8c5934042dd77b1916c5"
    else
      url "https://github.com/Herd-OS/herd/releases/download/v0.6.1/herd-linux-amd64"
      sha256 "8b42d2f49b701ba834ddf99d06a2b610b4d29ceb74468e03c21467a03dd694c9"
    end
  end

  def install
    bin.install Dir["herd-*"].first => "herd"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/herd version")
  end
end
