class Herd < Formula
  desc "GitHub-native orchestration for agentic development systems"
  homepage "https://github.com/Herd-OS/herd"
  version "0.4.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Herd-OS/herd/releases/download/v0.4.1/herd-darwin-arm64"
      sha256 "a27a468c79cad0612c78a11c27083591fa2ffde63ee91593731f0ff5dc161dda"
    else
      url "https://github.com/Herd-OS/herd/releases/download/v0.4.1/herd-darwin-amd64"
      sha256 "3b79b783af2ce7ad8fafd231f738013d51f19a8402324543a6c54896c8ab4e8e"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Herd-OS/herd/releases/download/v0.4.1/herd-linux-arm64"
      sha256 "f4764c46541053415fabee205fe9a66d4e987e0f71886d16812e83f8fac49fe1"
    else
      url "https://github.com/Herd-OS/herd/releases/download/v0.4.1/herd-linux-amd64"
      sha256 "96ca5b62f2a1891db96bf4b309c84aac71a77fb73b34d07c49ddd177631e6dc2"
    end
  end

  def install
    bin.install Dir["herd-*"].first => "herd"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/herd version")
  end
end
