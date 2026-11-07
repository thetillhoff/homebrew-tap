class Webscan < Formula
  desc "Verifies web things"
  homepage "https://github.com/thetillhoff/webscan"
  license "MIT"
  version "v5.4.53"

  on_macos do
    on_arm do
      url "#{homepage}/releases/download/#{version}/webscan_darwin_arm64"
      sha256 "1a088b869f218487250cee2281627cdb68eaf8846318a368c7c48e27985c17ec"
    end

    on_intel do
      url "#{homepage}/releases/download/#{version}/webscan_darwin_amd64"
      sha256 "fe98c9bfc01b96de5808675902275847d70f706ac5b22391e045da9d1e717a6e"
    end
  end

  on_linux do
    on_arm do
      url "#{homepage}/releases/download/#{version}/webscan_linux_arm64"
      sha256 "c6939a43a9af101482f70c948fc047f6417ed6ecc4a8f79af3a3409521eaa5f4"
    end

    on_intel do
      url "#{homepage}/releases/download/#{version}/webscan_linux_amd64"
      sha256 "d1baecb003462466c16cfe2cbacb3c9a7fa4f41e3eb0b8a1cc5f5b906d7fe311"
    end
  end

  def install
    # Rename the downloaded file to 'webscan' and install it
    bin.install Dir["webscan_*"].first => "webscan"
  end

  test do
    assert_match "#{version}", shell_output("#{bin}/webscan --version")
  end
end
