class Webscan < Formula
  desc "Verifies web things"
  homepage "https://github.com/thetillhoff/webscan"
  license "MIT"
  version "v5.4.21"

  on_macos do
    on_arm do
      url "#{homepage}/releases/download/#{version}/webscan_darwin_arm64"
      sha256 "3e9ec4eec0973ed3764750004651d2379493eea577f881d7102e6cc7d5eb3f3e"
    end

    on_intel do
      url "#{homepage}/releases/download/#{version}/webscan_darwin_amd64"
      sha256 "0a2767dfbf66186d1441efb8a81c04e594f6417c75d3302ec7dde9f7564c946b"
    end
  end

  on_linux do
    on_arm do
      url "#{homepage}/releases/download/#{version}/webscan_linux_arm64"
      sha256 "bd6ecc3f7c2309614f5e9c50a4d503b9429a4d0952f1e17ced4beff8307dcbb6"
    end

    on_intel do
      url "#{homepage}/releases/download/#{version}/webscan_linux_amd64"
      sha256 "91ae5103fd9f177367fec9de617de88173dbc145bef2df3225481e0736bb7279"
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
