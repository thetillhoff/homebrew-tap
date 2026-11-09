class Temingo < Formula
  desc "Minimal golang templater for websites"
  homepage "https://github.com/thetillhoff/temingo"
  license "MIT"
  version "v3.0.39"

  on_macos do
    on_arm do
      url "#{homepage}/releases/download/#{version}/temingo_darwin_arm64"
      sha256 "3369be4cdb06364a6660f6e7df743818d3ae30f085e16cc47e6d7d62ee94816f"
    end

    on_intel do
      url "#{homepage}/releases/download/#{version}/temingo_darwin_amd64"
      sha256 "ca091664100297a8703fd73cede493178c0f9024496fb1628fd3639b04d50500"
    end
  end

  on_linux do
    on_arm do
      url "#{homepage}/releases/download/#{version}/temingo_linux_arm64"
      sha256 "26d8e744a77150ee8df7cdf32f6d9b9ddbb8f9251cb48f0dbd97ff5d05b268b6"
    end

    on_intel do
      url "#{homepage}/releases/download/#{version}/temingo_linux_amd64"
      sha256 "7bb022997e3293e915744791a7160d6beb09f66391eb7642aafa8daf608430bb"
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
