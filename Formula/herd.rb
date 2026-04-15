class Herd < Formula
  desc "GitHub-native orchestration for agentic development systems"
  homepage "https://github.com/Herd-OS/herd"
  version "0.3.11"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Herd-OS/herd/releases/download/v0.3.11/herd-darwin-arm64"
      sha256 "8edcc6a7f24bd359915aa2f231caf9073a88396863d3fc7cde1b52eea57e7ea2"
    else
      url "https://github.com/Herd-OS/herd/releases/download/v0.3.11/herd-darwin-amd64"
      sha256 "d0da5d7cd8af3a1ab65e0f30358c78ee5219dbfd6535208d204d0ef9d8662c8e"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Herd-OS/herd/releases/download/v0.3.11/herd-linux-arm64"
      sha256 "ed18edcfa7b206d94883074fb7a425d21af8797e6875f15e30bd0e238504fbad"
    else
      url "https://github.com/Herd-OS/herd/releases/download/v0.3.11/herd-linux-amd64"
      sha256 "8aff3b516dd68e35a55f3b00c07440936695dc28fc52a0b08bed1e4599386d9c"
    end
  end

  def install
    bin.install Dir["herd-*"].first => "herd"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/herd version")
  end
end
