class Webscan < Formula
  desc "Verifies web things"
  homepage "https://github.com/thetillhoff/webscan"
  license "MIT"
  version "v5.4.29"

  on_macos do
    on_arm do
      url "#{homepage}/releases/download/#{version}/webscan_darwin_arm64"
      sha256 "42564eda5debc1d848763ef2fddc16133fd6467c3fad33ec044d1595e2e24ada"
    end

    on_intel do
      url "#{homepage}/releases/download/#{version}/webscan_darwin_amd64"
      sha256 "6ac205ba8941d9b5f1bb3d81e1a0abe2858f6b9241bea5919ea67669d8944848"
    end
  end

  on_linux do
    on_arm do
      url "#{homepage}/releases/download/#{version}/webscan_linux_arm64"
      sha256 "de0de4f4e4bd209b8c95e996b537266e62b4aa4d80e2919a995522e1cbd28934"
    end

    on_intel do
      url "#{homepage}/releases/download/#{version}/webscan_linux_amd64"
      sha256 "c79eb29abb72b2c543426b9eadbb6b908284dead7ef3b2b59745ef1ad23f2286"
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
