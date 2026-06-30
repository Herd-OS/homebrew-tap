class Herd < Formula
  desc "GitHub-native orchestration for agentic development systems"
  homepage "https://github.com/Herd-OS/herd"
  version "0.8.21"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Herd-OS/herd/releases/download/v0.8.21/herd-darwin-arm64"
      sha256 "32a5f441e5a661b65804b446d6575cf05ec37dfbcdb6dfcae9914c1f03e3ecf6"
    else
      url "https://github.com/Herd-OS/herd/releases/download/v0.8.21/herd-darwin-amd64"
      sha256 "e5d1d60964514600dadbf53cbd60bf43bcaf5c521e90c25cfc3a4ca846b8e76e"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Herd-OS/herd/releases/download/v0.8.21/herd-linux-arm64"
      sha256 "6eb35738d3590313008bfc8df909f498e4e3c6c34140baa383f371a012ebd546"
    else
      url "https://github.com/Herd-OS/herd/releases/download/v0.8.21/herd-linux-amd64"
      sha256 "2df1fa82e476db14fbf4dcf386505b3dda448d6da746628e87b9c17c0c9e0298"
    end
  end

  def install
    bin.install Dir["herd-*"].first => "herd"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/herd version")
  end
end
