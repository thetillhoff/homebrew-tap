class Temingo < Formula
  desc "Minimal golang templater for websites"
  homepage "https://github.com/thetillhoff/temingo"
  license "MIT"
  version "v3.0.21"

  on_macos do
    on_arm do
      url "#{homepage}/releases/download/#{version}/temingo_darwin_arm64"
      sha256 "3f4bb1f13860f29d9c9c3fb1d284658b3ae1d5cd23bbf1efb24a2d4209da8548"
    end

    on_intel do
      url "#{homepage}/releases/download/#{version}/temingo_darwin_amd64"
      sha256 "d0071d14125d6b45ed7c85cfee105ba7bd0bd9704c947de835a90fb90ea9896c"
    end
  end

  on_linux do
    on_arm do
      url "#{homepage}/releases/download/#{version}/temingo_linux_arm64"
      sha256 "32d407657c53be3049266e9df8cb1e3b581016bbd65a0ad0d0a1c70fad811bc0"
    end

    on_intel do
      url "#{homepage}/releases/download/#{version}/temingo_linux_amd64"
      sha256 "2356239fb5a3c3b67026064e06329c8f59346a14a048615feb8c5af5f4f1a745"
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
