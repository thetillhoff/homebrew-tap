class Temingo < Formula
  desc "Minimal golang templater for websites"
  homepage "https://github.com/thetillhoff/temingo"
  license "MIT"
  version "v3.0.35"

  on_macos do
    on_arm do
      url "#{homepage}/releases/download/#{version}/temingo_darwin_arm64"
      sha256 "75bee197f29a9030c1ad20a6269923865cf96107db2995273981421c4e427a02"
    end

    on_intel do
      url "#{homepage}/releases/download/#{version}/temingo_darwin_amd64"
      sha256 "3f6cb3199c0563557ade08ad2b1e5804c3cec86d1cbcef64db9c6b7a3a72cdff"
    end
  end

  on_linux do
    on_arm do
      url "#{homepage}/releases/download/#{version}/temingo_linux_arm64"
      sha256 "b6afa4347b889f37c7eca193fa5338f8308ca64885ee35bd13f1be04b283d93e"
    end

    on_intel do
      url "#{homepage}/releases/download/#{version}/temingo_linux_amd64"
      sha256 "40503fed2f8a5c5873ac97fb6db920549afbc8ae4fc4a8edf657e5a62b4fedbb"
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
