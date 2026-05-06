class Herd < Formula
  desc "GitHub-native orchestration for agentic development systems"
  homepage "https://github.com/Herd-OS/herd"
  version "0.5.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Herd-OS/herd/releases/download/v0.5.0/herd-darwin-arm64"
      sha256 "b84697579b79062fd23936d620a524b458cba589b451d43a9612c40888660e39"
    else
      url "https://github.com/Herd-OS/herd/releases/download/v0.5.0/herd-darwin-amd64"
      sha256 "b58b90516d150d9274921670fbc933f5e77608cc7093773d2d43e5a058c05709"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Herd-OS/herd/releases/download/v0.5.0/herd-linux-arm64"
      sha256 "2ceee1b15760f38ac0800b4ea7c7735035ecc33cdce85e8db18eda85ce850f74"
    else
      url "https://github.com/Herd-OS/herd/releases/download/v0.5.0/herd-linux-amd64"
      sha256 "69c3e6823aabd4c849996cd8f09d47332961a046cca6172ddde5b434be01cc4b"
    end
  end

  def install
    bin.install Dir["herd-*"].first => "herd"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/herd version")
  end
end
