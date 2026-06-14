class Webscan < Formula
  desc "Verifies web things"
  homepage "https://github.com/thetillhoff/webscan"
  license "MIT"
  version "v5.3.0"

  on_macos do
    on_arm do
      url "#{homepage}/releases/download/#{version}/webscan_darwin_arm64"
      sha256 "1ae76f4a9203253841fb0759942bd59c85f9a625d598a1c1e9f55654fe7b5526"
    end

    on_intel do
      url "#{homepage}/releases/download/#{version}/webscan_darwin_amd64"
      sha256 "4bdf12a2a382a5d5a4a2f723cd405c766fcd47584416511db429851671e780db"
    end
  end

  on_linux do
    on_arm do
      url "#{homepage}/releases/download/#{version}/webscan_linux_arm64"
      sha256 "fe715caf0013ec607e1af11341cf7cb45ae53aea26c6a3dca88d17b9a5cdff63"
    end

    on_intel do
      url "#{homepage}/releases/download/#{version}/webscan_linux_amd64"
      sha256 "721a52d68bc2b8760a12f4461c838dee30fadbd903ce0f2c9c18852e714401f0"
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
