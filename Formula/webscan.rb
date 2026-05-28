class Webscan < Formula
  desc "Verifies web things"
  homepage "https://github.com/thetillhoff/webscan"
  license "MIT"
  version "v5.0.0"

  on_macos do
    on_arm do
      url "#{homepage}/releases/download/#{version}/webscan_darwin_arm64"
      sha256 "43f9aa7dc528b7a1ba6a9f7d31743997b88da71ea4c1b482e5cd206bdbcb3797"
    end

    on_intel do
      url "#{homepage}/releases/download/#{version}/webscan_darwin_amd64"
      sha256 "acac6c9826d18d4cb2ecf640f5913a818d250f36788f489bc71b89fb99d96e11"
    end
  end

  on_linux do
    on_arm do
      url "#{homepage}/releases/download/#{version}/webscan_linux_arm64"
      sha256 "21eb77e6ca52133d2e66bd4b252b3d8025608b497f99cdf179bd2f8156c9ebd3"
    end

    on_intel do
      url "#{homepage}/releases/download/#{version}/webscan_linux_amd64"
      sha256 "a5032e0cf005f9d52105789a4fc8976a3e947ddc063813da42d604a8a4d501d7"
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
