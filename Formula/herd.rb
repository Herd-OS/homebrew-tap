class Herd < Formula
  desc "GitHub-native orchestration for agentic development systems"
  homepage "https://github.com/Herd-OS/herd"
  version "0.8.16"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Herd-OS/herd/releases/download/v0.8.16/herd-darwin-arm64"
      sha256 "afc7964d70295a2793b6e5da2e5c5f08126a577bf0bcf49e2d12c9f7419be774"
    else
      url "https://github.com/Herd-OS/herd/releases/download/v0.8.16/herd-darwin-amd64"
      sha256 "d2034183f4672ee6276d0e5ed6dc055acafa2ae8ee9d5f802ea4e7e635043114"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Herd-OS/herd/releases/download/v0.8.16/herd-linux-arm64"
      sha256 "e0f96db7ce6d7366a4a87bb97ab786431d536a56d04818e027e040b85f7cbfbf"
    else
      url "https://github.com/Herd-OS/herd/releases/download/v0.8.16/herd-linux-amd64"
      sha256 "1a78e0fbb93d0b4793d7fe0e179688702b640c2ff6ec62541f0f9a92fc8ed76b"
    end
  end

  def install
    bin.install Dir["herd-*"].first => "herd"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/herd version")
  end
end
