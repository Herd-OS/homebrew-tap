class Herd < Formula
  desc "GitHub-native orchestration for agentic development systems"
  homepage "https://github.com/Herd-OS/herd"
  version "0.6.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Herd-OS/herd/releases/download/v0.6.2/herd-darwin-arm64"
      sha256 "7c1d2951fdc1a9f735ad8475da49d8dd1b444ac7f0a23eb045152a15056c6f8a"
    else
      url "https://github.com/Herd-OS/herd/releases/download/v0.6.2/herd-darwin-amd64"
      sha256 "0b74b825c30d7a9c423d76146dce1de15d800e4d1d4b5c65a76248b909d57756"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Herd-OS/herd/releases/download/v0.6.2/herd-linux-arm64"
      sha256 "97162c4adf04389b36258ac213aaebc9f29a6d66e95363323baae63f9f4e9a59"
    else
      url "https://github.com/Herd-OS/herd/releases/download/v0.6.2/herd-linux-amd64"
      sha256 "86e6c703943d4aaa0cc5f9498a9c5c96adff02cfdde6c588ee9c7218a8acc29e"
    end
  end

  def install
    bin.install Dir["herd-*"].first => "herd"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/herd version")
  end
end
