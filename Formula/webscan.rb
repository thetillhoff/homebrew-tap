class Webscan < Formula
  desc "Verifies web things"
  homepage "https://github.com/thetillhoff/webscan"
  license "MIT"
  version "v5.4.50"

  on_macos do
    on_arm do
      url "#{homepage}/releases/download/#{version}/webscan_darwin_arm64"
      sha256 "2e22876c08ec6e9549749c2e241fcb0968e6b898487b5a7fc8891ead4b7cfb59"
    end

    on_intel do
      url "#{homepage}/releases/download/#{version}/webscan_darwin_amd64"
      sha256 "0d3f9b0ed693a189c6002526512099a1c138ce5cd42f8511cc7ebbc5de415118"
    end
  end

  on_linux do
    on_arm do
      url "#{homepage}/releases/download/#{version}/webscan_linux_arm64"
      sha256 "65597f5b6571212020584bf67b73ed9ef5b9a92f8e54cb19e13a9831b9311ac3"
    end

    on_intel do
      url "#{homepage}/releases/download/#{version}/webscan_linux_amd64"
      sha256 "9be0b8e415fe16bc8759892af2fe7f1bfae10795d1e45ae785caa61c086a2848"
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
