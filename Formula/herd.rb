class Herd < Formula
  desc "GitHub-native orchestration for agentic development systems"
  homepage "https://github.com/Herd-OS/herd"
  version "0.8.5"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Herd-OS/herd/releases/download/v0.8.5/herd-darwin-arm64"
      sha256 "f36188305afb8f2ab9b36cf1cc37d4cc64859c67d44ea8949b03e194668d76f6"
    else
      url "https://github.com/Herd-OS/herd/releases/download/v0.8.5/herd-darwin-amd64"
      sha256 "5fe6ed38795a97f61698ea041e29a2bd0d95eb012981d8ee4257128d7df85ff7"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Herd-OS/herd/releases/download/v0.8.5/herd-linux-arm64"
      sha256 "e3dfe5f4da0e3bf15ce3255524c96cc5cd3e4529185f85f4e15b991cf292dfa0"
    else
      url "https://github.com/Herd-OS/herd/releases/download/v0.8.5/herd-linux-amd64"
      sha256 "75091414148ae1dba27ec840f58ff1ea976384aef958b815d2c634b33254b18b"
    end
  end

  def install
    bin.install Dir["herd-*"].first => "herd"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/herd version")
  end
end
