class Temingo < Formula
  desc "Minimal golang templater for websites"
  homepage "https://github.com/thetillhoff/temingo"
  license "MIT"
  version "v2.6.0"

  on_macos do
    on_arm do
      url "#{homepage}/releases/download/#{version}/temingo_darwin_arm64"
      sha256 "c5575817571bb0451be69f1a62524714749177a7e4098d002b526edce4152d04"
    end

    on_intel do
      url "#{homepage}/releases/download/#{version}/temingo_darwin_amd64"
      sha256 "766a1fa247250cccaa4bb605825efe5a93aa5c9c1109dab017787fd1718fa8e7"
    end
  end

  on_linux do
    on_arm do
      url "#{homepage}/releases/download/#{version}/temingo_linux_arm64"
      sha256 "54a916679327a55f587fa315e77a1b94f27448ae8cf3a0b0108e992f104a6204"
    end

    on_intel do
      url "#{homepage}/releases/download/#{version}/temingo_linux_amd64"
      sha256 "ce547f7ae1921141a419d985fa3984fa535ae2dd9d0d0dbf2a3c4a25f12985ba"
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
