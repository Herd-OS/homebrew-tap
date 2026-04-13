class Herd < Formula
  desc "GitHub-native orchestration for agentic development systems"
  homepage "https://github.com/Herd-OS/herd"
  version "0.3.8"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Herd-OS/herd/releases/download/v0.3.8/herd-darwin-arm64"
      sha256 "c349b380316b43ded54fde306312b3f6316d022d8a11f2240781b457420a683b"
    else
      url "https://github.com/Herd-OS/herd/releases/download/v0.3.8/herd-darwin-amd64"
      sha256 "2d9c33859cfdc117e37b872bb016b54200c612df80a7add01b4f1493ef462632"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Herd-OS/herd/releases/download/v0.3.8/herd-linux-arm64"
      sha256 "928550b5f973b007c98429338bcae2149edc3f43e92ec024f0e74e21f64173d7"
    else
      url "https://github.com/Herd-OS/herd/releases/download/v0.3.8/herd-linux-amd64"
      sha256 "33cdd9b9155e030a34c3ec56515e3301c278e644aee675ed030e36f011282e69"
    end
  end

  def install
    bin.install Dir["herd-*"].first => "herd"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/herd version")
  end
end
