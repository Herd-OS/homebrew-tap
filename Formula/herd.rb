class Herd < Formula
  desc "GitHub-native orchestration for agentic development systems"
  homepage "https://github.com/Herd-OS/herd"
  version "0.8.28"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Herd-OS/herd/releases/download/v0.8.28/herd-darwin-arm64"
      sha256 "cc2a688fc13d59204db25fcc5b626fc51a25107d27e0cb26a1e2b87b73574c71"
    else
      url "https://github.com/Herd-OS/herd/releases/download/v0.8.28/herd-darwin-amd64"
      sha256 "e64a4e81c539880d317bc35ae9e1d91a535919dffd2687ccfbc7507f499def32"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Herd-OS/herd/releases/download/v0.8.28/herd-linux-arm64"
      sha256 "2dbbf4f5530e1ee9e98eece92ef5dfeb4258b0b9ff8a8f3fae33277cb93a420a"
    else
      url "https://github.com/Herd-OS/herd/releases/download/v0.8.28/herd-linux-amd64"
      sha256 "cb965613a3bc2f47eac1eaf6f25a00550de4c78ea2b56114daff9691b8f5166f"
    end
  end

  def install
    bin.install Dir["herd-*"].first => "herd"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/herd version")
  end
end
