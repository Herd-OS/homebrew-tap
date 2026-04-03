class Herd < Formula
  desc "GitHub-native orchestration for agentic development systems"
  homepage "https://github.com/Herd-OS/herd"
  version "0.3.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Herd-OS/herd/releases/download/v0.3.2/herd-darwin-arm64"
      sha256 "3b20fe58e8aaa65f7257135cf1cb016d6031c00f5ba56f1ce1e9e3178799793e"
    else
      url "https://github.com/Herd-OS/herd/releases/download/v0.3.2/herd-darwin-amd64"
      sha256 "40b50b2fa7eb6093ecc9c292126ea2a4ce10740c850371c94f249b546f33116f"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Herd-OS/herd/releases/download/v0.3.2/herd-linux-arm64"
      sha256 "e8a27286c12381d822a353d4eac548d1b2606da1b1a21277073d25d649490832"
    else
      url "https://github.com/Herd-OS/herd/releases/download/v0.3.2/herd-linux-amd64"
      sha256 "1dd0adf8416dad6509a42adfc4c322b83315e98f98bb62c955ff45722fd4ee30"
    end
  end

  def install
    bin.install Dir["herd-*"].first => "herd"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/herd version")
  end
end
