class Herd < Formula
  desc "GitHub-native orchestration for agentic development systems"
  homepage "https://github.com/Herd-OS/herd"
  version "0.8.15"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Herd-OS/herd/releases/download/v0.8.15/herd-darwin-arm64"
      sha256 "7301e629a72c21d212350d2ab050f91dc3bff455d93783389c1358035be1a647"
    else
      url "https://github.com/Herd-OS/herd/releases/download/v0.8.15/herd-darwin-amd64"
      sha256 "1495c995c277f696fdf8d9edececdc9c3f5650b4800345b6dd35ae2a7fb634d2"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Herd-OS/herd/releases/download/v0.8.15/herd-linux-arm64"
      sha256 "5b293d0f29e155b159bbcd1b9b00df524c510a7782686ded8c1155f2e72da728"
    else
      url "https://github.com/Herd-OS/herd/releases/download/v0.8.15/herd-linux-amd64"
      sha256 "e2f6102b3faa1e0f615c87b362e2851aa5c73ce827f3be0500a44bf0475c2748"
    end
  end

  def install
    bin.install Dir["herd-*"].first => "herd"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/herd version")
  end
end
