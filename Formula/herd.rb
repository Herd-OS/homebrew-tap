class Herd < Formula
  desc "GitHub-native orchestration for agentic development systems"
  homepage "https://github.com/Herd-OS/herd"
  version "0.8.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Herd-OS/herd/releases/download/v0.8.0/herd-darwin-arm64"
      sha256 "43cccbc2f4e3424f94472108c30ef1729048f2a6e3d824f8f77ea2b66eb04885"
    else
      url "https://github.com/Herd-OS/herd/releases/download/v0.8.0/herd-darwin-amd64"
      sha256 "deda024af8955cd9ee778fc07957fe6d9bff06fe3d9109c4835aa474424a358f"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Herd-OS/herd/releases/download/v0.8.0/herd-linux-arm64"
      sha256 "8684f431f8f26674d1aa901688af5c4d080fa1c01d55f004967b54078b4b8e95"
    else
      url "https://github.com/Herd-OS/herd/releases/download/v0.8.0/herd-linux-amd64"
      sha256 "5c68073cad0a6f487e61b6ed0180abbafdcd2486cfc77c371074a576cc10e6c9"
    end
  end

  def install
    bin.install Dir["herd-*"].first => "herd"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/herd version")
  end
end
