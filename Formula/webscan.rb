class Webscan < Formula
  desc "Verifies web things"
  homepage "https://github.com/thetillhoff/webscan"
  license "MIT"
  version "v5.4.43"

  on_macos do
    on_arm do
      url "#{homepage}/releases/download/#{version}/webscan_darwin_arm64"
      sha256 "662c96be514444d50aba163585bde15af7d2525a53a6b2f2bf3e85a075647c04"
    end

    on_intel do
      url "#{homepage}/releases/download/#{version}/webscan_darwin_amd64"
      sha256 "2d26f9f12b4b0d2d4a1625be115653dfad666661d22aaa1b62bedcdc47d500c7"
    end
  end

  on_linux do
    on_arm do
      url "#{homepage}/releases/download/#{version}/webscan_linux_arm64"
      sha256 "b5413d8b2a361dbd787001902e95099893f3f77e86ad32e6dfbe3128446c00c7"
    end

    on_intel do
      url "#{homepage}/releases/download/#{version}/webscan_linux_amd64"
      sha256 "763f8813694d9bc6c1dbb2242e95483a90ea11684c57d52c7f85dfb8dd29d580"
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
