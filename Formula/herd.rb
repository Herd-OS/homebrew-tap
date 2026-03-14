class Herd < Formula
  desc "GitHub-native orchestration for agentic development systems"
  homepage "https://github.com/Herd-OS/herd"
  version "0.1.0-rc.6"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Herd-OS/herd/releases/download/v0.1.0-rc.6/herd-darwin-arm64"
      sha256 "835c5f7dfd04fd2c6358a02b8aeac4f4f50f08f0c7fe04205deaeaa7250271c7"
    else
      url "https://github.com/Herd-OS/herd/releases/download/v0.1.0-rc.6/herd-darwin-amd64"
      sha256 "52ca9eba01c397c7ded791c3a43a936e532119bf9f3b5210474355d729253221"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Herd-OS/herd/releases/download/v0.1.0-rc.6/herd-linux-arm64"
      sha256 "b90f21972960a32b818e5962cdbead2dc7bbb99dbfb66fa9cfa007a01595715e"
    else
      url "https://github.com/Herd-OS/herd/releases/download/v0.1.0-rc.6/herd-linux-amd64"
      sha256 "932f2d9a3994b92ef7c2aca6a6db6ed35efd06c126aed05f69ae3970dd377908"
    end
  end

  def install
    bin.install Dir["herd-*"].first => "herd"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/herd version")
  end
end
