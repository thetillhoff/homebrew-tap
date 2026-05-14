class Temingo < Formula
  desc "Minimal golang templater for websites"
  homepage "https://github.com/thetillhoff/temingo"
  license "MIT"
  version "v2.3.0"

  on_macos do
    on_arm do
      url "#{homepage}/releases/download/#{version}/temingo_darwin_arm64"
      sha256 "b9fc799996f2365a49cc59dddcc7b6f32fcb3d52e09461756e2323d46fd9b94e"
    end

    on_intel do
      url "#{homepage}/releases/download/#{version}/temingo_darwin_amd64"
      sha256 "53f7d88c6a843d2f8c0ec7d421807f0a4a84f6622b58501974beb4c5410a080d"
    end
  end

  on_linux do
    on_arm do
      url "#{homepage}/releases/download/#{version}/temingo_linux_arm64"
      sha256 "4c106db2d56dc26d6148be1ce10311a85b0277d5b7627752dc65804805ebc290"
    end

    on_intel do
      url "#{homepage}/releases/download/#{version}/temingo_linux_amd64"
      sha256 "4e70b581f60f3bcdc16137498c27b21c8526de3b7d938991bac5cf6c0d629ae2"
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
