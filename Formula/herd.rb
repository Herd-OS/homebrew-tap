class Herd < Formula
  desc "GitHub-native orchestration for agentic development systems"
  homepage "https://github.com/Herd-OS/herd"
  version "0.8.10"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Herd-OS/herd/releases/download/v0.8.10/herd-darwin-arm64"
      sha256 "76c873464cce9ee84383cabbd97b2b3ae137433172d55b2d67fe528b3695e9b2"
    else
      url "https://github.com/Herd-OS/herd/releases/download/v0.8.10/herd-darwin-amd64"
      sha256 "673fd6898a4ad51d2e818bc98f15d14d92fe87b0e01b25b87a940d3a3ce0c2a6"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Herd-OS/herd/releases/download/v0.8.10/herd-linux-arm64"
      sha256 "bf077724f36df4eb99ab1f1f0a92f587eac2b0ae8bbe3999cf575f026b8be20d"
    else
      url "https://github.com/Herd-OS/herd/releases/download/v0.8.10/herd-linux-amd64"
      sha256 "933bce149a355f3766c68bad0b20d8a705b3d366a36df2977ad7cc33cb3d0d48"
    end
  end

  def install
    bin.install Dir["herd-*"].first => "herd"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/herd version")
  end
end
