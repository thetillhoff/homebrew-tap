class Temingo < Formula
  desc "Minimal golang templater for websites"
  homepage "https://github.com/thetillhoff/temingo"
  license "MIT"
  version "v1.1.0"

  on_macos do
    on_arm do
      url "#{homepage}/releases/download/#{version}/temingo_darwin_arm64"
      sha256 "7a19d4a575178454b32e99592f0b30a8bd1d1b6f6a42047b8e7faa5f63867522"
    end

    on_intel do
      url "#{homepage}/releases/download/#{version}/temingo_darwin_amd64"
      sha256 "944386eca802ad5e1e9ff22f8286ff01e6df01499bbb04a7d71c8b8c1f69225a"
    end
  end

  on_linux do
    on_arm do
      url "#{homepage}/releases/download/#{version}/temingo_linux_arm64"
      sha256 "7a3eb89eb6c53822d799531ce8a9604728006ed570223a686be32eb4fd084009"
    end

    on_intel do
      url "#{homepage}/releases/download/#{version}/temingo_linux_amd64"
      sha256 "51a13d4ff73e66613dca8295ac48d9ebf8250050d5e73a1ce28ed09805a698cd"
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
