class Webscan < Formula
  desc "Verifies web things"
  homepage "https://github.com/thetillhoff/webscan"
  license "MIT"
  version "v5.4.15"

  on_macos do
    on_arm do
      url "#{homepage}/releases/download/#{version}/webscan_darwin_arm64"
      sha256 "1a4b035d1d0506647c8658299a45ba77c4709dcb4779341f699ab026d4f9ddd4"
    end

    on_intel do
      url "#{homepage}/releases/download/#{version}/webscan_darwin_amd64"
      sha256 "9624cfa99ad603a6e1167ea8d258a0e57432db285c42e80956133cfe596010c3"
    end
  end

  on_linux do
    on_arm do
      url "#{homepage}/releases/download/#{version}/webscan_linux_arm64"
      sha256 "447771d12b6485b6b0715e07f31f4ea2d03b7449443a34f948f04e3b0cf1e9ba"
    end

    on_intel do
      url "#{homepage}/releases/download/#{version}/webscan_linux_amd64"
      sha256 "dad71f4412e2e09962d919edfbd3c99e374041e62da39dbfcd2ae1f556b41360"
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
