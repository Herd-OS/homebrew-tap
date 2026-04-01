class Herd < Formula
  desc "GitHub-native orchestration for agentic development systems"
  homepage "https://github.com/Herd-OS/herd"
  version "0.2.16"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Herd-OS/herd/releases/download/v0.2.16/herd-darwin-arm64"
      sha256 "dcb52bbb4e184beb0e92ffebbbf0965282ccab83406bd69b1c66bf8d72e24418"
    else
      url "https://github.com/Herd-OS/herd/releases/download/v0.2.16/herd-darwin-amd64"
      sha256 "2464544494d8ec446f3087361039cd5f936f57051d45c55076b6a0486f410ba3"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Herd-OS/herd/releases/download/v0.2.16/herd-linux-arm64"
      sha256 "19b3ad183e02155933a85aec98bbbc3e92d9944efe9efb7672ee39a3fdbde6f5"
    else
      url "https://github.com/Herd-OS/herd/releases/download/v0.2.16/herd-linux-amd64"
      sha256 "9f5623885feb4b0188cb291f332d46fccc16b0355587990740cb8a410a23e1d5"
    end
  end

  def install
    bin.install Dir["herd-*"].first => "herd"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/herd version")
  end
end
