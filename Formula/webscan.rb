class Webscan < Formula
  desc "Verifies web things"
  homepage "https://github.com/thetillhoff/webscan"
  license "MIT"
  version "v5.4.46"

  on_macos do
    on_arm do
      url "#{homepage}/releases/download/#{version}/webscan_darwin_arm64"
      sha256 "125ac087ee6f4df89058e7661660b27f69195c5860ac6000166cde9f5f9d43c0"
    end

    on_intel do
      url "#{homepage}/releases/download/#{version}/webscan_darwin_amd64"
      sha256 "f5ec0520e1d2228677ceb052f0ac60718aa7cee7a037e29bc216416074310806"
    end
  end

  on_linux do
    on_arm do
      url "#{homepage}/releases/download/#{version}/webscan_linux_arm64"
      sha256 "fa9353cfc6fe86626388b63414b4dc57ae2e6635c968ee7763fe38cfd1723b93"
    end

    on_intel do
      url "#{homepage}/releases/download/#{version}/webscan_linux_amd64"
      sha256 "3931b605301bf9e0cfb23527c4af63c8ab289d4f253e67e3089b44cff337fc74"
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
