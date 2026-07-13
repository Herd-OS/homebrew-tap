class Herd < Formula
  desc "GitHub-native orchestration for agentic development systems"
  homepage "https://github.com/Herd-OS/herd"
  version "0.8.30"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Herd-OS/herd/releases/download/v0.8.30/herd-darwin-arm64"
      sha256 "0abfc1d0ecaede77694e808ce4340c9794bcf91f9e3f282bbd282ff80118e849"
    else
      url "https://github.com/Herd-OS/herd/releases/download/v0.8.30/herd-darwin-amd64"
      sha256 "74dc39d034e4fd5f9712d984c5dd0a60b52e10683e3855f5ca50ecb18859d833"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Herd-OS/herd/releases/download/v0.8.30/herd-linux-arm64"
      sha256 "bf6bd58446028d523c3fff4d2129b570a0bf0f401e5b7fc0b3d14c3a5d92e805"
    else
      url "https://github.com/Herd-OS/herd/releases/download/v0.8.30/herd-linux-amd64"
      sha256 "2f1a97548fb574ce0365c2186fc6c5cb9aa71a2dfa58c807a695359f63013ff9"
    end
  end

  def install
    bin.install Dir["herd-*"].first => "herd"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/herd version")
  end
end
