class Herd < Formula
  desc "GitHub-native orchestration for agentic development systems"
  homepage "https://github.com/Herd-OS/herd"
  version "0.3.19"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Herd-OS/herd/releases/download/v0.3.19/herd-darwin-arm64"
      sha256 "332cd704e0a751327fbb02628b9888a5516658f84b21cd5bb0dbba87953a254e"
    else
      url "https://github.com/Herd-OS/herd/releases/download/v0.3.19/herd-darwin-amd64"
      sha256 "2f478de778f03061bf74d8eb197cb0ad08ae45ec0f98f71cd67291f0e436e4fe"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Herd-OS/herd/releases/download/v0.3.19/herd-linux-arm64"
      sha256 "1e4905e8bdf4789538e31710fdb9a6b44f0e0adf341454bf15f81800b9a7f165"
    else
      url "https://github.com/Herd-OS/herd/releases/download/v0.3.19/herd-linux-amd64"
      sha256 "5d917c2c06504b7389ed5ad08495e901f7ffc5e1c67396519124a0f23d9f9c12"
    end
  end

  def install
    bin.install Dir["herd-*"].first => "herd"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/herd version")
  end
end
