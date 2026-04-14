class Herd < Formula
  desc "GitHub-native orchestration for agentic development systems"
  homepage "https://github.com/Herd-OS/herd"
  version "0.3.10"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Herd-OS/herd/releases/download/v0.3.10/herd-darwin-arm64"
      sha256 "e81f593593c9ecd350c1a6f63f669a449c17f28743c3b1f140826fa3e1f440a1"
    else
      url "https://github.com/Herd-OS/herd/releases/download/v0.3.10/herd-darwin-amd64"
      sha256 "dc0494df7ac6ad0a9f1b2e37a27e36998680084cc9c8e2eeb9da598b8343fb9e"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Herd-OS/herd/releases/download/v0.3.10/herd-linux-arm64"
      sha256 "15286eb2096a3cf7dd6ca2fd3c8aa22bdfa1610c01f114233e40d0f24358f9bf"
    else
      url "https://github.com/Herd-OS/herd/releases/download/v0.3.10/herd-linux-amd64"
      sha256 "2b95cc53288f7ab10cadf79929b92532094bb918546a52fa1267f5544c016aa5"
    end
  end

  def install
    bin.install Dir["herd-*"].first => "herd"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/herd version")
  end
end
