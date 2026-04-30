class Wm < Formula
  desc "Capture, compare, and transfer your complete development environment"
  homepage "https://trywatchmen.cloud"
  version "1.0.11"
  license "MIT"

  on_macos do
    url "https://releases.trywatchmen.cloud/download/community/macos-arm64"
    sha256 "df50111747d2f1e7f835615831bed578d8a2fc061ecf226db2bf25516894e407"
  end

  on_linux do
    url "https://releases.trywatchmen.cloud/download/community/linux-x86_64"
    sha256 "c70d2359cee9e3b364a274f3f9962d5da6d19456830efce016aea36432c05ba2"
  end

  def install
    bin.install "wm"
  end

  test do
    assert_match "WatchmenCLI Community", shell_output("#{bin}/wm version")
  end
end
