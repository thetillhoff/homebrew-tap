class Webscan < Formula
  desc "Verifies web things"
  homepage "https://github.com/thetillhoff/webscan"
  license "MIT"
  version "v5.4.18"

  on_macos do
    on_arm do
      url "#{homepage}/releases/download/#{version}/webscan_darwin_arm64"
      sha256 "947892d514558c48f4c847c095ee7dd69e835ec79d1698f763617ef539b10a9b"
    end

    on_intel do
      url "#{homepage}/releases/download/#{version}/webscan_darwin_amd64"
      sha256 "afd2e769a07cda9f8a3474dc81d9dd092d0d454e607bfcf8ccfacef3d7daaf7d"
    end
  end

  on_linux do
    on_arm do
      url "#{homepage}/releases/download/#{version}/webscan_linux_arm64"
      sha256 "2420b7f07ccb8e232cbf2212e856b7bab0476affd89459c86d8ef3fe6e755bd6"
    end

    on_intel do
      url "#{homepage}/releases/download/#{version}/webscan_linux_amd64"
      sha256 "638263ca035f99850b54dc3920e87f0f33a99dc2a9078be364878966fb3fdc91"
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
