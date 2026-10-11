class Temingo < Formula
  desc "Minimal golang templater for websites"
  homepage "https://github.com/thetillhoff/temingo"
  license "MIT"
  version "v3.0.30"

  on_macos do
    on_arm do
      url "#{homepage}/releases/download/#{version}/temingo_darwin_arm64"
      sha256 "e8d2a57395b517103e39edc04d1a5dea5ffcdac697d6c7a66e6ba48d072499aa"
    end

    on_intel do
      url "#{homepage}/releases/download/#{version}/temingo_darwin_amd64"
      sha256 "0a118c57a505ab15e66801c033f7795ab390dbd6cef1159001a57d33101d306f"
    end
  end

  on_linux do
    on_arm do
      url "#{homepage}/releases/download/#{version}/temingo_linux_arm64"
      sha256 "9750bad36734a1f93db974f0ba3f48fa29f659233f7b3fabc607764dccc1bbd7"
    end

    on_intel do
      url "#{homepage}/releases/download/#{version}/temingo_linux_amd64"
      sha256 "db2e417246bb7bffcadf745c88e945b5cc5e7116f4ccd5d93ba3ccf14de935d7"
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
