class Herd < Formula
  desc "GitHub-native orchestration for agentic development systems"
  homepage "https://github.com/Herd-OS/herd"
  version "0.5.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Herd-OS/herd/releases/download/v0.5.2/herd-darwin-arm64"
      sha256 "e92b0ab5ac8d2446690d61b9987ea132e52de5376644a852b2351505c87758ea"
    else
      url "https://github.com/Herd-OS/herd/releases/download/v0.5.2/herd-darwin-amd64"
      sha256 "010cb627e5004a960a77efd45422a5f3d68d073acb8fb885b181a85e7c4dbb8d"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Herd-OS/herd/releases/download/v0.5.2/herd-linux-arm64"
      sha256 "d73c07f5aba06d62d844623ed1c11bf19a89522ad19a44efa19c9476a464c307"
    else
      url "https://github.com/Herd-OS/herd/releases/download/v0.5.2/herd-linux-amd64"
      sha256 "12821e77e70ba07472e232db5ddd56bd7b04e2efe3c7f023772bf45a0b12e949"
    end
  end

  def install
    bin.install Dir["herd-*"].first => "herd"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/herd version")
  end
end
