class Wm < Formula
  desc "Developer environment intelligence platform — 13 scanners, 24 MCP tools, zero dependencies"
  homepage "https://trywatchmen.cloud"
  version "1.1.2"
  license "MIT"
  on_macos do
    on_arm do
      url "https://releases.trywatchmen.cloud/download/community/macos-arm64"
      sha256 "d2d5e8d94feadf369da957c5ba83fefa24fbbea3d459d6f26dacb151dfacd110"
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
