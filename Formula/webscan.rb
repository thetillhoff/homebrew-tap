class Webscan < Formula
  desc "Verifies web things"
  homepage "https://github.com/thetillhoff/webscan"
  license "MIT"
  version "v4.0.3"

  on_macos do
    on_arm do
      url "#{homepage}/releases/download/#{version}/webscan_darwin_arm64"
      sha256 "7e21896171a69ca89449ee80069de4ee5d3c488275b720246fc3d526b24d0c52"
    end

    on_intel do
      url "#{homepage}/releases/download/#{version}/webscan_darwin_amd64"
      sha256 "ae992aa7e6615d3ab690a95be9cb4036ea31f0e2d34058ba2832386f9dd9d80f"
    end
  end

  on_linux do
    on_arm do
      url "#{homepage}/releases/download/#{version}/webscan_linux_arm64"
      sha256 "5077fb625a57a9210eb275e8d8062daca0fcb7d4982d603841f0446e966ec88d"
    end

    on_intel do
      url "#{homepage}/releases/download/#{version}/webscan_linux_amd64"
      sha256 "8aa7412e7399c46773d05db6dc2114425108ab10372daae26c4692d0b5d7fbef"
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
