class Webscan < Formula
  desc "Verifies web things"
  homepage "https://github.com/thetillhoff/webscan"
  license "MIT"
  version "v5.4.9"

  on_macos do
    on_arm do
      url "#{homepage}/releases/download/#{version}/webscan_darwin_arm64"
      sha256 "7dec3bf983341de161e81e056a0d65e2f19e81c317ecad369329efdd8effe1ad"
    end

    on_intel do
      url "#{homepage}/releases/download/#{version}/webscan_darwin_amd64"
      sha256 "3dadc7fd67cf53874999efc4d1e69e1bc68bab2c527d31a9c2262f6679f529b9"
    end
  end

  on_linux do
    on_arm do
      url "#{homepage}/releases/download/#{version}/webscan_linux_arm64"
      sha256 "81485c5f140eb808fce6c27c4fdcf75de3050c08008eb1e8a1c075272096fe9d"
    end

    on_intel do
      url "#{homepage}/releases/download/#{version}/webscan_linux_amd64"
      sha256 "b7c5ff8cda0d66d548f194d3c4d814353c2180e726d0e4a0a6486766a9dee23e"
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
