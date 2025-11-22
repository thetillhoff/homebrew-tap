class Temingo < Formula
  desc "Minimal golang templater for websites"
  homepage "https://github.com/thetillhoff/temingo"
  license "MIT"
  version "v2.0.0"

  on_macos do
    on_arm do
      url "#{homepage}/releases/download/#{version}/temingo_darwin_arm64"
      sha256 "c317c3ba946dd7c2a55007af2a9eb6a80c7d1fcb52636d13682cfc4325b1946d"
    end

    on_intel do
      url "#{homepage}/releases/download/#{version}/temingo_darwin_amd64"
      sha256 "4958d097d7aa61855cb076a87c94492b41308a5190bec55d07d4aec71474db30"
    end
  end

  on_linux do
    on_arm do
      url "#{homepage}/releases/download/#{version}/temingo_linux_arm64"
      sha256 "b378798956efb3d9e2f66173d4c1f90c0596bfffd6033d00297355fcc76bc426"
    end

    on_intel do
      url "#{homepage}/releases/download/#{version}/temingo_linux_amd64"
      sha256 "a963aa8c685ee3addbe8683db42c88f21080833b4af1b11aacc8eadc34e7bdaa"
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
