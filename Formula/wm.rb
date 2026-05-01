class Wm < Formula
  desc "Capture, compare, and transfer your complete development environment"
  homepage "https://trywatchmen.cloud"
  version "1.0.12"
  license "MIT"

  on_macos do
    url "https://releases.trywatchmen.cloud/download/community/macos-arm64"
    sha256 "d8204c81c218b9eb9ff1a605818d0af5e3b67a6e510413e5838f0ea75102c6f3"
  end

  on_linux do
    url "https://releases.trywatchmen.cloud/download/community/linux-x86_64"
    sha256 "83f1744dabfb9b0982013db300274b195bfef4c77d92747ceddf5d22caac3d45"
  end

  def install
    # Downloaded file may not be named "wm" — rename before installing
    downloaded = Dir["*"].first || "macos-arm64"
    File.rename(downloaded, "wm") unless downloaded == "wm"
    chmod 0755, "wm"
    bin.install "wm"
  end

  test do
    assert_match "WatchmenCLI Community", shell_output("#{bin}/wm version")
  end
end
