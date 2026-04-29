class Wm < Formula
  desc "Developer environment intelligence platform — 13 scanners, 24 MCP tools, zero dependencies"
  homepage "https://trywatchmen.cloud"
  version "1.0.5"
  license "MIT"
  on_macos do
    on_arm do
      url "https://github.com/trywatchmen/watchmen-cli/releases/download/v1.0.5/wm-community-macos-arm64"
      sha256 "c58cd143fbb80dbbb0ced4b75e0a57920b2c38a55a5d20071fa630e7db429542"
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/trywatchmen/watchmen-cli/releases/download/v1.0.5/wm-community-linux-x86_64"
      sha256 "8cf989a4c3611a281d7d27fc7000f0a1a7d20871d0b4a345078207bcd5f6eb41"
    end
  end
  def install
    binary = stable.url.split("/").last
    bin.install binary => "wm"
  end
  test do
    assert_match "WatchmenCLI Community", shell_output("#{bin}/wm version")
  end
end
