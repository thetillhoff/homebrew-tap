class Webscan < Formula
  desc "Verifies web things"
  homepage "https://github.com/thetillhoff/webscan"
  license "MIT"
  version "v5.4.39"

  on_macos do
    on_arm do
      url "#{homepage}/releases/download/#{version}/webscan_darwin_arm64"
      sha256 "a95a826fac3a0401decc0c5d0cf567188e67a2cfedb0c72a903e67b7bc5f318d"
    end

    on_intel do
      url "#{homepage}/releases/download/#{version}/webscan_darwin_amd64"
      sha256 "bc4221b854ab15f685cef33a6c233f8fac69ca4efde2e8a035022b74d826b295"
    end
  end

  on_linux do
    on_arm do
      url "#{homepage}/releases/download/#{version}/webscan_linux_arm64"
      sha256 "49f057728fe6f5d1df4daf68c1401ff6622823dbb252804de73aa7a23ce45554"
    end

    on_intel do
      url "#{homepage}/releases/download/#{version}/webscan_linux_amd64"
      sha256 "89dda4f01e0dfda515c4a49f4399a0f8a1d9e4f607c1dd682f9d893c38378cc5"
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
