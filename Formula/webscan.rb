class Webscan < Formula
  desc "Verifies web things"
  homepage "https://github.com/thetillhoff/webscan"
  license "MIT"
  version "v5.4.52"

  on_macos do
    on_arm do
      url "#{homepage}/releases/download/#{version}/webscan_darwin_arm64"
      sha256 "b75cb96bcf035d1d74451d9b9032820aed61b77b37e3e9e0af3c85c3e1817cd8"
    end

    on_intel do
      url "#{homepage}/releases/download/#{version}/webscan_darwin_amd64"
      sha256 "ab2de984bf3f9d569117019369cdc71a5183ad7b3ef7e9a09d0e237f39385724"
    end
  end

  on_linux do
    on_arm do
      url "#{homepage}/releases/download/#{version}/webscan_linux_arm64"
      sha256 "6f94e4f43ded7072348653fab7e0c26e52e09a660961b060077fb9993e735fa5"
    end

    on_intel do
      url "#{homepage}/releases/download/#{version}/webscan_linux_amd64"
      sha256 "bc6f1f12ffea620ec131fc2963e73c66a31180076ef0de1e7e29f984130e9dab"
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
