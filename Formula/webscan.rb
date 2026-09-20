class Webscan < Formula
  desc "Verifies web things"
  homepage "https://github.com/thetillhoff/webscan"
  license "MIT"
  version "v5.4.27"

  on_macos do
    on_arm do
      url "#{homepage}/releases/download/#{version}/webscan_darwin_arm64"
      sha256 "6b428e5caa61b5f650bef1d7c230211e512c2b3b2e8db1a0a5a9fb75126a3b0a"
    end

    on_intel do
      url "#{homepage}/releases/download/#{version}/webscan_darwin_amd64"
      sha256 "9854217ceb37e6ceb19ddf3e13bc12ab0f8e3e1b2422fae8c8adc4aa01fb87fa"
    end
  end

  on_linux do
    on_arm do
      url "#{homepage}/releases/download/#{version}/webscan_linux_arm64"
      sha256 "2118cc1ef2817276c6e6085f299ffbafd666b1272ef9525128788b9802fcaf8a"
    end

    on_intel do
      url "#{homepage}/releases/download/#{version}/webscan_linux_amd64"
      sha256 "43a611955f0395015cf58422cf5808cc566d62b8e19718406bce78e14d1b1983"
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
