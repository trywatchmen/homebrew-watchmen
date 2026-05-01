class Wm < Formula
  desc "Developer environment intelligence platform — 13 scanners, 24 MCP tools, zero dependencies"
  homepage "https://trywatchmen.cloud"
  version "1.0.13"
  license "MIT"
  on_macos do
    on_arm do
      url "https://releases.trywatchmen.cloud/download/community/macos-arm64"
      sha256 "65001bfd74bd79cbbcbe272aee5d2306b40a2f8084f312c33f9a90be9bcdb28f"
    end
  end
  on_linux do
    on_intel do
      url "https://releases.trywatchmen.cloud/download/community/linux-x86_64"
      sha256 "b9a6fdaebf0934f84c673c8b3555854cb9117d0037e6fbca68b2e8c841f99414"
    end
  end
  def install
    bin.install "wm"
  end
  test do
    assert_match "WatchmenCLI Community", shell_output("#{bin}/wm version")
  end
end
