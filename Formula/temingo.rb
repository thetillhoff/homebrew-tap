class Temingo < Formula
  desc "Minimal golang templater for websites"
  homepage "https://github.com/thetillhoff/temingo"
  license "MIT"
  version "v3.0.19"

  on_macos do
    on_arm do
      url "#{homepage}/releases/download/#{version}/temingo_darwin_arm64"
      sha256 "45ace1edc16090e10e8cf818c512594efa605fd72dccb709e7c130cb6ccffa97"
    end

    on_intel do
      url "#{homepage}/releases/download/#{version}/temingo_darwin_amd64"
      sha256 "7a59b43fafc8a6d72a3e43af139ef371e3d7be98ce88b82f0e3c34cb5486d032"
    end
  end

  on_linux do
    on_arm do
      url "#{homepage}/releases/download/#{version}/temingo_linux_arm64"
      sha256 "654d4b6c5e901b7520e73a56e7dd865700d65f7bd5d540fa80bf6d0b5a24bd91"
    end

    on_intel do
      url "#{homepage}/releases/download/#{version}/temingo_linux_amd64"
      sha256 "f04b25ecad66c9ec1321ffcc047ced8ab75f88061c648507478a1f8454833170"
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
