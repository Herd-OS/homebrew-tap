class Herd < Formula
  desc "GitHub-native orchestration for agentic development systems"
  homepage "https://github.com/Herd-OS/herd"
  version "0.6.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Herd-OS/herd/releases/download/v0.6.0/herd-darwin-arm64"
      sha256 "7e84d2cac94be290258f1e8ff1a2d12bc5927c98ea23dc420253c2a3be6a7ea5"
    else
      url "https://github.com/Herd-OS/herd/releases/download/v0.6.0/herd-darwin-amd64"
      sha256 "f832b9b29bbe83d77771563ce418fdfeaac0403b75c888bfcb323e46f55c2fb4"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Herd-OS/herd/releases/download/v0.6.0/herd-linux-arm64"
      sha256 "d485e98674abe524f381699a6cd7d6d15cb14ed05039c1ef9147a90386455919"
    else
      url "https://github.com/Herd-OS/herd/releases/download/v0.6.0/herd-linux-amd64"
      sha256 "506687d4aa8a038594e9ba56ea7df2a9718099a6f466c8ce8fd61c06ba530337"
    end
  end

  def install
    bin.install Dir["herd-*"].first => "herd"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/herd version")
  end
end
