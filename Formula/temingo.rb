class Temingo < Formula
  desc "Minimal golang templater for websites"
  homepage "https://github.com/thetillhoff/temingo"
  license "MIT"
  version "v3.0.20"

  on_macos do
    on_arm do
      url "#{homepage}/releases/download/#{version}/temingo_darwin_arm64"
      sha256 "cc081369a1d1be9a10c7e79918bccc87d261b0d09a9f25ab04ea1758320c90dc"
    end

    on_intel do
      url "#{homepage}/releases/download/#{version}/temingo_darwin_amd64"
      sha256 "8acfdcf11b068cda6e647c4287e534f1127ada2cca07e94962242fa8e8aa7468"
    end
  end

  on_linux do
    on_arm do
      url "#{homepage}/releases/download/#{version}/temingo_linux_arm64"
      sha256 "5e4a87f8aa93602ed319044679003c92846bf029e538d775bb4c64cd7d8b4b08"
    end

    on_intel do
      url "#{homepage}/releases/download/#{version}/temingo_linux_amd64"
      sha256 "1572b8c0d86c05cb8afda5dd821aa942603f824b9bc59300979d18555c840a6d"
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
