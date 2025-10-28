class Webscan < Formula
  desc "Verifies web things"
  homepage "https://github.com/thetillhoff/webscan"
  license "MIT"
  version "v4.0.1"

  on_macos do
    on_arm do
      url "#{homepage}/releases/download/#{version}/webscan_darwin_arm64"
      sha256 "ef2a1115b7d7817c219dc79225c15dc4a9ac45455cd4b1600f82def385589080"
    end

    on_intel do
      url "#{homepage}/releases/download/#{version}/webscan_darwin_amd64"
      sha256 "677541fd3c2f119fbac3c3bbdab1ac22be49001a1b09c224a711635a7c00146b"
    end
  end

  on_linux do
    on_arm do
      url "#{homepage}/releases/download/#{version}/webscan_linux_arm64"
      sha256 "a2f7cb1efc8267c20b44f198a8a28344ff05d67626e40b92682846247070224d"
    end

    on_intel do
      url "#{homepage}/releases/download/#{version}/webscan_linux_amd64"
      sha256 "4708858b11afc65a9434a536ea211af37586330251e61436439518e19ab8a6c4"
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
