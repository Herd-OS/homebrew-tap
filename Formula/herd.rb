class Herd < Formula
  desc "GitHub-native orchestration for agentic development systems"
  homepage "https://github.com/Herd-OS/herd"
  version "0.8.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Herd-OS/herd/releases/download/v0.8.2/herd-darwin-arm64"
      sha256 "2c9fba84d066d71a676512b341c9c44e838b47a4b62464a7b7f1f8a76bb77b4c"
    else
      url "https://github.com/Herd-OS/herd/releases/download/v0.8.2/herd-darwin-amd64"
      sha256 "9f0d618160428d0bc4df0a8063775d926d465c3347dd670108a5f2fd03dd556c"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Herd-OS/herd/releases/download/v0.8.2/herd-linux-arm64"
      sha256 "38e25b241e3a3c106c2bd128a2a5a4133f57ca74adffc4766da1319f8099367e"
    else
      url "https://github.com/Herd-OS/herd/releases/download/v0.8.2/herd-linux-amd64"
      sha256 "fdb8b662f8cb613fe6f5807662b67042728c01756087d5ebf613518395acf86e"
    end
  end

  def install
    bin.install Dir["herd-*"].first => "herd"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/herd version")
  end
end
