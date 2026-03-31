class Herd < Formula
  desc "GitHub-native orchestration for agentic development systems"
  homepage "https://github.com/Herd-OS/herd"
  version "0.2.11"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Herd-OS/herd/releases/download/v0.2.11/herd-darwin-arm64"
      sha256 "05932dfcd1a5142c219e5bd6744bfdd33ba14dfaf5f07b90d156881b78ee4299"
    else
      url "https://github.com/Herd-OS/herd/releases/download/v0.2.11/herd-darwin-amd64"
      sha256 "4444d01e0c7e934b17f208a052fdacaf1fd1fa6e6d12d36141e55ef81733b84a"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Herd-OS/herd/releases/download/v0.2.11/herd-linux-arm64"
      sha256 "04e94f46d659b8b01f1442363b9d5d3c941abd1a6117cfffdcb1160b1aaf5f29"
    else
      url "https://github.com/Herd-OS/herd/releases/download/v0.2.11/herd-linux-amd64"
      sha256 "90202e3a40f409ec6fe4e64767e0f3b0314bd02866a4b1b263a2dab6d01d410a"
    end
  end

  def install
    bin.install Dir["herd-*"].first => "herd"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/herd version")
  end
end
