class Herd < Formula
  desc "GitHub-native orchestration for agentic development systems"
  homepage "https://github.com/Herd-OS/herd"
  version "0.3.12"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Herd-OS/herd/releases/download/v0.3.12/herd-darwin-arm64"
      sha256 "78cf1c12e931fd63e48665f9fd6943861a1836ea144487676443d89bd86c78d8"
    else
      url "https://github.com/Herd-OS/herd/releases/download/v0.3.12/herd-darwin-amd64"
      sha256 "b4c9c3ca306163c23b6ba5bbca8534bd439b8b7783c14f9bb13c2fb72c2f7963"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Herd-OS/herd/releases/download/v0.3.12/herd-linux-arm64"
      sha256 "fabd7aba2700701534c3655978c38e07fb03f6bb05d32e954dad2fd6112fcd9b"
    else
      url "https://github.com/Herd-OS/herd/releases/download/v0.3.12/herd-linux-amd64"
      sha256 "2dd16bdf297e8c645a5b42bad8253b4cbde3110c204e423659164160e0b2f639"
    end
  end

  def install
    bin.install Dir["herd-*"].first => "herd"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/herd version")
  end
end
