class Temingo < Formula
  desc "Minimal golang templater for websites"
  homepage "https://github.com/thetillhoff/temingo"
  license "MIT"
  version "v3.0.15"

  on_macos do
    on_arm do
      url "#{homepage}/releases/download/#{version}/temingo_darwin_arm64"
      sha256 "9a5b44278548c99f2e4aa829596a349cf18480e96387ae93cef2eb0655b7151f"
    end

    on_intel do
      url "#{homepage}/releases/download/#{version}/temingo_darwin_amd64"
      sha256 "f2276072a6c9f92b81dd82d82a6b72ad6059953f3fba141ae6bece540f27a7ef"
    end
  end

  on_linux do
    on_arm do
      url "#{homepage}/releases/download/#{version}/temingo_linux_arm64"
      sha256 "1fca2d5c20519429ebf6b31475e2798a9cb094c94b9742ecc95e4b60c1f535c1"
    end

    on_intel do
      url "#{homepage}/releases/download/#{version}/temingo_linux_amd64"
      sha256 "f55158293ebef5ce14f68aa7e9356c24d7122ffa30a454f65180b53d6bae279e"
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
