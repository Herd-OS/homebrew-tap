class Herd < Formula
  desc "GitHub-native orchestration for agentic development systems"
  homepage "https://github.com/Herd-OS/herd"
  version "0.2.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Herd-OS/herd/releases/download/v0.2.1/herd-darwin-arm64"
      sha256 "df2c6d23e39ba820ef3bedeff28531b2607ca000a971ee29db4a761ff788798a"
    else
      url "https://github.com/Herd-OS/herd/releases/download/v0.2.1/herd-darwin-amd64"
      sha256 "489fefc779a122e9eb1cdd3265c42ae1c11db68d07d28cc92b5f2c95b5e32fc6"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Herd-OS/herd/releases/download/v0.2.1/herd-linux-arm64"
      sha256 "6fbd7e55968d634588949ba327973666171bac976e92931914a43d86c6e2a432"
    else
      url "https://github.com/Herd-OS/herd/releases/download/v0.2.1/herd-linux-amd64"
      sha256 "a1ee40893e8dc889637b469eb045940ce1c65479e6f5b1802f2720284ef9068a"
    end
  end

  def install
    bin.install Dir["herd-*"].first => "herd"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/herd version")
  end
end
