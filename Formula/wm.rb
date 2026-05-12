class Wm < Formula
  desc "Developer environment intelligence platform — 13 scanners, 24 MCP tools, zero dependencies"
  homepage "https://trywatchmen.cloud"
  version "1.2.2"
  license "MIT"
  on_macos do
    on_arm do
      url "https://releases.trywatchmen.cloud/download/community/macos-arm64"
      sha256 "67d24a2c2a712b27daa02ca01d97ebc62b02ad89f6958c56bf98a7cd640616f9"
    end
  end
  on_linux do
    on_intel do
      url "https://releases.trywatchmen.cloud/download/community/linux-x86_64"
      sha256 "52709a13f8ed1d0560868888d3da48357d317ff9cc0ea28fd58aafa09b39f81c"
    end
  end
  def install
    # Homebrew stages the redirected S3 object basename, not the public URL
    # basename, so install the actual staged filename per platform.
    on_macos do
      bin.install "wm-community-macos-arm64" => "wm"
    end
    on_linux do
      bin.install "wm-community-linux-x86_64" => "wm"
    end
  end
  test do
    assert_match "WatchmenCLI Community", shell_output("#{bin}/wm version")
  end
end
