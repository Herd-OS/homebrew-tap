class Herd < Formula
  desc "GitHub-native orchestration for agentic development systems"
  homepage "https://github.com/Herd-OS/herd"
  version "0.2.0-rc.3"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Herd-OS/herd/releases/download/v0.2.0-rc.3/herd-darwin-arm64"
      sha256 "9483398d27966e24fdeb46ace66858e36f8b6d169272ed4587fda8824b743ad0"
    else
      url "https://github.com/Herd-OS/herd/releases/download/v0.2.0-rc.3/herd-darwin-amd64"
      sha256 "0e2561286d1da451a0b38169d4c8fb70205171f1afd2440cfff00e8676e4fe1d"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Herd-OS/herd/releases/download/v0.2.0-rc.3/herd-linux-arm64"
      sha256 "35005770fdd470f9d2f789175d4caf1341de230a9a778f082d9eb69a3942a477"
    else
      url "https://github.com/Herd-OS/herd/releases/download/v0.2.0-rc.3/herd-linux-amd64"
      sha256 "1e5aebcc2e4889c169bbc3e76a2642d1316c52cdf97ad2003cc37a007ef13681"
    end
  end

  def install
    bin.install Dir["herd-*"].first => "herd"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/herd version")
  end
end
