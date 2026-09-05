class Webscan < Formula
  desc "Verifies web things"
  homepage "https://github.com/thetillhoff/webscan"
  license "MIT"
  version "v5.4.20"

  on_macos do
    on_arm do
      url "#{homepage}/releases/download/#{version}/webscan_darwin_arm64"
      sha256 "1e47a02410fe45b7c27b28ecb4a034a88b590a91bb81cbd96c2f8cff4cb6f706"
    end

    on_intel do
      url "#{homepage}/releases/download/#{version}/webscan_darwin_amd64"
      sha256 "1538fe83285e6e3b2a87f2417cdb31ebb171b384c77bb2adfabd57b4cbfe627c"
    end
  end

  on_linux do
    on_arm do
      url "#{homepage}/releases/download/#{version}/webscan_linux_arm64"
      sha256 "5796b661fa25fba8294bdac8fbc994d32699b642cfec77ffbfb3d633a7efb00c"
    end

    on_intel do
      url "#{homepage}/releases/download/#{version}/webscan_linux_amd64"
      sha256 "8daa48973949e5e17d9ad5b0f0262c7f6c39f9c293ac98500bcbcca6f369b003"
    end
  end

  def install
    # Rename the downloaded file to 'webscan' and install it
    bin.install Dir["webscan_*"].first => "webscan"
  end

  test do
    assert_match "#{version}", shell_output("#{bin}/webscan --version")
  end
end
