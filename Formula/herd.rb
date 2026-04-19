class Herd < Formula
  desc "GitHub-native orchestration for agentic development systems"
  homepage "https://github.com/Herd-OS/herd"
  version "0.3.17"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Herd-OS/herd/releases/download/v0.3.17/herd-darwin-arm64"
      sha256 "d1b57c1ae64d9ee19b229a30ed0381084a28d7397ed11de3bc774f954e84ef98"
    else
      url "https://github.com/Herd-OS/herd/releases/download/v0.3.17/herd-darwin-amd64"
      sha256 "1f7eb706cb82b7e9cf93ef4e7a472d84905088d94886f4d77d1f56a09f268d2d"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Herd-OS/herd/releases/download/v0.3.17/herd-linux-arm64"
      sha256 "bed3632649a478f88f4270b76cff1400921051a5646e1e04daec02f2e5575271"
    else
      url "https://github.com/Herd-OS/herd/releases/download/v0.3.17/herd-linux-amd64"
      sha256 "11a6d732b3d3e370af57e825468f99cd8111458ecbff49ef6078d1df14d392cd"
    end
  end

  def install
    bin.install Dir["herd-*"].first => "herd"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/herd version")
  end
end
