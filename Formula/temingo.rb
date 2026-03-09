class Temingo < Formula
  desc "Minimal golang templater for websites"
  homepage "https://github.com/thetillhoff/temingo"
  license "MIT"
  version "null"

  on_macos do
    on_arm do
      url "#{homepage}/releases/download/#{version}/temingo_darwin_arm64"
      sha256 "Not Found"
    end

    on_intel do
      url "#{homepage}/releases/download/#{version}/temingo_darwin_amd64"
      sha256 "Not Found"
    end
  end

  on_linux do
    on_arm do
      url "#{homepage}/releases/download/#{version}/temingo_linux_arm64"
      sha256 "Not Found"
    end

    on_intel do
      url "#{homepage}/releases/download/#{version}/temingo_linux_amd64"
      sha256 "Not Found"
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
