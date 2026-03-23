class Herd < Formula
  desc "GitHub-native orchestration for agentic development systems"
  homepage "https://github.com/Herd-OS/herd"
  version "0.2.7"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Herd-OS/herd/releases/download/v0.2.7/herd-darwin-arm64"
      sha256 "07e004cdbf4e855f0acde3a3edeabe16e4cb0de833bcb9c1f68f9fe5aa0db883"
    else
      url "https://github.com/Herd-OS/herd/releases/download/v0.2.7/herd-darwin-amd64"
      sha256 "223f295716b9badf036a3ba7aee379d59f26a206476308befa030464830b1266"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Herd-OS/herd/releases/download/v0.2.7/herd-linux-arm64"
      sha256 "de63648ee1eaadd989a5f9d94ba91dc06deacb9de6af7dc5d4b62907974b73cc"
    else
      url "https://github.com/Herd-OS/herd/releases/download/v0.2.7/herd-linux-amd64"
      sha256 "d7e3ebd086f1e08283381416d8f63f84495c50ca87f87462d3289a9dd0a5bac3"
    end
  end

  def install
    bin.install Dir["herd-*"].first => "herd"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/herd version")
  end
end
