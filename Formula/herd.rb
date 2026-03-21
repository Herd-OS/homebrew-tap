class Herd < Formula
  desc "GitHub-native orchestration for agentic development systems"
  homepage "https://github.com/Herd-OS/herd"
  version "0.2.4"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Herd-OS/herd/releases/download/v0.2.4/herd-darwin-arm64"
      sha256 "b5481115bc0e809a3c660447248efa841548704c34c44c44fc97162e3e94433b"
    else
      url "https://github.com/Herd-OS/herd/releases/download/v0.2.4/herd-darwin-amd64"
      sha256 "1304c6abdc3c9d0a91f78069045acce0ef97e21d042d09cabe2271c2dcd3b33b"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Herd-OS/herd/releases/download/v0.2.4/herd-linux-arm64"
      sha256 "f283b9d86cf77fb068912293b39d81a781234e39c59360de977ada3381dae03b"
    else
      url "https://github.com/Herd-OS/herd/releases/download/v0.2.4/herd-linux-amd64"
      sha256 "a886189661f5b3a4a60a19744d1183989709fa1df35acd1e4db646b957f5cc0c"
    end
  end

  def install
    bin.install Dir["herd-*"].first => "herd"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/herd version")
  end
end
