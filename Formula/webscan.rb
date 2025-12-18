class Webscan < Formula
  desc "Verifies web things"
  homepage "https://github.com/thetillhoff/webscan"
  license "MIT"
  version "v4.1.0"

  on_macos do
    on_arm do
      url "#{homepage}/releases/download/#{version}/webscan_darwin_arm64"
      sha256 "e92eeabf7dbae87422a0150c87fc82c0f53bc1b8c63f5361b2b05850e85fd032"
    end

    on_intel do
      url "#{homepage}/releases/download/#{version}/webscan_darwin_amd64"
      sha256 "129755b38c461a395ffa9034ec0add090ae05b82f935fad56f2a3db944e7ba29"
    end
  end

  on_linux do
    on_arm do
      url "#{homepage}/releases/download/#{version}/webscan_linux_arm64"
      sha256 "ef6c69006cce0db0676ad04fb9bb606ce8a3a952d310ddb5b3e6fddf6012d7aa"
    end

    on_intel do
      url "#{homepage}/releases/download/#{version}/webscan_linux_amd64"
      sha256 "a365e22370650ab4b14720ec1eadc0574b15748da6196adbf1fef2c0ee2bcd31"
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
