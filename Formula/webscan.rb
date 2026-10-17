class Webscan < Formula
  desc "Verifies web things"
  homepage "https://github.com/thetillhoff/webscan"
  license "MIT"
  version "v5.4.41"

  on_macos do
    on_arm do
      url "#{homepage}/releases/download/#{version}/webscan_darwin_arm64"
      sha256 "0835ef0a3add45172496b60df37e5e882da00dcf75b2e83a0431e9b13e0850ca"
    end

    on_intel do
      url "#{homepage}/releases/download/#{version}/webscan_darwin_amd64"
      sha256 "280724f923c2b11311de96cb9d80b90d9c966a17f2bb753a93bf9c431e65c3e1"
    end
  end

  on_linux do
    on_arm do
      url "#{homepage}/releases/download/#{version}/webscan_linux_arm64"
      sha256 "86cb0330350251db914dbad12f491a4a2c3b7e963fe6d59d9a347d92eb0ec9bc"
    end

    on_intel do
      url "#{homepage}/releases/download/#{version}/webscan_linux_amd64"
      sha256 "6b88a1d9aaf15942ec50154d24f47ba53b8d9325df706ad6da2e0390abb6f410"
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
