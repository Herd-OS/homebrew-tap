class Herd < Formula
  desc "GitHub-native orchestration for agentic development systems"
  homepage "https://github.com/Herd-OS/herd"
  version "0.2.13"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Herd-OS/herd/releases/download/v0.2.13/herd-darwin-arm64"
      sha256 "f8f6c0853a76b999aca35d201184a2e34714509047cec1aca5a2e766114e9062"
    else
      url "https://github.com/Herd-OS/herd/releases/download/v0.2.13/herd-darwin-amd64"
      sha256 "70e9e211b0409bf92b430b9f1f7fcdf59f5fba330dba4c230d57467a076694cb"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Herd-OS/herd/releases/download/v0.2.13/herd-linux-arm64"
      sha256 "806716b7c4bcb889567afce16294e454ed5e0307db2e1a32e83927d546212379"
    else
      url "https://github.com/Herd-OS/herd/releases/download/v0.2.13/herd-linux-amd64"
      sha256 "95bfd3bd52ca3b06bea9d8a0db1a8d465f8b1e63192d4b91b256f26f12929462"
    end
  end

  def install
    bin.install Dir["herd-*"].first => "herd"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/herd version")
  end
end
