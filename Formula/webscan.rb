class Webscan < Formula
  desc "Verifies web things"
  homepage "https://github.com/thetillhoff/webscan"
  license "MIT"
  version "v5.4.0"

  on_macos do
    on_arm do
      url "#{homepage}/releases/download/#{version}/webscan_darwin_arm64"
      sha256 "2580f8f6bbd44f7f38a5b2fc1b8c208b9cbbbbe6809fffe138c97a54f542c9ed"
    end

    on_intel do
      url "#{homepage}/releases/download/#{version}/webscan_darwin_amd64"
      sha256 "45a3ebaf47a915896000636411df00a8981fbb84186972bbc85e10687a9c1fdc"
    end
  end

  on_linux do
    on_arm do
      url "#{homepage}/releases/download/#{version}/webscan_linux_arm64"
      sha256 "c979a3d1392bbae35e2001b0f2c23c2fea533b0721d4bd6efa826eea0309e69e"
    end

    on_intel do
      url "#{homepage}/releases/download/#{version}/webscan_linux_amd64"
      sha256 "2edab1efdfd292088eb52a421a1689f060e0b2bbb27e6cf76fb4b21537b63fd0"
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
