class Herd < Formula
  desc "GitHub-native orchestration for agentic development systems"
  homepage "https://github.com/Herd-OS/herd"
  version "0.1.0-rc.12"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Herd-OS/herd/releases/download/v0.1.0-rc.12/herd-darwin-arm64"
      sha256 "edc530fef21a08f13f810ac13ea7fd90d2be72576e18044d966fbe7adccd7295"
    else
      url "https://github.com/Herd-OS/herd/releases/download/v0.1.0-rc.12/herd-darwin-amd64"
      sha256 "55538c778755f006c84dfd2c4c52dae62be57a00eff82e88c0402bd2a2fcca79"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Herd-OS/herd/releases/download/v0.1.0-rc.12/herd-linux-arm64"
      sha256 "b71cf7e9ce0fa10a159dba9a2437ac15ed150d0b8acc52beaafa7aba49b8fb93"
    else
      url "https://github.com/Herd-OS/herd/releases/download/v0.1.0-rc.12/herd-linux-amd64"
      sha256 "1402a11d81fd2c9f89e314eee86a117048144de0b643a2d119f935ce3eb3b284"
    end
  end

  def install
    bin.install Dir["herd-*"].first => "herd"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/herd version")
  end
end
