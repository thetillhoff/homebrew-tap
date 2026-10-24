class Webscan < Formula
  desc "Verifies web things"
  homepage "https://github.com/thetillhoff/webscan"
  license "MIT"
  version "v5.4.45"

  on_macos do
    on_arm do
      url "#{homepage}/releases/download/#{version}/webscan_darwin_arm64"
      sha256 "015ff66a5d63d7302c3fd73e3f92c34e11afe71647a0f14b0a68eacb36605f10"
    end

    on_intel do
      url "#{homepage}/releases/download/#{version}/webscan_darwin_amd64"
      sha256 "5409032fec8a1c6085e68cdff679fc1a6a3e947ae94813c91af48cde1217183e"
    end
  end

  on_linux do
    on_arm do
      url "#{homepage}/releases/download/#{version}/webscan_linux_arm64"
      sha256 "1bfa20203a05284fe06899e53ff84d0fd81c73899e88772a4f4985cd20d63985"
    end

    on_intel do
      url "#{homepage}/releases/download/#{version}/webscan_linux_amd64"
      sha256 "1c4279e4fd31b78e925c58d239767f3980749a28ce197e830ef4b1bb47649851"
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
