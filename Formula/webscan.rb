class Webscan < Formula
  desc "Verifies web things"
  homepage "https://github.com/thetillhoff/webscan"
  license "MIT"
  version "v5.4.12"

  on_macos do
    on_arm do
      url "#{homepage}/releases/download/#{version}/webscan_darwin_arm64"
      sha256 "50c674a6626d23008f3f52c553625c4cc585f3ff70a083b716dfdf44eae41343"
    end

    on_intel do
      url "#{homepage}/releases/download/#{version}/webscan_darwin_amd64"
      sha256 "69e92a301e106a02bf0c8009c6f012788149c5f3189cd73c0a31073c5aa940c0"
    end
  end

  on_linux do
    on_arm do
      url "#{homepage}/releases/download/#{version}/webscan_linux_arm64"
      sha256 "2a961d8c6f078da2f5db152200fcda06ba4426cb68b26c3dddcdd720f31adbd1"
    end

    on_intel do
      url "#{homepage}/releases/download/#{version}/webscan_linux_amd64"
      sha256 "def933bcf2f2dd09c3fb3757dfa4494e45d5d40a01d998f639e6f29f4a3b4212"
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
