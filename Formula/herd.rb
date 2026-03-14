class Herd < Formula
  desc "GitHub-native orchestration for agentic development systems"
  homepage "https://github.com/Herd-OS/herd"
  version "0.1.0-rc.4"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Herd-OS/herd/releases/download/v0.1.0-rc.4/herd-darwin-arm64"
      sha256 "f787a66a81afa51e6d24aea5a853a2967c2373cc24255014365f005d6626efe1"
    else
      url "https://github.com/Herd-OS/herd/releases/download/v0.1.0-rc.4/herd-darwin-amd64"
      sha256 "893ec0fe2af9f61244739641ccd8e8fbbb8e8e5822ef024f666ec3d264fd3995"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Herd-OS/herd/releases/download/v0.1.0-rc.4/herd-linux-arm64"
      sha256 "384c778ae98ecec402115de988da16596d818b527e2b5d38e1027a61afd7b4f0"
    else
      url "https://github.com/Herd-OS/herd/releases/download/v0.1.0-rc.4/herd-linux-amd64"
      sha256 "1fda7e880ba04b4cdfac5bccbfd46ce8fe6ece5d7ac3b0f0a2a31b6f3aa51a85"
    end
  end

  def install
    bin.install Dir["herd-*"].first => "herd"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/herd version")
  end
end
