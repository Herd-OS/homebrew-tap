class Herd < Formula
  desc "GitHub-native orchestration for agentic development systems"
  homepage "https://github.com/Herd-OS/herd"
  version "0.2.0-rc.8"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Herd-OS/herd/releases/download/v0.2.0-rc.8/herd-darwin-arm64"
      sha256 "1e9decb45d84752a33e0bfbe437981ae603a1ae8e6313b34c5bda3789dc120dc"
    else
      url "https://github.com/Herd-OS/herd/releases/download/v0.2.0-rc.8/herd-darwin-amd64"
      sha256 "e47b25fc7aa7531d82178eb50b804a2fdacd3675182b8cbfe3a51112bc9082c5"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Herd-OS/herd/releases/download/v0.2.0-rc.8/herd-linux-arm64"
      sha256 "1dcd0d4dcf7d99e3694c4c860f61e9ebec7bad5211c3bcfc018e70d7d85a07c4"
    else
      url "https://github.com/Herd-OS/herd/releases/download/v0.2.0-rc.8/herd-linux-amd64"
      sha256 "2c32ae74bfc1aa05a72939cf3ae996146cf5bed730a00020d0b8f742afba2ce3"
    end
  end

  def install
    bin.install Dir["herd-*"].first => "herd"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/herd version")
  end
end
