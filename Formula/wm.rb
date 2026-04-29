class Wm < Formula
  desc "Developer environment intelligence platform — 13 scanners, 24 MCP tools, zero dependencies"
  homepage "https://trywatchmen.cloud"
  version "1.0.4"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/trywatchmen/watchmen-cli/releases/download/v1.0.4/wm-community-macos-arm64"
      sha256 "PLACEHOLDER_WILL_BE_UPDATED_ON_RELEASE"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/trywatchmen/watchmen-cli/releases/download/v1.0.4/wm-community-linux-x86_64"
      sha256 "PLACEHOLDER_WILL_BE_UPDATED_ON_RELEASE"
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
