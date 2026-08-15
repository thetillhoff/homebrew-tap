class Webscan < Formula
  desc "Verifies web things"
  homepage "https://github.com/thetillhoff/webscan"
  license "MIT"
  version "v5.4.8"

  on_macos do
    on_arm do
      url "#{homepage}/releases/download/#{version}/webscan_darwin_arm64"
      sha256 "8766993943e7b727fe9ae0b6f2681143ccea8b5c840f2fad08d7874e85b7d849"
    end

    on_intel do
      url "#{homepage}/releases/download/#{version}/webscan_darwin_amd64"
      sha256 "e64be5c0c7484592dd7f2c590c0c5088a45f6842fcc19331a4aeb6fd1dc66619"
    end
  end

  on_linux do
    on_arm do
      url "#{homepage}/releases/download/#{version}/webscan_linux_arm64"
      sha256 "ec6e9b38f3a5d01d035dab7a10254422fce22927b357ea3827ff1115ba4af6ca"
    end

    on_intel do
      url "#{homepage}/releases/download/#{version}/webscan_linux_amd64"
      sha256 "2de53f6fdcc119cc72550114e318c5d1747e5b5005183e4935526dfba5114a78"
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
