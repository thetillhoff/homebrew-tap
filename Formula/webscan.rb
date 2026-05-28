class Webscan < Formula
  desc "Verifies web things"
  homepage "https://github.com/thetillhoff/webscan"
  license "MIT"
  version "v5.2.0"

  on_macos do
    on_arm do
      url "#{homepage}/releases/download/#{version}/webscan_darwin_arm64"
      sha256 "dc9d4dd0f654754c213bbb808a7b5526ef9df95bb21fc1de6025dec5ce5dc23d"
    end

    on_intel do
      url "#{homepage}/releases/download/#{version}/webscan_darwin_amd64"
      sha256 "9374132ea5f6edf609c7bf50714b1234f243ec5648dd3914850e4a9c8ad8a3a9"
    end
  end

  on_linux do
    on_arm do
      url "#{homepage}/releases/download/#{version}/webscan_linux_arm64"
      sha256 "3c76b424ed4b6a3baca8bbbbb075285e61673ff6777baf1e515055a60ba548b3"
    end

    on_intel do
      url "#{homepage}/releases/download/#{version}/webscan_linux_amd64"
      sha256 "62069a8f8c1188463c403db11af7b58b0ca5308efeaf3d05a0800d17f44725fc"
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
