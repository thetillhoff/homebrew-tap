class Temingo < Formula
  desc "Minimal golang templater for websites"
  homepage "https://github.com/thetillhoff/temingo"
  license "MIT"
  version "v3.0.37"

  on_macos do
    on_arm do
      url "#{homepage}/releases/download/#{version}/temingo_darwin_arm64"
      sha256 "22cf365de5e238d02cb7330288ecba92f18765a9255aa9153addf2241cb23673"
    end

    on_intel do
      url "#{homepage}/releases/download/#{version}/temingo_darwin_amd64"
      sha256 "c46d3da1d113896ffabf7069549e60c2af6d6e173e9299288f2ce826bbd7b12c"
    end
  end

  on_linux do
    on_arm do
      url "#{homepage}/releases/download/#{version}/temingo_linux_arm64"
      sha256 "b742c32261883e40ceea3b6b127d1a6120df2476f7d9dee1419638d5fc7f22cf"
    end

    on_intel do
      url "#{homepage}/releases/download/#{version}/temingo_linux_amd64"
      sha256 "a20b7767abc824015d3cbdcebde1dc61db2f70fc26be714e37067c85bebbad82"
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
