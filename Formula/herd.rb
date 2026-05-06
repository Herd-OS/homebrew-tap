class Herd < Formula
  desc "GitHub-native orchestration for agentic development systems"
  homepage "https://github.com/Herd-OS/herd"
  version "0.5.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Herd-OS/herd/releases/download/v0.5.1/herd-darwin-arm64"
      sha256 "050ed3a0e9011e8cb99e548cefb4a7d3665f24e4780a4b2b898ff15324aeef48"
    else
      url "https://github.com/Herd-OS/herd/releases/download/v0.5.1/herd-darwin-amd64"
      sha256 "9d119a36ac488a3ce400179d7fe6d4a98cd9131763e9fd654367dafafa5c67fa"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Herd-OS/herd/releases/download/v0.5.1/herd-linux-arm64"
      sha256 "330c4439f00330e60fed2f0932e5810a29228db31b0e75a3ed97f8b00b16bbf2"
    else
      url "https://github.com/Herd-OS/herd/releases/download/v0.5.1/herd-linux-amd64"
      sha256 "b2d7a417cb1cc0cafbd943011aa0c79c2e4a90933f200daf23f8997606676bb8"
    end
  end

  def install
    bin.install Dir["herd-*"].first => "herd"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/herd version")
  end
end
