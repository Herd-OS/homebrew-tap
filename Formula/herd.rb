class Herd < Formula
  desc "GitHub-native orchestration for agentic development systems"
  homepage "https://github.com/Herd-OS/herd"
  version "0.3.16"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Herd-OS/herd/releases/download/v0.3.16/herd-darwin-arm64"
      sha256 "e731c7b5f13517829e0a92a735a70464f820259b6df168a38c6362df98efc30e"
    else
      url "https://github.com/Herd-OS/herd/releases/download/v0.3.16/herd-darwin-amd64"
      sha256 "3188dbfc12f66ee3d2651c87c842ac16083d2709c522eb7db96cdc7475b9bfa2"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Herd-OS/herd/releases/download/v0.3.16/herd-linux-arm64"
      sha256 "8f076e48a56ae35e70e1e92ddb0c48aac00584819ec72b7a6dcde36969d9145d"
    else
      url "https://github.com/Herd-OS/herd/releases/download/v0.3.16/herd-linux-amd64"
      sha256 "90a5400c138940cce15567b34f75e86d2f510a122230a08701bb7823dab8921e"
    end
  end

  def install
    bin.install Dir["herd-*"].first => "herd"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/herd version")
  end
end
