class Wm < Formula
  desc "Developer environment intelligence platform — 13 scanners, 24 MCP tools, zero dependencies"
  homepage "https://trywatchmen.cloud"
  version "1.0.7"
  license "MIT"
  on_macos do
    on_arm do
      url "https://github.com/trywatchmen/watchmen-cli/releases/download/v1.0.7/wm-community-macos-arm64"
      sha256 "df50111747d2f1e7f835615831bed578d8a2fc061ecf226db2bf25516894e407"
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/trywatchmen/watchmen-cli/releases/download/v1.0.7/wm-community-linux-x86_64"
      sha256 "c70d2359cee9e3b364a274f3f9962d5da6d19456830efce016aea36432c05ba2"
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
