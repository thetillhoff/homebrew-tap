class Webscan < Formula
  desc "Verifies web things"
  homepage "https://github.com/thetillhoff/webscan"
  license "MIT"
  version "v5.4.37"

  on_macos do
    on_arm do
      url "#{homepage}/releases/download/#{version}/webscan_darwin_arm64"
      sha256 "9eb035aa20aad90af80ce35bc81ff5075ddb8529c4ad97cb3f7649cf0d389337"
    end

    on_intel do
      url "#{homepage}/releases/download/#{version}/webscan_darwin_amd64"
      sha256 "54106eff147dfd7f729bc3ccd3e5cefd883dc64c8302d9b62bf9c05303edbe63"
    end
  end

  on_linux do
    on_arm do
      url "#{homepage}/releases/download/#{version}/webscan_linux_arm64"
      sha256 "3025c3b90eb649907a89ccf8e111cb08e58a319e34db140aa2acd70d2c33ecc1"
    end

    on_intel do
      url "#{homepage}/releases/download/#{version}/webscan_linux_amd64"
      sha256 "9d06b6f9e2faa253967020d02e87874982e8156cd3b2ae5d65250eaa408c6cd9"
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
