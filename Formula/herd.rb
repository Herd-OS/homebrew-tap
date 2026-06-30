class Herd < Formula
  desc "GitHub-native orchestration for agentic development systems"
  homepage "https://github.com/Herd-OS/herd"
  version "0.8.22"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Herd-OS/herd/releases/download/v0.8.22/herd-darwin-arm64"
      sha256 "2c3578f04980b105b0e6549c53692926bdc17af38354acedce1800f42422c1db"
    else
      url "https://github.com/Herd-OS/herd/releases/download/v0.8.22/herd-darwin-amd64"
      sha256 "229f6752d0201f6ed65fe498966cd5d98831d0e24d90da060408087e5b29b60c"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Herd-OS/herd/releases/download/v0.8.22/herd-linux-arm64"
      sha256 "6332eb475f1963ef6803d673dc67923a6ccfc0124e7bee4e313707c4ca54ae62"
    else
      url "https://github.com/Herd-OS/herd/releases/download/v0.8.22/herd-linux-amd64"
      sha256 "4182e219ea7ea5a35f042f63f97d388d17e9343aed310bac85ae8eedddc7437b"
    end
  end

  def install
    bin.install Dir["herd-*"].first => "herd"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/herd version")
  end
end
