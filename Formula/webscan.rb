class Webscan < Formula
  desc "Verifies web things"
  homepage "https://github.com/thetillhoff/webscan"
  license "MIT"
  version "v4.2.0"

  on_macos do
    on_arm do
      url "#{homepage}/releases/download/#{version}/webscan_darwin_arm64"
      sha256 "c68e96fa168a26937b8b1f74e16b98f7ee4ee67285432c921040ae7edb80d872"
    end

    on_intel do
      url "#{homepage}/releases/download/#{version}/webscan_darwin_amd64"
      sha256 "3ec27ceb39f9ccee71825460c96dc2cda5916c973afbef70aac20d02cb62d3da"
    end
  end

  on_linux do
    on_arm do
      url "#{homepage}/releases/download/#{version}/webscan_linux_arm64"
      sha256 "b41286d5a6f9ecce85aa83919b28fd7a1e9b8942b1b16bfea07ef6571a6683bc"
    end

    on_intel do
      url "#{homepage}/releases/download/#{version}/webscan_linux_amd64"
      sha256 "886305c8772e114416d64975d042643a22504468625b19ed48e22a3d605ec925"
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
