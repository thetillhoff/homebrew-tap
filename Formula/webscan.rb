class Webscan < Formula
  desc "Verifies web things"
  homepage "https://github.com/thetillhoff/webscan"
  license "MIT"
  version "v5.4.65"

  on_macos do
    on_arm do
      url "#{homepage}/releases/download/#{version}/webscan_darwin_arm64"
      sha256 "85bf03eaa4bc88455f6df8bc040f8a708173382050719537673e221a1646ff5c"
    end

    on_intel do
      url "#{homepage}/releases/download/#{version}/webscan_darwin_amd64"
      sha256 "a5acfebca6d3d1f0f7b680f9a53cf9416568d373e2f67ebcd93fa29cba3f8ee0"
    end
  end

  on_linux do
    on_arm do
      url "#{homepage}/releases/download/#{version}/webscan_linux_arm64"
      sha256 "6a3fa9ddd5783b6df5aa609a4934fa5e8024e2cfba0f4452f6e6e8299e352115"
    end

    on_intel do
      url "#{homepage}/releases/download/#{version}/webscan_linux_amd64"
      sha256 "deba4b96744df4889630b495df02bf96e0a8c3bd35a0e6191aea1acda8649ef5"
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
