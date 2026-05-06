class Herd < Formula
  desc "GitHub-native orchestration for agentic development systems"
  homepage "https://github.com/Herd-OS/herd"
  version "0.5.3"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Herd-OS/herd/releases/download/v0.5.3/herd-darwin-arm64"
      sha256 "9ba697211203123a43269ac9bfeddc0872ce7c6762cfcf44afbaf326505324eb"
    else
      url "https://github.com/Herd-OS/herd/releases/download/v0.5.3/herd-darwin-amd64"
      sha256 "4279552c0b50b448c0e6df755fb29f19915a91e9e3c49be96474136b2a5deee7"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Herd-OS/herd/releases/download/v0.5.3/herd-linux-arm64"
      sha256 "ab62e6274b70db285655959554a7e91cd19a0aabce01ccc280fd5e132b452c94"
    else
      url "https://github.com/Herd-OS/herd/releases/download/v0.5.3/herd-linux-amd64"
      sha256 "fe33ef756b255621b14800e6b6fd796639acef5e1493ac0f734ff279ab0c2bb2"
    end
  end

  def install
    bin.install Dir["herd-*"].first => "herd"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/herd version")
  end
end
