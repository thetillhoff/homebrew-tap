class Webscan < Formula
  desc "Verifies web things"
  homepage "https://github.com/thetillhoff/webscan"
  license "MIT"
  version "v5.4.62"

  on_macos do
    on_arm do
      url "#{homepage}/releases/download/#{version}/webscan_darwin_arm64"
      sha256 "95b155c8fe50e8b5ca7f6c55ea55a1aee8f161a52da5e83cd25602ce0a44dccb"
    end

    on_intel do
      url "#{homepage}/releases/download/#{version}/webscan_darwin_amd64"
      sha256 "b6600c70ed709ddc01fd4c563f55101cf99beaff1511e737dae4f8832c9f8a35"
    end
  end

  on_linux do
    on_arm do
      url "#{homepage}/releases/download/#{version}/webscan_linux_arm64"
      sha256 "c7197c0abdca714e39f24896bdb9ea595d666aa3059dd22e37951b6489d4ddca"
    end

    on_intel do
      url "#{homepage}/releases/download/#{version}/webscan_linux_amd64"
      sha256 "0ee7e1e79d0a1cd77d693fe7dcdd2b6b8439237dae09fbfc64f7dcf507f26bb1"
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
