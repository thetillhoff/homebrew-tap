class Webscan < Formula
  desc "Verifies web things"
  homepage "https://github.com/thetillhoff/webscan"
  license "MIT"
  version "v5.4.59"

  on_macos do
    on_arm do
      url "#{homepage}/releases/download/#{version}/webscan_darwin_arm64"
      sha256 "8737163c3ea556b46e7b4b0f860d904b849dd674ada36d0b1dbc24dcb0fb067c"
    end

    on_intel do
      url "#{homepage}/releases/download/#{version}/webscan_darwin_amd64"
      sha256 "18dc13e2de3712a61a11490cc026c1f09fbef21262cd79f330bcf05ec4793f6b"
    end
  end

  on_linux do
    on_arm do
      url "#{homepage}/releases/download/#{version}/webscan_linux_arm64"
      sha256 "f873d993cd6b6abf5ebb24d657dcde2971a69bb7e3a358e16f44831de5321a15"
    end

    on_intel do
      url "#{homepage}/releases/download/#{version}/webscan_linux_amd64"
      sha256 "3a74e6e61a36e49798ae1893da8e719336d6547af10f1eb3dfe4716fb43e2a4c"
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
