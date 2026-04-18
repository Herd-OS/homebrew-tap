class Herd < Formula
  desc "GitHub-native orchestration for agentic development systems"
  homepage "https://github.com/Herd-OS/herd"
  version "0.3.15"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Herd-OS/herd/releases/download/v0.3.15/herd-darwin-arm64"
      sha256 "10326d7917cc6211d633a5d8fe8f76222a0fc72be0e3abd989fb6228d350dd79"
    else
      url "https://github.com/Herd-OS/herd/releases/download/v0.3.15/herd-darwin-amd64"
      sha256 "14d10c76fe5c69a7d953649f5a6655b8ef26acade31fd95249d895e7b5eb83cc"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Herd-OS/herd/releases/download/v0.3.15/herd-linux-arm64"
      sha256 "3f0cd1dfa1bb7cce1be6afe49d25b376c2319412c79fea58374c146eeb3d2e57"
    else
      url "https://github.com/Herd-OS/herd/releases/download/v0.3.15/herd-linux-amd64"
      sha256 "f4210369135856a89478237727223737ed7ca16f77cac64d0afd4b6c609b0b1c"
    end
  end

  def install
    bin.install Dir["herd-*"].first => "herd"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/herd version")
  end
end
