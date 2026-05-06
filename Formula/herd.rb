class Herd < Formula
  desc "GitHub-native orchestration for agentic development systems"
  homepage "https://github.com/Herd-OS/herd"
  version "0.5.6"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Herd-OS/herd/releases/download/v0.5.6/herd-darwin-arm64"
      sha256 "9a0226a7504b3232c38d66c5c51c1652e9b51aa58221acfa5cb35768bd90ec5b"
    else
      url "https://github.com/Herd-OS/herd/releases/download/v0.5.6/herd-darwin-amd64"
      sha256 "efe4979de9c2cc00e5b64f2042c9f824b31f7c66401118d5e99135259b0836e8"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Herd-OS/herd/releases/download/v0.5.6/herd-linux-arm64"
      sha256 "b17386287ef908979137d1b1c572049bdc326a3a17966e26a75ec2f0fd9facc3"
    else
      url "https://github.com/Herd-OS/herd/releases/download/v0.5.6/herd-linux-amd64"
      sha256 "95f10cbeb1679d4d4879aa35aebc4dca595ddc7ba030079a24c05fd4fe8ef868"
    end
  end

  def install
    bin.install Dir["herd-*"].first => "herd"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/herd version")
  end
end
