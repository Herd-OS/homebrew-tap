class Herd < Formula
  desc "GitHub-native orchestration for agentic development systems"
  homepage "https://github.com/Herd-OS/herd"
  version "0.3.5"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Herd-OS/herd/releases/download/v0.3.5/herd-darwin-arm64"
      sha256 "2a8a17731f80ac821283278af2fe8099dbf10b171f7470d06d35a9ae11c2a622"
    else
      url "https://github.com/Herd-OS/herd/releases/download/v0.3.5/herd-darwin-amd64"
      sha256 "48edf8b3ed2b738166822ac4e9ddd6b1f2707311e6d225ae32dc2e14b8e9d0a6"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Herd-OS/herd/releases/download/v0.3.5/herd-linux-arm64"
      sha256 "e86a808927571b73c4e4381f9c1d0121bc45522ba63fe37fdc6866a7197d341d"
    else
      url "https://github.com/Herd-OS/herd/releases/download/v0.3.5/herd-linux-amd64"
      sha256 "ff1c5aa74066d3992a013ed3710e1725124eb719acf72988bbfbdbda45cca176"
    end
  end

  def install
    bin.install Dir["herd-*"].first => "herd"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/herd version")
  end
end
