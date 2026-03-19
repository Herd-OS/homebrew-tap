class Herd < Formula
  desc "GitHub-native orchestration for agentic development systems"
  homepage "https://github.com/Herd-OS/herd"
  version "0.2.0-rc.7"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Herd-OS/herd/releases/download/v0.2.0-rc.7/herd-darwin-arm64"
      sha256 "648e36720069517643afc4ef26ca74d665ba7841b9e0e67894c3ffab5fa1def1"
    else
      url "https://github.com/Herd-OS/herd/releases/download/v0.2.0-rc.7/herd-darwin-amd64"
      sha256 "941de9136c092f1df73b02146313179d54298ee677d34742d81f3f2bb2ef3351"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Herd-OS/herd/releases/download/v0.2.0-rc.7/herd-linux-arm64"
      sha256 "fc75047eeb6927cbb86d43c75787f65b861155e7791ac6f012817b552c5e3e06"
    else
      url "https://github.com/Herd-OS/herd/releases/download/v0.2.0-rc.7/herd-linux-amd64"
      sha256 "598896b86a2636d5bfdeaaa87d3641f1063d8f723375d47c14655bc72e293a5c"
    end
  end

  def install
    bin.install Dir["herd-*"].first => "herd"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/herd version")
  end
end
