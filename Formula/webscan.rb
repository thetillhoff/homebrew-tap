class Webscan < Formula
  desc "Verifies web things"
  homepage "https://github.com/thetillhoff/webscan"
  license "MIT"
  version "v5.4.28"

  on_macos do
    on_arm do
      url "#{homepage}/releases/download/#{version}/webscan_darwin_arm64"
      sha256 "74beac423ca9afbccd28698387b3b4e64d12acbbef1d46f9d551804cc9365efd"
    end

    on_intel do
      url "#{homepage}/releases/download/#{version}/webscan_darwin_amd64"
      sha256 "169b948dbe0978749a1d18b17588fbdbf2b29db40ab5788fcd4fdfbf5079a39f"
    end
  end

  on_linux do
    on_arm do
      url "#{homepage}/releases/download/#{version}/webscan_linux_arm64"
      sha256 "cb8cf9979f78c4c5a12a76c664562f56f5858977db3b52181ac9025d5508fcf6"
    end

    on_intel do
      url "#{homepage}/releases/download/#{version}/webscan_linux_amd64"
      sha256 "1cb758082ea574ac305186bf6adb18b6254a191bdecebf84d9151736c92462b8"
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
