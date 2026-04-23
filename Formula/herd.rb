class Herd < Formula
  desc "GitHub-native orchestration for agentic development systems"
  homepage "https://github.com/Herd-OS/herd"
  version "0.4.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Herd-OS/herd/releases/download/v0.4.0/herd-darwin-arm64"
      sha256 "08ac2ee5df3881837162df1cd2460d331c3eff04ef16e7b2ecee6afe71762f55"
    else
      url "https://github.com/Herd-OS/herd/releases/download/v0.4.0/herd-darwin-amd64"
      sha256 "38fb4ffec7b5df53d004661236cf8b38d534b50399221abf1881b277142f2b0c"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Herd-OS/herd/releases/download/v0.4.0/herd-linux-arm64"
      sha256 "e921b10e2d0d81d313a1635a5c89b31637a1f82218db6de55f52011974f94938"
    else
      url "https://github.com/Herd-OS/herd/releases/download/v0.4.0/herd-linux-amd64"
      sha256 "eaffeaa8fc085320e94702d1ae2696067b274ac75d9c73b2e2c674ca7a0a2105"
    end
  end

  def install
    bin.install Dir["herd-*"].first => "herd"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/herd version")
  end
end
