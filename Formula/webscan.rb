class Webscan < Formula
  desc "Verifies web things"
  homepage "https://github.com/thetillhoff/webscan"
  license "MIT"
  version "v5.4.34"

  on_macos do
    on_arm do
      url "#{homepage}/releases/download/#{version}/webscan_darwin_arm64"
      sha256 "3d0197408d266840c8e008b1a4d9a1c87d99feffa74ccdaa15aa80fa8fcd118b"
    end

    on_intel do
      url "#{homepage}/releases/download/#{version}/webscan_darwin_amd64"
      sha256 "a3dda4844b4b859a1d4cdcc85f61bb4688af7d837f0a6b2397e11c9943c4a7d1"
    end
  end

  on_linux do
    on_arm do
      url "#{homepage}/releases/download/#{version}/webscan_linux_arm64"
      sha256 "d50983022ed55d4d17cb38b8690ae76cc93d89ce0d271152d4c0680cb10f133a"
    end

    on_intel do
      url "#{homepage}/releases/download/#{version}/webscan_linux_amd64"
      sha256 "6750e75d0b269649a99c37fe32add2b371f053beea0730c415dc9af91dd7b2e4"
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
