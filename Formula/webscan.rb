class Webscan < Formula
  desc "Verifies web things"
  homepage "https://github.com/thetillhoff/webscan"
  license "MIT"
  version "v5.4.57"

  on_macos do
    on_arm do
      url "#{homepage}/releases/download/#{version}/webscan_darwin_arm64"
      sha256 "866c0daebd27fbaf381a727144df1e2e3cff3be7ad5c86fcafc0f5f6bd302fa9"
    end

    on_intel do
      url "#{homepage}/releases/download/#{version}/webscan_darwin_amd64"
      sha256 "b544a119417529303f0a3c5fef64b0dc9bad433dc5b448c7a3fbd070cfd01cba"
    end
  end

  on_linux do
    on_arm do
      url "#{homepage}/releases/download/#{version}/webscan_linux_arm64"
      sha256 "08a83862dbd6f54d330781d83abcc60eebf467d91d8dabb0e42b59dafa6325da"
    end

    on_intel do
      url "#{homepage}/releases/download/#{version}/webscan_linux_amd64"
      sha256 "3b78e4989fd415373c7bd3c9c08102015e9a91705aaec07ff3511d0dc23da3f0"
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
