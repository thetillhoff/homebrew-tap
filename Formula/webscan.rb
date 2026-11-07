class Webscan < Formula
  desc "Verifies web things"
  homepage "https://github.com/thetillhoff/webscan"
  license "MIT"
  version "v5.4.51"

  on_macos do
    on_arm do
      url "#{homepage}/releases/download/#{version}/webscan_darwin_arm64"
      sha256 "c239813a81dca997647ea3e8578c7eb6050589e9451bda284350c8bdacf72c36"
    end

    on_intel do
      url "#{homepage}/releases/download/#{version}/webscan_darwin_amd64"
      sha256 "0e4c12503507943e0162ef6fb19532086864e85e1aa966da50e3ad7f280f02a8"
    end
  end

  on_linux do
    on_arm do
      url "#{homepage}/releases/download/#{version}/webscan_linux_arm64"
      sha256 "4040c71e3821a82d185183442d49b7cf52a7ed79cf41ffc83444c46b954ff1eb"
    end

    on_intel do
      url "#{homepage}/releases/download/#{version}/webscan_linux_amd64"
      sha256 "87e9b567c4db897af52d89a984c6baa933bcb05a4a9ab32dab1967b5641ad868"
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
