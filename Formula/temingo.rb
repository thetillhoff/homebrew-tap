class Temingo < Formula
  desc "Minimal golang templater for websites"
  homepage "https://github.com/thetillhoff/temingo"
  license "MIT"
  version "v3.0.26"

  on_macos do
    on_arm do
      url "#{homepage}/releases/download/#{version}/temingo_darwin_arm64"
      sha256 "24256695b9a9399b9f2acbf8a2825158a600b9e6a42e9386207aa669a13a7ff5"
    end

    on_intel do
      url "#{homepage}/releases/download/#{version}/temingo_darwin_amd64"
      sha256 "341d48a6fd3685a13bf8bb1c30a6bc7ff5939b9500871d9cc628d3806fed75e8"
    end
  end

  on_linux do
    on_arm do
      url "#{homepage}/releases/download/#{version}/temingo_linux_arm64"
      sha256 "c3a088503a685e03a3e20aa6e33536e7163d03fd96adedc86ca29247c986ee75"
    end

    on_intel do
      url "#{homepage}/releases/download/#{version}/temingo_linux_amd64"
      sha256 "84a9d9fc221827e07ca50595b3f9e64cf41ffdd5bf483a54f1bbc0ba43daa2db"
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
