class Herd < Formula
  desc "GitHub-native orchestration for agentic development systems"
  homepage "https://github.com/Herd-OS/herd"
  version "0.2.8"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Herd-OS/herd/releases/download/v0.2.8/herd-darwin-arm64"
      sha256 "90f36960226065607920b24dd3ccf546d646a9ae7e15f0ab2b547aa527fe1c30"
    else
      url "https://github.com/Herd-OS/herd/releases/download/v0.2.8/herd-darwin-amd64"
      sha256 "f6b1dddd0f1e6a2dbd6b271366bd99a548ec6d07288784df8e57fd9044521971"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Herd-OS/herd/releases/download/v0.2.8/herd-linux-arm64"
      sha256 "a97336661bfd31b950b0c93859f27e15de2f8c7eef9e5d6914808a648326025a"
    else
      url "https://github.com/Herd-OS/herd/releases/download/v0.2.8/herd-linux-amd64"
      sha256 "a1eeccc59d22c0b4bf93c5d84bc83f3d349be3649e6a69a7c2f166593833db79"
    end
  end

  def install
    bin.install Dir["herd-*"].first => "herd"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/herd version")
  end
end
