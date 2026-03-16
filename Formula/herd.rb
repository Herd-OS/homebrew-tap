class Herd < Formula
  desc "GitHub-native orchestration for agentic development systems"
  homepage "https://github.com/Herd-OS/herd"
  version "0.1.0-rc.22"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Herd-OS/herd/releases/download/v0.1.0-rc.22/herd-darwin-arm64"
      sha256 "83a2359d5f1b4066f770e90f2a5f35dd44c04d6cb14fb92c62f84237d101c393"
    else
      url "https://github.com/Herd-OS/herd/releases/download/v0.1.0-rc.22/herd-darwin-amd64"
      sha256 "c8da8f4c2656453d12f704c52a6e8a8a75484f914db530af32e2c1d1a365bdd5"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Herd-OS/herd/releases/download/v0.1.0-rc.22/herd-linux-arm64"
      sha256 "d030904293dec3b972ad52417fafd3b002b600494c37e313d172b5bd7acd571a"
    else
      url "https://github.com/Herd-OS/herd/releases/download/v0.1.0-rc.22/herd-linux-amd64"
      sha256 "5494aecd4f5324fed3c1f2490cfff4982c48db5dffd35a78b1783a2f252b6b39"
    end
  end

  def install
    bin.install Dir["herd-*"].first => "herd"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/herd version")
  end
end
