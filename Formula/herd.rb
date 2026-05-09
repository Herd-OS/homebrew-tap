class Herd < Formula
  desc "GitHub-native orchestration for agentic development systems"
  homepage "https://github.com/Herd-OS/herd"
  version "0.6.6"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Herd-OS/herd/releases/download/v0.6.6/herd-darwin-arm64"
      sha256 "1b1053c7c16750824160d7d901e93cc63c9b997d8c4588174fda1005ed56c777"
    else
      url "https://github.com/Herd-OS/herd/releases/download/v0.6.6/herd-darwin-amd64"
      sha256 "d2be7d30f878d7ed06d1bcab6e58a74526a5d605655fd8726194c1b87484568a"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Herd-OS/herd/releases/download/v0.6.6/herd-linux-arm64"
      sha256 "f25703beb4a0b353a68f0e0c56e32427160decfcec56e88a6dfd89b00adb9905"
    else
      url "https://github.com/Herd-OS/herd/releases/download/v0.6.6/herd-linux-amd64"
      sha256 "c70a6aa696bbffbe43611cd41fb31b612560ee5625889ad945ecf709c6560cad"
    end
  end

  def install
    bin.install Dir["herd-*"].first => "herd"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/herd version")
  end
end
