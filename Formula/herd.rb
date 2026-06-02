class Herd < Formula
  desc "GitHub-native orchestration for agentic development systems"
  homepage "https://github.com/Herd-OS/herd"
  version "0.8.3"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Herd-OS/herd/releases/download/v0.8.3/herd-darwin-arm64"
      sha256 "67bbeb8ef17d8425f2b942522a3da11e9790198dd8a9bba091266febc0ed26dd"
    else
      url "https://github.com/Herd-OS/herd/releases/download/v0.8.3/herd-darwin-amd64"
      sha256 "e4f50168a9c0618fab2808004e0f33d41e082bb007b99a1124fefb7ea294494b"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Herd-OS/herd/releases/download/v0.8.3/herd-linux-arm64"
      sha256 "e72e30095cb190beb31aab7ef8d728329370836cc70adbb83381b91d3ace3b22"
    else
      url "https://github.com/Herd-OS/herd/releases/download/v0.8.3/herd-linux-amd64"
      sha256 "12c296f6edfd442cb55bad4283f415bdc70c2fc20e566302a3243268f364e026"
    end
  end

  def install
    bin.install Dir["herd-*"].first => "herd"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/herd version")
  end
end
