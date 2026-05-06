class Wm < Formula
  desc "Developer environment intelligence platform — 13 scanners, 24 MCP tools, zero dependencies"
  homepage "https://trywatchmen.cloud"
  version "1.1.1"
  license "MIT"
  on_macos do
    on_arm do
      url "https://releases.trywatchmen.cloud/download/community/macos-arm64"
      sha256 "0bc1f8c6ca1282a4772c2aa309125f37e5fdf430aab2c0266ca3752d6bb119e3"
    end
  end
  on_linux do
    on_intel do
      url "https://releases.trywatchmen.cloud/download/community/linux-x86_64"
      sha256 "f120844a4777dbdadf2d253e81f2317c9bdd55c4ed93027f72f96ac8bf312912"
    end
  end
  def install
    bin.install "wm"
  end
  test do
    assert_match "WatchmenCLI Community", shell_output("#{bin}/wm version")
  end
end
