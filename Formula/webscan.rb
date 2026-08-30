class Webscan < Formula
  desc "Verifies web things"
  homepage "https://github.com/thetillhoff/webscan"
  license "MIT"
  version "v5.4.16"

  on_macos do
    on_arm do
      url "#{homepage}/releases/download/#{version}/webscan_darwin_arm64"
      sha256 "73463eed525d53e2b5b32f01d32ce4ea13ec8a88271775a256781178a5543ef2"
    end

    on_intel do
      url "#{homepage}/releases/download/#{version}/webscan_darwin_amd64"
      sha256 "42c1493e7cf9ee8077f01b70a153cd08faa8ead192553db29c00109cc214b3b8"
    end
  end

  on_linux do
    on_arm do
      url "#{homepage}/releases/download/#{version}/webscan_linux_arm64"
      sha256 "f9e9d7007e26b243c9761a8e65bbd6e7545b7849de9aa945da43764f691df338"
    end

    on_intel do
      url "#{homepage}/releases/download/#{version}/webscan_linux_amd64"
      sha256 "3c1157daf7ab40ab01ca9ae62e2d8cccd6c72c46c9b988a9e59a265d866758af"
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
