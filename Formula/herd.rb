class Herd < Formula
  desc "GitHub-native orchestration for agentic development systems"
  homepage "https://github.com/Herd-OS/herd"
  version "0.3.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Herd-OS/herd/releases/download/v0.3.1/herd-darwin-arm64"
      sha256 "2fc67cbd610ee1e5e2c70927b549a271a157d57037d505c447c24f5ea6696953"
    else
      url "https://github.com/Herd-OS/herd/releases/download/v0.3.1/herd-darwin-amd64"
      sha256 "df1593dcc7fad737546a9248f17ed0606cead1b61ade1ccf0525e4be7421ae1c"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Herd-OS/herd/releases/download/v0.3.1/herd-linux-arm64"
      sha256 "7db1a8d8d68a50ef1a8a18bfd3844597785de040a82361bb21880651dc5cd264"
    else
      url "https://github.com/Herd-OS/herd/releases/download/v0.3.1/herd-linux-amd64"
      sha256 "055c51be78c201a508bfa5fa5c80f349b1abcbf8a1b91c149099311add592586"
    end
  end

  def install
    bin.install Dir["herd-*"].first => "herd"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/herd version")
  end
end
