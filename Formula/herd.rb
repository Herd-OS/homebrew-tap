class Herd < Formula
  desc "GitHub-native orchestration for agentic development systems"
  homepage "https://github.com/Herd-OS/herd"
  version "0.8.18"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Herd-OS/herd/releases/download/v0.8.18/herd-darwin-arm64"
      sha256 "de5e5eb66af4c1b4b72c9081c7e2126f313000c505c902debd2d4f04a1e019a3"
    else
      url "https://github.com/Herd-OS/herd/releases/download/v0.8.18/herd-darwin-amd64"
      sha256 "8d4767826479fa2b8dd150f1f04e64ba4f38a89d53d0c27b9c3a03e7083a1c6f"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Herd-OS/herd/releases/download/v0.8.18/herd-linux-arm64"
      sha256 "0073170fce9abfc45cb3c5e2ad4716537b465c32abc37e55a81a694c6a6aff3d"
    else
      url "https://github.com/Herd-OS/herd/releases/download/v0.8.18/herd-linux-amd64"
      sha256 "93cadd7c1b9bae29f7922a3c6bbe5421174ee6fa9b8725e856331d222dd2562d"
    end
  end

  def install
    bin.install Dir["herd-*"].first => "herd"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/herd version")
  end
end
