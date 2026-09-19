class Webscan < Formula
  desc "Verifies web things"
  homepage "https://github.com/thetillhoff/webscan"
  license "MIT"
  version "v5.4.23"

  on_macos do
    on_arm do
      url "#{homepage}/releases/download/#{version}/webscan_darwin_arm64"
      sha256 "bf57335cf07962630e6e1b9b8e7c2de76b71cf1236db74f8fd43d133a086b6f6"
    end

    on_intel do
      url "#{homepage}/releases/download/#{version}/webscan_darwin_amd64"
      sha256 "fcc74ed46d284774db4703c704d3e5fd40daf551d76a469922bdc232cd21148f"
    end
  end

  on_linux do
    on_arm do
      url "#{homepage}/releases/download/#{version}/webscan_linux_arm64"
      sha256 "886d6ec700d5b228f715d50cc79287d3ab5f57312ff7a07e5969586d7b810e7d"
    end

    on_intel do
      url "#{homepage}/releases/download/#{version}/webscan_linux_amd64"
      sha256 "409d5c789ea5523444e03efe0652eb83284443f78bec7e82c5453d9eb2d132ba"
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
