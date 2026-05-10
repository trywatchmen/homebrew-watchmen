class Wm < Formula
  desc "Developer environment intelligence platform — 13 scanners, 24 MCP tools, zero dependencies"
  homepage "https://trywatchmen.cloud"
  version "1.1.4"
  license "MIT"
  on_macos do
    on_arm do
      url "https://releases.trywatchmen.cloud/download/community/macos-arm64"
      sha256 "2b7ac7ec66480e986a02e5504c2810da04fc23c15d52021c1fdd998adef52ef0"
    end
  end
  on_linux do
    on_intel do
      url "https://releases.trywatchmen.cloud/download/community/linux-x86_64"
      sha256 "6fe478c424dc93c894dcbc5163d4c7c1dc9b52e1f4ed8e7a4338d5cc2ed11cf3"
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
