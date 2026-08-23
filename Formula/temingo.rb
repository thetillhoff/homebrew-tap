class Temingo < Formula
  desc "Minimal golang templater for websites"
  homepage "https://github.com/thetillhoff/temingo"
  license "MIT"
  version "v3.0.17"

  on_macos do
    on_arm do
      url "#{homepage}/releases/download/#{version}/temingo_darwin_arm64"
      sha256 "177a2aa25982cbc32d7e2e83c590c53f1f42b52f4d4621efd29d4c813eb31548"
    end

    on_intel do
      url "#{homepage}/releases/download/#{version}/temingo_darwin_amd64"
      sha256 "da04755c87edaea6ee16b7d2143682188cb6202c53ff7fb033408cceb7ebfd4e"
    end
  end

  on_linux do
    on_arm do
      url "#{homepage}/releases/download/#{version}/temingo_linux_arm64"
      sha256 "7bccd313f0c39618aae909727ea3821744c52440c43ec2082d318fff8106f5fa"
    end

    on_intel do
      url "#{homepage}/releases/download/#{version}/temingo_linux_amd64"
      sha256 "384e8ad9e924038ace0b5fdf0c18d1637b16f6a89c5940be95f6479b2f4b133d"
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
