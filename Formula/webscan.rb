class Webscan < Formula
  desc "Verifies web things"
  homepage "https://github.com/thetillhoff/webscan"
  license "MIT"
  version "v5.4.54"

  on_macos do
    on_arm do
      url "#{homepage}/releases/download/#{version}/webscan_darwin_arm64"
      sha256 "f9b5addcb793f1f81096e7ddce36b0c523217617f89404fa368cefaab6d3128f"
    end

    on_intel do
      url "#{homepage}/releases/download/#{version}/webscan_darwin_amd64"
      sha256 "ebf9f4ed0a94c6bad4d1b0893ec1721b96abe52e59edac85ce6ea23d3f4127bb"
    end
  end

  on_linux do
    on_arm do
      url "#{homepage}/releases/download/#{version}/webscan_linux_arm64"
      sha256 "8bb32f1678526679e293762c3039bca4c37e8a99f585d8473d97c6d3066c337c"
    end

    on_intel do
      url "#{homepage}/releases/download/#{version}/webscan_linux_amd64"
      sha256 "890aa779a7302a9c7bcc2a20841125f2b7000fb4c0d566b0718480346e981c9c"
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
