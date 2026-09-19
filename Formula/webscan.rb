class Webscan < Formula
  desc "Verifies web things"
  homepage "https://github.com/thetillhoff/webscan"
  license "MIT"
  version "v5.4.26"

  on_macos do
    on_arm do
      url "#{homepage}/releases/download/#{version}/webscan_darwin_arm64"
      sha256 "f44cc2edd8f93c6c852e0bcb936f0c8ff65e6598f25181f41aabaf70b9f4abba"
    end

    on_intel do
      url "#{homepage}/releases/download/#{version}/webscan_darwin_amd64"
      sha256 "1c59909ef38a0830836220a5b4400f446bb1230d7fa40ddbf0e7e8ada083fe73"
    end
  end

  on_linux do
    on_arm do
      url "#{homepage}/releases/download/#{version}/webscan_linux_arm64"
      sha256 "3ad58030edda625ec1d953a45ed0bb6cb17f0940890afd35337621c455e9f357"
    end

    on_intel do
      url "#{homepage}/releases/download/#{version}/webscan_linux_amd64"
      sha256 "69f2b908ca6a8e3f697f1d02ac3ab184a6bc381f71559f5babe5e394d99c0e08"
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
