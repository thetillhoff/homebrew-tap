class Webscan < Formula
  desc "Verifies web things"
  homepage "https://github.com/thetillhoff/webscan"
  license "MIT"
  version "v5.4.56"

  on_macos do
    on_arm do
      url "#{homepage}/releases/download/#{version}/webscan_darwin_arm64"
      sha256 "237e5e40508caaaba16518f43e623f2021f4eeb287c51e092041cdfc001a98d0"
    end

    on_intel do
      url "#{homepage}/releases/download/#{version}/webscan_darwin_amd64"
      sha256 "9e3e24e7d0fdfd93322609f87c02ef7128b72575dbda6a713e371183c63b076c"
    end
  end

  on_linux do
    on_arm do
      url "#{homepage}/releases/download/#{version}/webscan_linux_arm64"
      sha256 "a3783e7421ed7ac75afebdb87861f69c4b3c870f3175ba8bd54c85bbc7725729"
    end

    on_intel do
      url "#{homepage}/releases/download/#{version}/webscan_linux_amd64"
      sha256 "343902720ad3d494773178563ab2131f1fd0a3addb4c80382b46a20c8a146c20"
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
