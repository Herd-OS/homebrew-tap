class Herd < Formula
  desc "GitHub-native orchestration for agentic development systems"
  homepage "https://github.com/Herd-OS/herd"
  version "0.7.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Herd-OS/herd/releases/download/v0.7.1/herd-darwin-arm64"
      sha256 "a1b7c2bdadaa7a9a799ed23324d03949239a5179f059741b627bb23447c23951"
    else
      url "https://github.com/Herd-OS/herd/releases/download/v0.7.1/herd-darwin-amd64"
      sha256 "ddb2d4f8251dfd7f88680b463b69434d8e038147cd0aefc92b4f866dc0a3ca73"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Herd-OS/herd/releases/download/v0.7.1/herd-linux-arm64"
      sha256 "a1d5d5f1130116583745501f308013f4c5c70c8b8eefe142be0b44cac493ce6e"
    else
      url "https://github.com/Herd-OS/herd/releases/download/v0.7.1/herd-linux-amd64"
      sha256 "dce726f3f1c71589fe6c324faae561e6a6c672f8947b9d8055220f689b618373"
    end
  end

  def install
    bin.install Dir["herd-*"].first => "herd"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/herd version")
  end
end
