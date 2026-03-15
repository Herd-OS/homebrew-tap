class Herd < Formula
  desc "GitHub-native orchestration for agentic development systems"
  homepage "https://github.com/Herd-OS/herd"
  version "0.1.0-rc.10"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Herd-OS/herd/releases/download/v0.1.0-rc.10/herd-darwin-arm64"
      sha256 "b4b47ec83cb43bb5eac222be24126d206bcd976a5812c62ad8419ac177aca747"
    else
      url "https://github.com/Herd-OS/herd/releases/download/v0.1.0-rc.10/herd-darwin-amd64"
      sha256 "ef3acc7279a229b27cf0db3bdd822e5fbfe12b311b04ca28dd9b61018ba8ea5e"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Herd-OS/herd/releases/download/v0.1.0-rc.10/herd-linux-arm64"
      sha256 "87eceedf0b994525bcc8828c154a3288698afb4b20dc7349adfb95f28b0fdb84"
    else
      url "https://github.com/Herd-OS/herd/releases/download/v0.1.0-rc.10/herd-linux-amd64"
      sha256 "d876ab72832592c1dd6a5749a3024492446fa4ae319641bd7855e3a5234e5954"
    end
  end

  def install
    bin.install Dir["herd-*"].first => "herd"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/herd version")
  end
end
