class Webscan < Formula
  desc "Verifies web things"
  homepage "https://github.com/thetillhoff/webscan"
  license "MIT"
  version "v5.3.1"

  on_macos do
    on_arm do
      url "#{homepage}/releases/download/#{version}/webscan_darwin_arm64"
      sha256 "c45758b37f3639f3c52bd0b885407074a8be8633aca50dd8476dd7d595aa9dec"
    end

    on_intel do
      url "#{homepage}/releases/download/#{version}/webscan_darwin_amd64"
      sha256 "cc9236133457cc3d643130816fc277a8d7869412c726a2dcb07de07246ad4a49"
    end
  end

  on_linux do
    on_arm do
      url "#{homepage}/releases/download/#{version}/webscan_linux_arm64"
      sha256 "d85ebaeab8f3a8804c015bc8aaa14862b72724958e022b9d8ba505bf034bd46d"
    end

    on_intel do
      url "#{homepage}/releases/download/#{version}/webscan_linux_amd64"
      sha256 "ea25df6dc4355697990aa06f9890290f9552f727e8dfec50b822aa4ebbb93ace"
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
