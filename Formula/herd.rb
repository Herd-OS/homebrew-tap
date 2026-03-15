class Herd < Formula
  desc "GitHub-native orchestration for agentic development systems"
  homepage "https://github.com/Herd-OS/herd"
  version "0.1.0-rc.11"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Herd-OS/herd/releases/download/v0.1.0-rc.11/herd-darwin-arm64"
      sha256 "ab3bce016db883a64e622bb1d1e022420b8b19a1dc66b62772e2518044c4f025"
    else
      url "https://github.com/Herd-OS/herd/releases/download/v0.1.0-rc.11/herd-darwin-amd64"
      sha256 "bb8fe00541b17201b31e6d76dd40b9722fc28ba58ae19c20a89546c8e77094e1"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Herd-OS/herd/releases/download/v0.1.0-rc.11/herd-linux-arm64"
      sha256 "7a30f4cf98e306ace83d999cce0f46f4ce408fe5d485c0cba1cd012ce695cd6e"
    else
      url "https://github.com/Herd-OS/herd/releases/download/v0.1.0-rc.11/herd-linux-amd64"
      sha256 "0535b29e0a57e1c545d1d477a4d858c26574385b0a79b30c77671c8aff136337"
    end
  end

  def install
    bin.install Dir["herd-*"].first => "herd"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/herd version")
  end
end
