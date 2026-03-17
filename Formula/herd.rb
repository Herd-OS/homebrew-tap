class Herd < Formula
  desc "GitHub-native orchestration for agentic development systems"
  homepage "https://github.com/Herd-OS/herd"
  version "0.1.0-rc.25"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Herd-OS/herd/releases/download/v0.1.0-rc.25/herd-darwin-arm64"
      sha256 "3d794a51668aa75459370db46c50ac4a9c1bc943a1a2bb5b4118c4ff47fdd1bf"
    else
      url "https://github.com/Herd-OS/herd/releases/download/v0.1.0-rc.25/herd-darwin-amd64"
      sha256 "8047bb20df64c0ffb856272f9a28a5914b292281bfa98bbf1b49fe2a9e42d60b"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Herd-OS/herd/releases/download/v0.1.0-rc.25/herd-linux-arm64"
      sha256 "16e46d04729b092396423fcf0867cf08f829ee76f067013622247e6c7bd693ce"
    else
      url "https://github.com/Herd-OS/herd/releases/download/v0.1.0-rc.25/herd-linux-amd64"
      sha256 "afd5e5e325976dd308733a1c6c47d0b3c136ae3e1268638657f0666de880eaea"
    end
  end

  def install
    bin.install Dir["herd-*"].first => "herd"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/herd version")
  end
end
