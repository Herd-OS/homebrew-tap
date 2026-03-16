class Herd < Formula
  desc "GitHub-native orchestration for agentic development systems"
  homepage "https://github.com/Herd-OS/herd"
  version "0.1.0-rc.19"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Herd-OS/herd/releases/download/v0.1.0-rc.19/herd-darwin-arm64"
      sha256 "e23dad78ff7286fe5c61c135bb01bd0c3ea7736fe20937e3b0b8d0550029fd54"
    else
      url "https://github.com/Herd-OS/herd/releases/download/v0.1.0-rc.19/herd-darwin-amd64"
      sha256 "829f9eae172335bacfaa5e3ccaca318f3cb23f9eeb0b502f1ea290054d95ffa7"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Herd-OS/herd/releases/download/v0.1.0-rc.19/herd-linux-arm64"
      sha256 "fae90ab478afa75802ee29eaa865455332999af930746bd93b9b839d894d15f4"
    else
      url "https://github.com/Herd-OS/herd/releases/download/v0.1.0-rc.19/herd-linux-amd64"
      sha256 "f836419ed3c0997561c6e8329747924d0808e041af1f0453d3b1e76346b4ec70"
    end
  end

  def install
    bin.install Dir["herd-*"].first => "herd"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/herd version")
  end
end
