class Herd < Formula
  desc "GitHub-native orchestration for agentic development systems"
  homepage "https://github.com/Herd-OS/herd"
  version "0.5.4"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Herd-OS/herd/releases/download/v0.5.4/herd-darwin-arm64"
      sha256 "bf455f4f27e0360982dc10850444d17f2711300703633325f1cf55ea921ca6ae"
    else
      url "https://github.com/Herd-OS/herd/releases/download/v0.5.4/herd-darwin-amd64"
      sha256 "484ec363940643dfd0c090123e1e3273cb2d2f76d89e46796087714ffab4ec65"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Herd-OS/herd/releases/download/v0.5.4/herd-linux-arm64"
      sha256 "d1b4038bf2c2932060d90773e48dba0f40b65516affb1d3eb408a0dad68464f6"
    else
      url "https://github.com/Herd-OS/herd/releases/download/v0.5.4/herd-linux-amd64"
      sha256 "d2cffac00e5a7f0f33a13d999e2801aebb0d362f1670708374d440040b191bc7"
    end
  end

  def install
    bin.install Dir["herd-*"].first => "herd"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/herd version")
  end
end
