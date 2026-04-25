class Herd < Formula
  desc "GitHub-native orchestration for agentic development systems"
  homepage "https://github.com/Herd-OS/herd"
  version "0.4.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Herd-OS/herd/releases/download/v0.4.2/herd-darwin-arm64"
      sha256 "4259a894e821a982cfc2e674a75f97868ab3e68980743101ed4652803d720ae6"
    else
      url "https://github.com/Herd-OS/herd/releases/download/v0.4.2/herd-darwin-amd64"
      sha256 "07048eca0fe1b4883991df7517361adb3aeb84876f82f0306669506b2bf36917"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Herd-OS/herd/releases/download/v0.4.2/herd-linux-arm64"
      sha256 "725e1bad4626b1bbdf9b977384d7faac947254c9f249ba3460846be73f76f737"
    else
      url "https://github.com/Herd-OS/herd/releases/download/v0.4.2/herd-linux-amd64"
      sha256 "0152d7a9b9e1175bc16de8e50eddda43dfa0bfa17d8e035368e629edcb7d5eed"
    end
  end

  def install
    bin.install Dir["herd-*"].first => "herd"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/herd version")
  end
end
