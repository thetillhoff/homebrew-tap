class Webscan < Formula
  desc "Verifies web things"
  homepage "https://github.com/thetillhoff/webscan"
  license "MIT"
  version "v5.4.33"

  on_macos do
    on_arm do
      url "#{homepage}/releases/download/#{version}/webscan_darwin_arm64"
      sha256 "0b9b8dbea26a1e72f2ba0abae780fae78eb48380d3c65c57be1f5339d7c1c9f9"
    end

    on_intel do
      url "#{homepage}/releases/download/#{version}/webscan_darwin_amd64"
      sha256 "1796753222c2cd4963f0af570297857a9e3a836f1ad306a1806bd496ad86ec39"
    end
  end

  on_linux do
    on_arm do
      url "#{homepage}/releases/download/#{version}/webscan_linux_arm64"
      sha256 "bf0998cb1a737f77b829d07b8a86d80e9a0119eff244f65fddc36ad3da6b8f49"
    end

    on_intel do
      url "#{homepage}/releases/download/#{version}/webscan_linux_amd64"
      sha256 "313122da4c9df320787af2667e1029312eb81627b8e42ab14ef13e9a2a95acdc"
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
