class Webscan < Formula
  desc "Verifies web things"
  homepage "https://github.com/thetillhoff/webscan"
  license "MIT"
  version "v5.4.24"

  on_macos do
    on_arm do
      url "#{homepage}/releases/download/#{version}/webscan_darwin_arm64"
      sha256 "0daa41a1da57cb4192349f5460039f11ce04507f1705055f0531b7d0cde1d236"
    end

    on_intel do
      url "#{homepage}/releases/download/#{version}/webscan_darwin_amd64"
      sha256 "8f8ed123fc20877f57864cf84f33e809c5c286c65f733785792e9e568d468fa2"
    end
  end

  on_linux do
    on_arm do
      url "#{homepage}/releases/download/#{version}/webscan_linux_arm64"
      sha256 "e08d757f00f45e5f1a8bf1ff9fb92439f5abbb409a2ebc021eeeda10cd0238aa"
    end

    on_intel do
      url "#{homepage}/releases/download/#{version}/webscan_linux_amd64"
      sha256 "6f15822c5ef1d14c5e1b05c8cf32b57b8d4f990c6b24ec017031c7a9fb6e9c49"
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
