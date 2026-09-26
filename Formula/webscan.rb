class Webscan < Formula
  desc "Verifies web things"
  homepage "https://github.com/thetillhoff/webscan"
  license "MIT"
  version "v5.4.31"

  on_macos do
    on_arm do
      url "#{homepage}/releases/download/#{version}/webscan_darwin_arm64"
      sha256 "7295474b0a4ec1576b53a3d872398e7bf47bfebb74dc6f3f20bdb6be97e798c0"
    end

    on_intel do
      url "#{homepage}/releases/download/#{version}/webscan_darwin_amd64"
      sha256 "c1fae59cfd345300ee6e942b0c75f4fff45dbe40ae1c0294bdcfbe76b625dd6c"
    end
  end

  on_linux do
    on_arm do
      url "#{homepage}/releases/download/#{version}/webscan_linux_arm64"
      sha256 "73376ee903c7b3efc702bf377881e9f3f69a8f45fc4481dbb7aef7debe20adcd"
    end

    on_intel do
      url "#{homepage}/releases/download/#{version}/webscan_linux_amd64"
      sha256 "97a7acac5988a0496d7350381e6821dfc031e0af6931a3d28ef19220534ddebb"
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
