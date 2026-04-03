class Herd < Formula
  desc "GitHub-native orchestration for agentic development systems"
  homepage "https://github.com/Herd-OS/herd"
  version "0.2.19"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Herd-OS/herd/releases/download/v0.2.19/herd-darwin-arm64"
      sha256 "8fc0ed48a5e5bdb43ffabdc8396def085aee83eaef334109f2f511f25edc9f8a"
    else
      url "https://github.com/Herd-OS/herd/releases/download/v0.2.19/herd-darwin-amd64"
      sha256 "f77f5a980251ee2891a9e16cceaf258dec07a14c5bc6343e369eb79a9acb99d1"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Herd-OS/herd/releases/download/v0.2.19/herd-linux-arm64"
      sha256 "607703085b0718297215e8f87b8440b6c92e8a980beaffd986e977c2ba60db3f"
    else
      url "https://github.com/Herd-OS/herd/releases/download/v0.2.19/herd-linux-amd64"
      sha256 "aa24c31a079cd302ca7b663dc548c4d6694ddc5f5b0e03bd5dbe2790bf74da8e"
    end
  end

  def install
    bin.install Dir["herd-*"].first => "herd"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/herd version")
  end
end
