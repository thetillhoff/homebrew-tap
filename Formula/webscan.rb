class Webscan < Formula
  desc "Verifies web things"
  homepage "https://github.com/thetillhoff/webscan"
  license "MIT"
  version "v5.4.4"

  on_macos do
    on_arm do
      url "#{homepage}/releases/download/#{version}/webscan_darwin_arm64"
      sha256 "8a64c42274b1d73bad77e4929e5251964bab9d9519f9c5470bc5f69862a1380d"
    end

    on_intel do
      url "#{homepage}/releases/download/#{version}/webscan_darwin_amd64"
      sha256 "09cc51c0b1bf397d7979c181e51a07fa27a2465f0610548a10ed6a08581f4345"
    end
  end

  on_linux do
    on_arm do
      url "#{homepage}/releases/download/#{version}/webscan_linux_arm64"
      sha256 "cd05671aa522f82f609123fee47d9273d71a5114c877b7e8532c504b2c3a8144"
    end

    on_intel do
      url "#{homepage}/releases/download/#{version}/webscan_linux_amd64"
      sha256 "cec00a3bf93f7b4c52fc9d86b01f3bd53442569e8cde4d17bbf40d445bd4f815"
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
