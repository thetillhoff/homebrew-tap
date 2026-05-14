class Temingo < Formula
  desc "Minimal golang templater for websites"
  homepage "https://github.com/thetillhoff/temingo"
  license "MIT"
  version "v2.2.1"

  on_macos do
    on_arm do
      url "#{homepage}/releases/download/#{version}/temingo_darwin_arm64"
      sha256 "c1d21d5a41c56099f70754c198f6ad54c9e7df09b3e30cdc8b3dba238ad9fb7b"
    end

    on_intel do
      url "#{homepage}/releases/download/#{version}/temingo_darwin_amd64"
      sha256 "1a5dbdfdd8f889b30bb192d7ae6398db935a9585f90e05affd3c824e5b938670"
    end
  end

  on_linux do
    on_arm do
      url "#{homepage}/releases/download/#{version}/temingo_linux_arm64"
      sha256 "9b0c76a17e6e5d9742cc360fd02828fb358e81fefd8264b183f9274e2b27175f"
    end

    on_intel do
      url "#{homepage}/releases/download/#{version}/temingo_linux_amd64"
      sha256 "db7b2418d0b903d8d9398f7c9aa083f434d4ef9329509f063c852ff02a90255b"
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
