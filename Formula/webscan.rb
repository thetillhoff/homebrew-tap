class Webscan < Formula
  desc "Verifies web things"
  homepage "https://github.com/thetillhoff/webscan"
  license "MIT"
  version "v4.3.0"

  on_macos do
    on_arm do
      url "#{homepage}/releases/download/#{version}/webscan_darwin_arm64"
      sha256 "2dac870f92665096b578d3e61be3d5f900328ca7a91e9c60fc27606a30fe29bd"
    end

    on_intel do
      url "#{homepage}/releases/download/#{version}/webscan_darwin_amd64"
      sha256 "3a245b1e683b11bf786a0c0cf25ed78eeb58b9837333b7f123f2af881a0de2c7"
    end
  end

  on_linux do
    on_arm do
      url "#{homepage}/releases/download/#{version}/webscan_linux_arm64"
      sha256 "e4043bb5256287f5e056e5dbcca8e596d91b364ffa12386f1501af3b045d97f2"
    end

    on_intel do
      url "#{homepage}/releases/download/#{version}/webscan_linux_amd64"
      sha256 "341ca5794d45f1553fc0abefbd1eb0096ce839d637d5f7cff1f013e1728f7eca"
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
