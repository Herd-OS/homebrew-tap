class Herd < Formula
  desc "GitHub-native orchestration for agentic development systems"
  homepage "https://github.com/Herd-OS/herd"
  version "0.1.0-rc.8"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Herd-OS/herd/releases/download/v0.1.0-rc.8/herd-darwin-arm64"
      sha256 "1d9c103a18b06a6396dba7c4d75bda81c0155f3cfedd2b1c25a557994623224b"
    else
      url "https://github.com/Herd-OS/herd/releases/download/v0.1.0-rc.8/herd-darwin-amd64"
      sha256 "64c53efe5921c475fb76a3ca6c446961c5b8bdbbb1c39bee182031e873d6ab38"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Herd-OS/herd/releases/download/v0.1.0-rc.8/herd-linux-arm64"
      sha256 "00045162faacbe3bbd7117496783a43c774d2078c150a94e25ad34b70dadca05"
    else
      url "https://github.com/Herd-OS/herd/releases/download/v0.1.0-rc.8/herd-linux-amd64"
      sha256 "3dbf7980d557ac297baf37c4ec0ca3a46bb5b1571633cfa84e6743c68d3358af"
    end
  end

  def install
    bin.install Dir["herd-*"].first => "herd"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/herd version")
  end
end
