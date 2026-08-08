class Webscan < Formula
  desc "Verifies web things"
  homepage "https://github.com/thetillhoff/webscan"
  license "MIT"
  version "v5.4.6"

  on_macos do
    on_arm do
      url "#{homepage}/releases/download/#{version}/webscan_darwin_arm64"
      sha256 "472bcd93502973c1ea7dda2c12363858b64bb04d5fbb4f9e979dcc9ed8d36b25"
    end

    on_intel do
      url "#{homepage}/releases/download/#{version}/webscan_darwin_amd64"
      sha256 "28419c90d10a579a2541f5dea1e6695b0a6d781cf5bc2986b344c86266b6ee67"
    end
  end

  on_linux do
    on_arm do
      url "#{homepage}/releases/download/#{version}/webscan_linux_arm64"
      sha256 "359b02b5d83383e310e8a1ce8996b4c4579954ee235f91a3b387ce4770a5d473"
    end

    on_intel do
      url "#{homepage}/releases/download/#{version}/webscan_linux_amd64"
      sha256 "a4a9cf7835fc186d6ebbe0deefad56cd4b86677e9512accb8f9eaf31efed95cd"
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
