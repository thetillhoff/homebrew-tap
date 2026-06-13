class Webscan < Formula
  desc "Verifies web things"
  homepage "https://github.com/thetillhoff/webscan"
  license "MIT"
  version "v5.2.1"

  on_macos do
    on_arm do
      url "#{homepage}/releases/download/#{version}/webscan_darwin_arm64"
      sha256 "4a0401d66f3d5d8760b3da5129197398f5f670bc1c724d4a9665bc4a540650e2"
    end

    on_intel do
      url "#{homepage}/releases/download/#{version}/webscan_darwin_amd64"
      sha256 "8315de578ae3509c4f473ddedf65dba29dd9b4e603522609539fe6552d694f04"
    end
  end

  on_linux do
    on_arm do
      url "#{homepage}/releases/download/#{version}/webscan_linux_arm64"
      sha256 "8eb6ec3c2154d2505232b0b4e013c95a0ece331248c623df6d091c8c04407c62"
    end

    on_intel do
      url "#{homepage}/releases/download/#{version}/webscan_linux_amd64"
      sha256 "1c2cf83f3106455fed34eeed009f96b1e3708908b188dff7e0c6680d98ffaa62"
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
