class Webscan < Formula
  desc "Verifies web things"
  homepage "https://github.com/thetillhoff/webscan"
  license "MIT"
  version "v5.4.61"

  on_macos do
    on_arm do
      url "#{homepage}/releases/download/#{version}/webscan_darwin_arm64"
      sha256 "344178d4fb39f4d6dfdc7b71746032eccbbfe2151b9c1ef36beba05cc49c1d39"
    end

    on_intel do
      url "#{homepage}/releases/download/#{version}/webscan_darwin_amd64"
      sha256 "6f6c805d79fab98d48687b86c1fef4eed0bddb52d96c8fca568111278dd959a4"
    end
  end

  on_linux do
    on_arm do
      url "#{homepage}/releases/download/#{version}/webscan_linux_arm64"
      sha256 "bc98acae5913ed5188f7aae69a011f846af5b244b8237896353aebacb413de79"
    end

    on_intel do
      url "#{homepage}/releases/download/#{version}/webscan_linux_amd64"
      sha256 "b5ee12f1a58a7903f972e3f56255f5d0d0560efbbfb8d0b19db1633902f8164c"
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
