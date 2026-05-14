class Wm < Formula
  desc "Developer environment intelligence platform — 13 scanners, 24 MCP tools, zero dependencies"
  homepage "https://trywatchmen.cloud"
  version "1.3.0"
  license "MIT"
  on_macos do
    on_arm do
      url "https://releases.trywatchmen.cloud/download/community/1.3.0/macos-arm64"
      sha256 "ec7f44dfee1be5b8a96f980924ed931c956ceb14cc7f7f2ae6d1ffa32fc3be97"
    end
  end
  on_linux do
    on_intel do
      url "https://releases.trywatchmen.cloud/download/community/1.3.0/linux-x86_64"
      sha256 "ad73a946e6f19dcb6afef3b435e9e8e660f24de3d690c134a64ede3406830092"
    end
  end
  def install
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
