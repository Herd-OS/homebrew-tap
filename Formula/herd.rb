class Herd < Formula
  desc "GitHub-native orchestration for agentic development systems"
  homepage "https://github.com/Herd-OS/herd"
  version "0.1.0-rc.18"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Herd-OS/herd/releases/download/v0.1.0-rc.18/herd-darwin-arm64"
      sha256 "39717493d312601ce88f9fbc0bd7cb00d66221ee851f131f0287803c5ac4600d"
    else
      url "https://github.com/Herd-OS/herd/releases/download/v0.1.0-rc.18/herd-darwin-amd64"
      sha256 "f5d6a80852ba2b51cffbf41c0d38c726c0977ea01b0507563bef444b041f1759"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Herd-OS/herd/releases/download/v0.1.0-rc.18/herd-linux-arm64"
      sha256 "68bbdd02fbec9779967ab94af9c85af16032e44fcaf95f1af0e6d8885b1840dd"
    else
      url "https://github.com/Herd-OS/herd/releases/download/v0.1.0-rc.18/herd-linux-amd64"
      sha256 "9c194da13a953e5193ace043c5db69bffae0cd81c26e797db3d8d053ae112dce"
    end
  end

  def install
    bin.install Dir["herd-*"].first => "herd"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/herd version")
  end
end
