class Herd < Formula
  desc "GitHub-native orchestration for agentic development systems"
  homepage "https://github.com/Herd-OS/herd"
  version "0.6.3"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Herd-OS/herd/releases/download/v0.6.3/herd-darwin-arm64"
      sha256 "9827e717966487ed1a9364c9df5ccffdaeb6a30109562ab004b3f01161a3f338"
    else
      url "https://github.com/Herd-OS/herd/releases/download/v0.6.3/herd-darwin-amd64"
      sha256 "b7768d6aab15551c8805f3f7a784bb5880544a3dd87b9d422ca562b6d794a403"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Herd-OS/herd/releases/download/v0.6.3/herd-linux-arm64"
      sha256 "a1e6fa5e6890f4268c6a7dfe9379f739a24b334faf9a34f576b78f45f1d2dcf8"
    else
      url "https://github.com/Herd-OS/herd/releases/download/v0.6.3/herd-linux-amd64"
      sha256 "e1e99f27e3ee346ee4f56086ac8855a9f6d13daeffd02b4bdf265653d76a7724"
    end
  end

  def install
    bin.install Dir["herd-*"].first => "herd"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/herd version")
  end
end
