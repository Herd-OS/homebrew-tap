class Herd < Formula
  desc "GitHub-native orchestration for agentic development systems"
  homepage "https://github.com/Herd-OS/herd"
  version "0.7.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Herd-OS/herd/releases/download/v0.7.2/herd-darwin-arm64"
      sha256 "803b64145eb6f21fce4c9f8c7417e1a0cd3d054e053ceba5a38f8fac3dabaf49"
    else
      url "https://github.com/Herd-OS/herd/releases/download/v0.7.2/herd-darwin-amd64"
      sha256 "0c7249b761174c9607468cb42dbcc3ca57b9888e240abb6728f1f03bfe963381"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Herd-OS/herd/releases/download/v0.7.2/herd-linux-arm64"
      sha256 "ab70570c46e1aab0c81cbe9e88aa451ffdf47d8bebea3bac5a7ab2a255234920"
    else
      url "https://github.com/Herd-OS/herd/releases/download/v0.7.2/herd-linux-amd64"
      sha256 "4f2fc202ea7ee817a1bf8526be261e84d275f4eb2958f9e942b7348987fd8274"
    end
  end

  def install
    bin.install Dir["herd-*"].first => "herd"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/herd version")
  end
end
