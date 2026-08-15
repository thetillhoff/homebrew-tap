class Webscan < Formula
  desc "Verifies web things"
  homepage "https://github.com/thetillhoff/webscan"
  license "MIT"
  version "v5.4.7"

  on_macos do
    on_arm do
      url "#{homepage}/releases/download/#{version}/webscan_darwin_arm64"
      sha256 "8c2b545e7ea23a769140617b9c246688a92b8a62f21d0f718be0a19546ba893d"
    end

    on_intel do
      url "#{homepage}/releases/download/#{version}/webscan_darwin_amd64"
      sha256 "b35df801b10e4221118ba4bc866468e8b16396d61494c7e0263904300c2a4f5d"
    end
  end

  on_linux do
    on_arm do
      url "#{homepage}/releases/download/#{version}/webscan_linux_arm64"
      sha256 "05ef3065cdc3d892ec689de2b561aeef68946a0cd0f5375273db26e7ce5ac63f"
    end

    on_intel do
      url "#{homepage}/releases/download/#{version}/webscan_linux_amd64"
      sha256 "8264114c46f660c9e38a605a4eb2c0ef0ee86c3fd415e7394f6afaf1130f986b"
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
