class Webscan < Formula
  desc "Verifies web things"
  homepage "https://github.com/thetillhoff/webscan"
  license "MIT"
  version "v5.4.5"

  on_macos do
    on_arm do
      url "#{homepage}/releases/download/#{version}/webscan_darwin_arm64"
      sha256 "e7a9ba96559432a4dd6ed7d1e26444040b7e01c4241e7d0d273d6c92d1432498"
    end

    on_intel do
      url "#{homepage}/releases/download/#{version}/webscan_darwin_amd64"
      sha256 "66bf43c0388b75578d8d989160e2bff233cd5344e72f24d0b2eefd6ff17b6c60"
    end
  end

  on_linux do
    on_arm do
      url "#{homepage}/releases/download/#{version}/webscan_linux_arm64"
      sha256 "562e1804184daedc9cb6dbff94d672b424ad767e87efaac8177b4a247fe98e5d"
    end

    on_intel do
      url "#{homepage}/releases/download/#{version}/webscan_linux_amd64"
      sha256 "fd7d20b6b1b8c0f7714379e23ce5a7b8d901dec98a37674af7e8b97155d85f93"
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
