class Webscan < Formula
  desc "Verifies web things"
  homepage "https://github.com/thetillhoff/webscan"
  license "MIT"
  version "v5.4.66"

  on_macos do
    on_arm do
      url "#{homepage}/releases/download/#{version}/webscan_darwin_arm64"
      sha256 "2bb54b8b5bf309817f853938b6ba154a4f52d0e27c5e917091a91848745af7af"
    end

    on_intel do
      url "#{homepage}/releases/download/#{version}/webscan_darwin_amd64"
      sha256 "c77851804fcda077f2b8f8e5fe9d79885ed2c0880939f9a47c3d3c27d8c3260f"
    end
  end

  on_linux do
    on_arm do
      url "#{homepage}/releases/download/#{version}/webscan_linux_arm64"
      sha256 "e49ca13a4112fadc733f4701770cacbb58ecd467e1b1b11b47b2cbc6a2d7d9e6"
    end

    on_intel do
      url "#{homepage}/releases/download/#{version}/webscan_linux_amd64"
      sha256 "9d6e557b7edb6b90b3fe675fb944842e36e25bcc9b25964eeba7bfaa4baa6b03"
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
