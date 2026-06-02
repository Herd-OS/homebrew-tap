class Herd < Formula
  desc "GitHub-native orchestration for agentic development systems"
  homepage "https://github.com/Herd-OS/herd"
  version "0.8.4"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Herd-OS/herd/releases/download/v0.8.4/herd-darwin-arm64"
      sha256 "3c189a2d9ecf28776ce502fc7433bdffc3792e5b6c35e6ed49b2e954103a978a"
    else
      url "https://github.com/Herd-OS/herd/releases/download/v0.8.4/herd-darwin-amd64"
      sha256 "e4fb1dfd6746bb5b29126781aadfdfb8f2c3d95316b2cc15a7b65ce513d1712f"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Herd-OS/herd/releases/download/v0.8.4/herd-linux-arm64"
      sha256 "00960ddb35d45566e11d08280abb72279a840d25f63169808a2b9032915a6fb8"
    else
      url "https://github.com/Herd-OS/herd/releases/download/v0.8.4/herd-linux-amd64"
      sha256 "a4439f7d4229f8473be588a4882a925b2ec01ce25dee8f3b9abb8a6020af5af0"
    end
  end

  def install
    bin.install Dir["herd-*"].first => "herd"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/herd version")
  end
end
