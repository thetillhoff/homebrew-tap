class Webscan < Formula
  desc "Verifies web things"
  homepage "https://github.com/thetillhoff/webscan"
  license "MIT"
  version "v5.4.36"

  on_macos do
    on_arm do
      url "#{homepage}/releases/download/#{version}/webscan_darwin_arm64"
      sha256 "ffbdfd637a8136264ccfcdd7d2520bfdd91799eed04011be5ecec78fd6596dd5"
    end

    on_intel do
      url "#{homepage}/releases/download/#{version}/webscan_darwin_amd64"
      sha256 "be846a57fccda5324ae43b26df16bc221336ae183ad95360dca939f193b16c3a"
    end
  end

  on_linux do
    on_arm do
      url "#{homepage}/releases/download/#{version}/webscan_linux_arm64"
      sha256 "195880de6fe9e45756f0df8317ada133d2f9c275f8daa74a75b6b1f62520e71b"
    end

    on_intel do
      url "#{homepage}/releases/download/#{version}/webscan_linux_amd64"
      sha256 "1a5009bcc90ca427a30f562443d96807c20e9f101e7ed2f7357df0339b062da6"
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
