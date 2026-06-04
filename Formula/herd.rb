class Herd < Formula
  desc "GitHub-native orchestration for agentic development systems"
  homepage "https://github.com/Herd-OS/herd"
  version "0.8.9"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Herd-OS/herd/releases/download/v0.8.9/herd-darwin-arm64"
      sha256 "34607a2bb1044d9c24706353229e00107d423ee5f5c2bc8e61fd5fc0f515221c"
    else
      url "https://github.com/Herd-OS/herd/releases/download/v0.8.9/herd-darwin-amd64"
      sha256 "5257cb51c9d247aca8de9dba26c17def7737c41a541f353fd531ca4499483106"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Herd-OS/herd/releases/download/v0.8.9/herd-linux-arm64"
      sha256 "6761aa002efe848798038218e192dcfe58f68473247066d7e66b6e731bf4b8c1"
    else
      url "https://github.com/Herd-OS/herd/releases/download/v0.8.9/herd-linux-amd64"
      sha256 "27137b020d0044a8b55ed63f74fe1b8bbd930c6e14a4f3958a4283fbdad7869e"
    end
  end

  def install
    bin.install Dir["herd-*"].first => "herd"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/herd version")
  end
end
