class Webscan < Formula
  desc "Verifies web things"
  homepage "https://github.com/thetillhoff/webscan"
  license "MIT"
  version "v5.4.30"

  on_macos do
    on_arm do
      url "#{homepage}/releases/download/#{version}/webscan_darwin_arm64"
      sha256 "4dff20a7088a606602c1a778da2d004bc0f4253c57090997cbec38c5341c56dc"
    end

    on_intel do
      url "#{homepage}/releases/download/#{version}/webscan_darwin_amd64"
      sha256 "f60bf787b47c8bca88870d4ad3a4b59ea84a73f71cf89d8598dc52f30a38c946"
    end
  end

  on_linux do
    on_arm do
      url "#{homepage}/releases/download/#{version}/webscan_linux_arm64"
      sha256 "053501438d431f1c8ad1bf9f2c98356a606c2edb581a96940494ac760ec3c615"
    end

    on_intel do
      url "#{homepage}/releases/download/#{version}/webscan_linux_amd64"
      sha256 "5cff1924c036a1ee40ae4e44894badd8eae73d6eb17089df464b565ec467fc54"
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
