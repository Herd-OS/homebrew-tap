class Herd < Formula
  desc "GitHub-native orchestration for agentic development systems"
  homepage "https://github.com/Herd-OS/herd"
  version "0.3.18"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Herd-OS/herd/releases/download/v0.3.18/herd-darwin-arm64"
      sha256 "0b4a459b57da877eaef6cb15d476e2b6fe2507926960d59b119dbad04f0e506b"
    else
      url "https://github.com/Herd-OS/herd/releases/download/v0.3.18/herd-darwin-amd64"
      sha256 "c3be860108d8889e0bca2bbf1cac0e8a61459d7b1ec65c88c2c98513c1e52ddb"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Herd-OS/herd/releases/download/v0.3.18/herd-linux-arm64"
      sha256 "b431bb30a4cdf359fd45f3615d3d8acb406f85199e76cf318bf0b2b706d740d8"
    else
      url "https://github.com/Herd-OS/herd/releases/download/v0.3.18/herd-linux-amd64"
      sha256 "268876491a4233f77f74af9586e02ad9d806775d63bcacd37b65089418ac5027"
    end
  end

  def install
    bin.install Dir["herd-*"].first => "herd"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/herd version")
  end
end
