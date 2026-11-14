class Temingo < Formula
  desc "Minimal golang templater for websites"
  homepage "https://github.com/thetillhoff/temingo"
  license "MIT"
  version "v3.0.41"

  on_macos do
    on_arm do
      url "#{homepage}/releases/download/#{version}/temingo_darwin_arm64"
      sha256 "89ce071e06c055f7e4e0ffe00eb03ff1d4dbc216a91ed57e27870ff91426049a"
    end

    on_intel do
      url "#{homepage}/releases/download/#{version}/temingo_darwin_amd64"
      sha256 "0cde325a7d7a08a3c64c215be5ad624e7f3862a1b7278245d246ea6a39f116ad"
    end
  end

  on_linux do
    on_arm do
      url "#{homepage}/releases/download/#{version}/temingo_linux_arm64"
      sha256 "eb260f8896f934b04a2a51dad34726ca77ea4c6ce6e6f9eaa23a91f9b7025aa8"
    end

    on_intel do
      url "#{homepage}/releases/download/#{version}/temingo_linux_amd64"
      sha256 "6523a6a4c26498e933750b6c5bdd161368c6e00a2601c8debc370c930afa1eda"
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
