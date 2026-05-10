class Wm < Formula
  desc "Developer environment intelligence platform — 13 scanners, 24 MCP tools, zero dependencies"
  homepage "https://trywatchmen.cloud"
  version "1.1.3"
  license "MIT"
  on_macos do
    on_arm do
      url "https://releases.trywatchmen.cloud/download/community/macos-arm64"
      sha256 "4be4ce30b44259788761a2c0329cc291721d81e12badbfb14adc1a4f66e700af"
    end
  end
  on_linux do
    on_intel do
      url "https://releases.trywatchmen.cloud/download/community/linux-x86_64"
      sha256 "2013659a1044d381919a8cf8bc18476b9df2960bffd00a37197a6282efe8ed3e"
    end
  end
  def install
    # Homebrew follows the CloudFront redirect to a presigned S3 URL and
    # stages the download under the S3 object basename, not "wm". A prior
    # `bin.install "wm"` form failed for every release 1.0.13..1.1.3
    # with ENOENT. Install the actual staged filename per platform.
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
