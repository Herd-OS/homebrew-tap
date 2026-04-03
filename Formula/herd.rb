class Herd < Formula
  desc "GitHub-native orchestration for agentic development systems"
  homepage "https://github.com/Herd-OS/herd"
  version "0.3.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Herd-OS/herd/releases/download/v0.3.0/herd-darwin-arm64"
      sha256 "3332e19f6341d4c1f4e7e69ef7c38a92378a9f22f98228991a1fe2b059944b26"
    else
      url "https://github.com/Herd-OS/herd/releases/download/v0.3.0/herd-darwin-amd64"
      sha256 "c1d05a62047f1a52e8bd861f690a56aa4fa70a2a09efd9aeccb46caa2c05c680"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Herd-OS/herd/releases/download/v0.3.0/herd-linux-arm64"
      sha256 "1d5cd31d29ab5d00cbcb9b62ef321d1cf7fe4d8b97d3354d9464324d4b8199b6"
    else
      url "https://github.com/Herd-OS/herd/releases/download/v0.3.0/herd-linux-amd64"
      sha256 "56828c9664b80eb3ec8bfa62c9b86b4cce9a8a4adc8ba994040e462f47dd9be7"
    end
  end

  def install
    bin.install Dir["herd-*"].first => "herd"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/herd version")
  end
end
