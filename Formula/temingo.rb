class Temingo < Formula
  desc "Minimal golang templater for websites"
  homepage "https://github.com/thetillhoff/temingo"
  license "MIT"
  version "v3.0.8"

  on_macos do
    on_arm do
      url "#{homepage}/releases/download/#{version}/temingo_darwin_arm64"
      sha256 "b6c1706b28829624ba61287874ee720843a4d5ac30d79bd82779d694697411d5"
    end

    on_intel do
      url "#{homepage}/releases/download/#{version}/temingo_darwin_amd64"
      sha256 "465dc09342f7fa150543562b8dafb7238658ce7394325e6efb7e3798dcacefa3"
    end
  end

  on_linux do
    on_arm do
      url "#{homepage}/releases/download/#{version}/temingo_linux_arm64"
      sha256 "f2d5be1f7a82f589359a46b96e525469d5540dc7ac55f924f2c2d3d9569d026d"
    end

    on_intel do
      url "#{homepage}/releases/download/#{version}/temingo_linux_amd64"
      sha256 "34cd262c089ecd2095ced73510285563f2ecacfe32684462526afbbc3c9753ff"
    end
  end

  def install
    # Rename the downloaded file to 'temingo' and install it
    bin.install Dir["temingo_*"].first => "temingo"
  end

  test do
    assert_match "#{version}", shell_output("#{bin}/temingo --version")
  end
end
