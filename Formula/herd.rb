class Herd < Formula
  desc "GitHub-native orchestration for agentic development systems"
  homepage "https://github.com/Herd-OS/herd"
  version "0.8.26"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Herd-OS/herd/releases/download/v0.8.26/herd-darwin-arm64"
      sha256 "48b41a5a7aa07fe9d2bdeac2e3a374db6d8b7c728de4b3b6494afb8942f18b7e"
    else
      url "https://github.com/Herd-OS/herd/releases/download/v0.8.26/herd-darwin-amd64"
      sha256 "5601d07148a41c29bbd72b0a40ab69951b26561c6e98d0f7ef308cee520e6ead"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Herd-OS/herd/releases/download/v0.8.26/herd-linux-arm64"
      sha256 "6cace1f3805770e7935d6aae23d129cceabb10ab51421fa6fcf8059cfd965b86"
    else
      url "https://github.com/Herd-OS/herd/releases/download/v0.8.26/herd-linux-amd64"
      sha256 "b151e8993cb82a13af786f7056df8f0f542dcd34aa540520013eb2e56e11afb4"
    end
  end

  def install
    bin.install Dir["herd-*"].first => "herd"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/herd version")
  end
end
