class Webscan < Formula
  desc "Verifies web things"
  homepage "https://github.com/thetillhoff/webscan"
  license "MIT"
  version "v5.4.11"

  on_macos do
    on_arm do
      url "#{homepage}/releases/download/#{version}/webscan_darwin_arm64"
      sha256 "f155d13afde1a8dd0bdc4d8d6ab81803c6535a1f61e8b01fa57a2ba3ccd48dd3"
    end

    on_intel do
      url "#{homepage}/releases/download/#{version}/webscan_darwin_amd64"
      sha256 "dc2e67f3419480739746970ac9f5dc240a4b331694bf23891ec3de694d3d4c38"
    end
  end

  on_linux do
    on_arm do
      url "#{homepage}/releases/download/#{version}/webscan_linux_arm64"
      sha256 "a2efdb282436e051a23136619a6de368069bb76c92ed81b787540eb1f4bee097"
    end

    on_intel do
      url "#{homepage}/releases/download/#{version}/webscan_linux_amd64"
      sha256 "c8e76d93c2a024fca61e2dfb4686c8d78a64ebcb948bb8dc8257fd1e951742f3"
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
