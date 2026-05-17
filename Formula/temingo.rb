class Temingo < Formula
  desc "Minimal golang templater for websites"
  homepage "https://github.com/thetillhoff/temingo"
  license "MIT"
  version "v2.5.0"

  on_macos do
    on_arm do
      url "#{homepage}/releases/download/#{version}/temingo_darwin_arm64"
      sha256 "9e41b2b11d4773137bb13a4130e27a78dc5d04e3c7c3190700aacd2899af45d8"
    end

    on_intel do
      url "#{homepage}/releases/download/#{version}/temingo_darwin_amd64"
      sha256 "fc170589078ecdda40157a24cdf513169d69cad5902ae6eebbfd5d75681d9d73"
    end
  end

  on_linux do
    on_arm do
      url "#{homepage}/releases/download/#{version}/temingo_linux_arm64"
      sha256 "b215a0f6f0594f816a988afcf64dea113009d016f24d3ce5541ffe761f58b59f"
    end

    on_intel do
      url "#{homepage}/releases/download/#{version}/temingo_linux_amd64"
      sha256 "8b98196d3a079c6dbd84e0450fb69eb025edef0911b8ef28942741725f85b4db"
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
