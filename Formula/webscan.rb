class Webscan < Formula
  desc "Verifies web things"
  homepage "https://github.com/thetillhoff/webscan"
  license "MIT"
  version "v4.1.0"

  on_macos do
    on_arm do
      url "#{homepage}/releases/download/#{version}/webscan_darwin_arm64"
      sha256 "373c9fd6fdcdfd9c689f9d250e321a2697886902a364b1ae3788b996def7caad"
    end

    on_intel do
      url "#{homepage}/releases/download/#{version}/webscan_darwin_amd64"
      sha256 "f4c3fd31f323f56ca09987157e0ccaff45ffe8f9767db81bb8a9ea38f6fb9a12"
    end
  end

  on_linux do
    on_arm do
      url "#{homepage}/releases/download/#{version}/webscan_linux_arm64"
      sha256 "8ae69621fd05a8b8159e7336a5ba9ea5e0451a8a2c4752efa30e0cd078789a8f"
    end

    on_intel do
      url "#{homepage}/releases/download/#{version}/webscan_linux_amd64"
      sha256 "1256d382780bc59de63b99ae2e0fc0ead7728e66163beb72c667b171628f507c"
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
