class Herd < Formula
  desc "GitHub-native orchestration for agentic development systems"
  homepage "https://github.com/Herd-OS/herd"
  version "0.2.6"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Herd-OS/herd/releases/download/v0.2.6/herd-darwin-arm64"
      sha256 "2877e17fab02a0e4d6df1274dc875a6916119153449ed8e9de6f652712fbaa4b"
    else
      url "https://github.com/Herd-OS/herd/releases/download/v0.2.6/herd-darwin-amd64"
      sha256 "7ac5df9c4ef416717c9064e276942f39fb6f94f725733ce21902b7ae665905d8"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Herd-OS/herd/releases/download/v0.2.6/herd-linux-arm64"
      sha256 "4e7400548554ac841f9cee71fbb71a009251df28857ca7347ce8708118c0f31d"
    else
      url "https://github.com/Herd-OS/herd/releases/download/v0.2.6/herd-linux-amd64"
      sha256 "12e2e0c1651a3a2fbde96191504044805781d23b2c7f90e3c272835b8b529613"
    end
  end

  def install
    bin.install Dir["herd-*"].first => "herd"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/herd version")
  end
end
