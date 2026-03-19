class Herd < Formula
  desc "GitHub-native orchestration for agentic development systems"
  homepage "https://github.com/Herd-OS/herd"
  version "0.2.0-rc.4"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Herd-OS/herd/releases/download/v0.2.0-rc.4/herd-darwin-arm64"
      sha256 "aa6fa2bf291e98b770e4a87ae832bc575ab8c7f687932be76fca6b9fae68d8a8"
    else
      url "https://github.com/Herd-OS/herd/releases/download/v0.2.0-rc.4/herd-darwin-amd64"
      sha256 "0b80bca6dd9800858a6ce44070e370c7315e61d7a3486c9c2b98d25371b22d15"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Herd-OS/herd/releases/download/v0.2.0-rc.4/herd-linux-arm64"
      sha256 "fabaae99ed231104972b2eb4ef8395f85adc5e05942ea95f20639e620c981b78"
    else
      url "https://github.com/Herd-OS/herd/releases/download/v0.2.0-rc.4/herd-linux-amd64"
      sha256 "eaea6cfe3d357f32a126cf8053883338ef56af0c8336e3b3c1aa3effc8def5c7"
    end
  end

  def install
    bin.install Dir["herd-*"].first => "herd"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/herd version")
  end
end
