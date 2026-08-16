class Temingo < Formula
  desc "Minimal golang templater for websites"
  homepage "https://github.com/thetillhoff/temingo"
  license "MIT"
  version "v3.0.14"

  on_macos do
    on_arm do
      url "#{homepage}/releases/download/#{version}/temingo_darwin_arm64"
      sha256 "67b8fb6c144e684426fb14dad94f7976209c1606f7d2fe70c253244fef10ed8d"
    end

    on_intel do
      url "#{homepage}/releases/download/#{version}/temingo_darwin_amd64"
      sha256 "eff3a1c32713151161fbeabd3b49e55d3ece5bbe0957cb11b916d9478e32bebb"
    end
  end

  on_linux do
    on_arm do
      url "#{homepage}/releases/download/#{version}/temingo_linux_arm64"
      sha256 "c757ec1e9bc9fda453141c4568bdea61286d7589c237a8069e8cceb5953c88f6"
    end

    on_intel do
      url "#{homepage}/releases/download/#{version}/temingo_linux_amd64"
      sha256 "1cbbd8fc9b923926ef0d6bdcaf32621381b6d7349ac279ce3c27943a8061a456"
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
