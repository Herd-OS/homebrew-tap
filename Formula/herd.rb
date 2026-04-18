class Herd < Formula
  desc "GitHub-native orchestration for agentic development systems"
  homepage "https://github.com/Herd-OS/herd"
  version "0.3.14"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Herd-OS/herd/releases/download/v0.3.14/herd-darwin-arm64"
      sha256 "b0363134666cf68f0a34a97d2eb7b075a8c6cbaa02f0adc326c07b424baaac3c"
    else
      url "https://github.com/Herd-OS/herd/releases/download/v0.3.14/herd-darwin-amd64"
      sha256 "0d78f8a81ab0426d3947dd06e00ebed58df95ed7f16ad090538c8b5fa8f953d8"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Herd-OS/herd/releases/download/v0.3.14/herd-linux-arm64"
      sha256 "ab632524535fcd8de168d700f991764857ee5d5bc680f9a7554b2b47f8b442f9"
    else
      url "https://github.com/Herd-OS/herd/releases/download/v0.3.14/herd-linux-amd64"
      sha256 "93bd586a8df27c496c0947222fa847e6e402520ca91410adc00fb11922848de7"
    end
  end

  def install
    bin.install Dir["herd-*"].first => "herd"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/herd version")
  end
end
