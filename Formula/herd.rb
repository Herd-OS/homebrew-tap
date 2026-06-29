class Herd < Formula
  desc "GitHub-native orchestration for agentic development systems"
  homepage "https://github.com/Herd-OS/herd"
  version "0.8.19"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Herd-OS/herd/releases/download/v0.8.19/herd-darwin-arm64"
      sha256 "2236e0ee191790acd5a9e6bced608d89cb8be0ab0ecfba26c1bebdd82829c276"
    else
      url "https://github.com/Herd-OS/herd/releases/download/v0.8.19/herd-darwin-amd64"
      sha256 "82d05e743025a5bc05b4d8b6b0db638e535627980eebec9009d6ca080acba797"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Herd-OS/herd/releases/download/v0.8.19/herd-linux-arm64"
      sha256 "5414cc2b0437e7780e393118622fdc11c9a107f3feee4c55a928474847eb8009"
    else
      url "https://github.com/Herd-OS/herd/releases/download/v0.8.19/herd-linux-amd64"
      sha256 "6d8ea04310ca3796f5f077f8f710a725502132a7f193c80ff552d5d3a8072e52"
    end
  end

  def install
    bin.install Dir["herd-*"].first => "herd"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/herd version")
  end
end
