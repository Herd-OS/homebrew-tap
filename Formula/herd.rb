class Herd < Formula
  desc "GitHub-native orchestration for agentic development systems"
  homepage "https://github.com/Herd-OS/herd"
  version "0.2.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Herd-OS/herd/releases/download/v0.2.0/herd-darwin-arm64"
      sha256 "b6989263153c06af087d1e7461ead8ddeb35a3e6bb7be26779f8d5a14bd652a0"
    else
      url "https://github.com/Herd-OS/herd/releases/download/v0.2.0/herd-darwin-amd64"
      sha256 "1c04bad55729c3a185e55f7bca0d7083d58c40360d7ba550914232e37682f491"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Herd-OS/herd/releases/download/v0.2.0/herd-linux-arm64"
      sha256 "3bddab803d70580b0180e6cbe096221d58a8b40d090b7c70d3f5281b69ed7743"
    else
      url "https://github.com/Herd-OS/herd/releases/download/v0.2.0/herd-linux-amd64"
      sha256 "70be06a8d4a9a90ba7d966414f0411b0e2f47cd7e9607f3f92d41a44c3adb7a2"
    end
  end

  def install
    bin.install Dir["herd-*"].first => "herd"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/herd version")
  end
end
