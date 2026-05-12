class Herd < Formula
  desc "GitHub-native orchestration for agentic development systems"
  homepage "https://github.com/Herd-OS/herd"
  version "0.6.7"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Herd-OS/herd/releases/download/v0.6.7/herd-darwin-arm64"
      sha256 "344ec3dd6e86405c5c8ba0aca25fae55e796b7ba5142b3b43d4720cd796074fb"
    else
      url "https://github.com/Herd-OS/herd/releases/download/v0.6.7/herd-darwin-amd64"
      sha256 "421792b84018576d172d06b6d11850ebc43b73bf6378724a46a55f133899c798"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Herd-OS/herd/releases/download/v0.6.7/herd-linux-arm64"
      sha256 "8188b55c0ab407ad10431709bfb67db3114c59ef559f29e36bc86c4716dae635"
    else
      url "https://github.com/Herd-OS/herd/releases/download/v0.6.7/herd-linux-amd64"
      sha256 "55f910e4a04d5b2e98f466a7bc0be3eb80593285675c5a8d31f1e92f7ea8127a"
    end
  end

  def install
    bin.install Dir["herd-*"].first => "herd"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/herd version")
  end
end
