class Temingo < Formula
  desc "Minimal golang templater for websites"
  homepage "https://github.com/thetillhoff/temingo"
  license "MIT"
  version "v3.0.25"

  on_macos do
    on_arm do
      url "#{homepage}/releases/download/#{version}/temingo_darwin_arm64"
      sha256 "dc4c3805062eff244c81f8714ae09abfa17fd4ac338790bde28ed421f7a0e2d9"
    end

    on_intel do
      url "#{homepage}/releases/download/#{version}/temingo_darwin_amd64"
      sha256 "c7b01c0947bc14a4acc3eae5eaadb8de4f8b7871719d3ad06d95b174fee22c45"
    end
  end

  on_linux do
    on_arm do
      url "#{homepage}/releases/download/#{version}/temingo_linux_arm64"
      sha256 "fb664a8046fc6a5aafd827d54d31d0cce978530edb00c9f6536410850f80f2b8"
    end

    on_intel do
      url "#{homepage}/releases/download/#{version}/temingo_linux_amd64"
      sha256 "95b6ea1e6f62c1be2eaca46704c7a78b11616c1003ebc4c566af3fe098455ac1"
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
