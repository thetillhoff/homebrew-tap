class Temingo < Formula
  desc "Minimal golang templater for websites"
  homepage "https://github.com/thetillhoff/temingo"
  license "MIT"
  version "v3.0.0"

  on_macos do
    on_arm do
      url "#{homepage}/releases/download/#{version}/temingo_darwin_arm64"
      sha256 "2a988a5a6ec534a33c6507a6cb71e4e758854d66d36cf6209c943a0b4c8832b2"
    end

    on_intel do
      url "#{homepage}/releases/download/#{version}/temingo_darwin_amd64"
      sha256 "bd1f571e43c4922b0270d612699af64a62dd2d3807e5f980adb16322492b37d8"
    end
  end

  on_linux do
    on_arm do
      url "#{homepage}/releases/download/#{version}/temingo_linux_arm64"
      sha256 "233f8e6ce115f5f4cbaffa56e2124d57bd40c0fbd0915698340dd07f76223ce4"
    end

    on_intel do
      url "#{homepage}/releases/download/#{version}/temingo_linux_amd64"
      sha256 "2ddc73aa335cf2ffe343cd806ccbd96e93ed0bbcd61c502134f2cf273f218cb5"
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
