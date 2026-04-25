class Herd < Formula
  desc "GitHub-native orchestration for agentic development systems"
  homepage "https://github.com/Herd-OS/herd"
  version "0.4.3"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Herd-OS/herd/releases/download/v0.4.3/herd-darwin-arm64"
      sha256 "fd85c74aa817dd4162b410b69aca601622dd4a8f71d5ea2e02c84d9783887784"
    else
      url "https://github.com/Herd-OS/herd/releases/download/v0.4.3/herd-darwin-amd64"
      sha256 "99ee314a80622873640734ee90ea0fad46b2b591980e3f0737cb9bd68cadeeb8"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Herd-OS/herd/releases/download/v0.4.3/herd-linux-arm64"
      sha256 "7a0007dcceccd26516e1167c6545ae8534ba9079a3eb6f70512b8572418e1748"
    else
      url "https://github.com/Herd-OS/herd/releases/download/v0.4.3/herd-linux-amd64"
      sha256 "b9b11cddd1b479b7246c353396f63b000d6cdfa8c72d3689c5146d2ad24a57bf"
    end
  end

  def install
    bin.install Dir["herd-*"].first => "herd"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/herd version")
  end
end
