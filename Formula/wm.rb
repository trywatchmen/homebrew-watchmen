class Wm < Formula
  desc "Developer environment intelligence platform — 13 scanners, 24 MCP tools, zero dependencies"
  homepage "https://trywatchmen.cloud"
  version "1.1.7"
  license "MIT"
  on_macos do
    on_arm do
      url "https://releases.trywatchmen.cloud/download/community/macos-arm64"
      sha256 "cb66982d5c307acb3775c1a5610a6d7c1ec6ee1dae02e4c51dd2a47c0b7e6da4"
    end
  end
  on_linux do
    on_intel do
      url "https://releases.trywatchmen.cloud/download/community/linux-x86_64"
      sha256 "db1facd5c69964a8b40cdc4a3bdfb7ff62eb9fd78ddbb130ccdd112f198d2bc7"
    end
  end
  def install
    # Homebrew follows the CloudFront redirect to a presigned S3 URL and
    # stages the download under the S3 object basename, not "wm". A prior
    #  form failed for every release 1.0.13..1.1.3
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
