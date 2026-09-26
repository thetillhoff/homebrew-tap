class Webscan < Formula
  desc "Verifies web things"
  homepage "https://github.com/thetillhoff/webscan"
  license "MIT"
  version "v5.4.32"

  on_macos do
    on_arm do
      url "#{homepage}/releases/download/#{version}/webscan_darwin_arm64"
      sha256 "eff234e61288bd596ec2563111f94a8938e057cd21a33ac423ec484855e9712a"
    end

    on_intel do
      url "#{homepage}/releases/download/#{version}/webscan_darwin_amd64"
      sha256 "99513d814e4ed15d695da7976bc33409e1099ba9ab31a1b1c0cc5d128416ffc7"
    end
  end

  on_linux do
    on_arm do
      url "#{homepage}/releases/download/#{version}/webscan_linux_arm64"
      sha256 "c37ee268411534bb5631bd056c9a259ce6ceddb76c41fabcabfb2224c4e1a4a9"
    end

    on_intel do
      url "#{homepage}/releases/download/#{version}/webscan_linux_amd64"
      sha256 "70fd928b7015bc0951dc59902eda0005fe959b6ee846282fe4e7cebe48c69057"
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
