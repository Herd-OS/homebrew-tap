class Herd < Formula
  desc "GitHub-native orchestration for agentic development systems"
  homepage "https://github.com/Herd-OS/herd"
  version "0.3.7"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Herd-OS/herd/releases/download/v0.3.7/herd-darwin-arm64"
      sha256 "23f1e16be06f1f055d1a95d5bb5335135822aca77d799bc27df06dc55d716466"
    else
      url "https://github.com/Herd-OS/herd/releases/download/v0.3.7/herd-darwin-amd64"
      sha256 "535b3c92166e45efe841d4b96fe89d0b73d88241b2cc69297f28af5d0ed3757f"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Herd-OS/herd/releases/download/v0.3.7/herd-linux-arm64"
      sha256 "5e3b30987e963d9c6ab0b6f5a5d2f284c6c02f80f68f13d35eef1c687fc9e52d"
    else
      url "https://github.com/Herd-OS/herd/releases/download/v0.3.7/herd-linux-amd64"
      sha256 "13f5520423262e385d6bb09541ff68bf5bbca2c5a6fa1fa9e93a538c0cf983ed"
    end
  end

  def install
    bin.install Dir["herd-*"].first => "herd"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/herd version")
  end
end
