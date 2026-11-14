class Webscan < Formula
  desc "Verifies web things"
  homepage "https://github.com/thetillhoff/webscan"
  license "MIT"
  version "v5.4.60"

  on_macos do
    on_arm do
      url "#{homepage}/releases/download/#{version}/webscan_darwin_arm64"
      sha256 "f54012b8637233e5e06e88bc1cf56315b08099ad37c750c27e858c6af615cc8f"
    end

    on_intel do
      url "#{homepage}/releases/download/#{version}/webscan_darwin_amd64"
      sha256 "ff3a89f42c8d8dd5b5e1e7278e94c9548bc7a974f75a2caa69359b9ff2ab48fd"
    end
  end

  on_linux do
    on_arm do
      url "#{homepage}/releases/download/#{version}/webscan_linux_arm64"
      sha256 "9d5daab79587928f64a00fa2d0dbc0a67388e107fcf8542d2c9376cf4f16e9ee"
    end

    on_intel do
      url "#{homepage}/releases/download/#{version}/webscan_linux_amd64"
      sha256 "1a7ec3a65a2cf5a70d9af978e7bb2283f7b7e38e5a2c829b75a885462e373fb7"
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
