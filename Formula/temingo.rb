class Temingo < Formula
  desc "Minimal golang templater for websites"
  homepage "https://github.com/thetillhoff/temingo"
  license "MIT"
  version "v3.0.31"

  on_macos do
    on_arm do
      url "#{homepage}/releases/download/#{version}/temingo_darwin_arm64"
      sha256 "a04396e138d2b7935e23068c8ac1f15a463c7f8777751de1b99c56e1189dcb67"
    end

    on_intel do
      url "#{homepage}/releases/download/#{version}/temingo_darwin_amd64"
      sha256 "b0c7183ce3705bc587cb7ba6b9ef0095eb7cfd96060cb42b3a860b48fcd201ff"
    end
  end

  on_linux do
    on_arm do
      url "#{homepage}/releases/download/#{version}/temingo_linux_arm64"
      sha256 "a92a0570c96535d0a1c53d26dd6f92efc6c2ab2a10334fdc9419d51386045d92"
    end

    on_intel do
      url "#{homepage}/releases/download/#{version}/temingo_linux_amd64"
      sha256 "e2a8573935811bf8f01b92b805455e40ad1ed7acdff9e72f5bc27220f601fb89"
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
