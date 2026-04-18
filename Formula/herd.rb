class Herd < Formula
  desc "GitHub-native orchestration for agentic development systems"
  homepage "https://github.com/Herd-OS/herd"
  version "0.3.13"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Herd-OS/herd/releases/download/v0.3.13/herd-darwin-arm64"
      sha256 "6fdc62c3b3d2227db8f73fe1b8087b3c3b6bbece73a4565352cb3f797b2bed94"
    else
      url "https://github.com/Herd-OS/herd/releases/download/v0.3.13/herd-darwin-amd64"
      sha256 "1ec88d27251d4e551742b856fa51af48e18ee560e9f95e33bc555e7ff1820160"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Herd-OS/herd/releases/download/v0.3.13/herd-linux-arm64"
      sha256 "867d8ffb8f979407f9b41eaa1bf0570e541b953446b202c01f793edbd3ba4d17"
    else
      url "https://github.com/Herd-OS/herd/releases/download/v0.3.13/herd-linux-amd64"
      sha256 "3fa6b5b78f08070d0f257a8cf99deb1906f11896b1155d718c1986c62c05914a"
    end
  end

  def install
    bin.install Dir["herd-*"].first => "herd"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/herd version")
  end
end
