class Webscan < Formula
  desc "Verifies web things"
  homepage "https://github.com/thetillhoff/webscan"
  license "MIT"
  version "v5.4.48"

  on_macos do
    on_arm do
      url "#{homepage}/releases/download/#{version}/webscan_darwin_arm64"
      sha256 "99c1ffa1062a2730449f3e1a6be12c379c347a3e9f065585c7940dc6610db922"
    end

    on_intel do
      url "#{homepage}/releases/download/#{version}/webscan_darwin_amd64"
      sha256 "7fe1e8987e66a03a39a823746406011157d258a5c4130cce84804b53e1ada56e"
    end
  end

  on_linux do
    on_arm do
      url "#{homepage}/releases/download/#{version}/webscan_linux_arm64"
      sha256 "5040146d26ae2254068bed978ad0169de7ffae1246d154acc099df96fbaa68fa"
    end

    on_intel do
      url "#{homepage}/releases/download/#{version}/webscan_linux_amd64"
      sha256 "90a911c0d724ac2b118d3fa93a1f6252fb261ae5d641fb49e4f0c38c3c0581a2"
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
