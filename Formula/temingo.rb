class Temingo < Formula
  desc "Minimal golang templater for websites"
  homepage "https://github.com/thetillhoff/temingo"
  license "MIT"
  version "v2.2.0"

  on_macos do
    on_arm do
      url "#{homepage}/releases/download/#{version}/temingo_darwin_arm64"
      sha256 "685f8be067f30e5b7fb0cf62eb65714ed44c55093e0d09737871172dbab5dab8"
    end

    on_intel do
      url "#{homepage}/releases/download/#{version}/temingo_darwin_amd64"
      sha256 "50fd10a1c9eb6c92334a85986c5cd851740ad63851a89176a9b84dd6c7070944"
    end
  end

  on_linux do
    on_arm do
      url "#{homepage}/releases/download/#{version}/temingo_linux_arm64"
      sha256 "591c95619e2082089e0cdaad58ad8a49991fc2306ac4d9ba0d655d45ad5ff43b"
    end

    on_intel do
      url "#{homepage}/releases/download/#{version}/temingo_linux_amd64"
      sha256 "0b4fe9b4f7e040cc42549e037c5219acceabf5d8a7e857bf78e341578b1d3184"
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
