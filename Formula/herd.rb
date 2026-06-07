class Herd < Formula
  desc "GitHub-native orchestration for agentic development systems"
  homepage "https://github.com/Herd-OS/herd"
  version "0.8.17"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Herd-OS/herd/releases/download/v0.8.17/herd-darwin-arm64"
      sha256 "34b8923c9fa52eebfc448e808a31249b230f2996157e039a6830d8850f6f99bd"
    else
      url "https://github.com/Herd-OS/herd/releases/download/v0.8.17/herd-darwin-amd64"
      sha256 "62c8cf802076f155dbc652fcacdadab75861489f94d9a0bf2bf4666ce09f106f"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Herd-OS/herd/releases/download/v0.8.17/herd-linux-arm64"
      sha256 "a4b10c8031ba3852a2cbc0e6326cebd2c1fcfccafa5c6d2e9a2de4a749988d4e"
    else
      url "https://github.com/Herd-OS/herd/releases/download/v0.8.17/herd-linux-amd64"
      sha256 "2d9e86a1f492008e4ae57db7d3e6a6ad88af6e7b8f475fa0aa384985c09ba39e"
    end
  end

  def install
    bin.install Dir["herd-*"].first => "herd"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/herd version")
  end
end
