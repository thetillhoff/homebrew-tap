class Webscan < Formula
  desc "Verifies web things"
  homepage "https://github.com/thetillhoff/webscan"
  license "MIT"
  version "v5.4.55"

  on_macos do
    on_arm do
      url "#{homepage}/releases/download/#{version}/webscan_darwin_arm64"
      sha256 "235005312dd70b290eefb86b9ade3bb996215f1bf45a93efe03891c6a3df3363"
    end

    on_intel do
      url "#{homepage}/releases/download/#{version}/webscan_darwin_amd64"
      sha256 "82d0581455a77231c60facf361b8a90298aab99ad3ec71f7ea91f2185a937d39"
    end
  end

  on_linux do
    on_arm do
      url "#{homepage}/releases/download/#{version}/webscan_linux_arm64"
      sha256 "9a51192f0a48dc71bba067d1c89b6b88a2c11cfadc9652f7c99df890134fb46b"
    end

    on_intel do
      url "#{homepage}/releases/download/#{version}/webscan_linux_amd64"
      sha256 "b928d08ab2d7f0503892e4f208837b2bcb9a3665c0938a5d9a0796993a8aaef7"
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
