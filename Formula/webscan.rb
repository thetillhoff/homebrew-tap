class Webscan < Formula
  desc "Verifies web things"
  homepage "https://github.com/thetillhoff/webscan"
  license "MIT"
  version "<no value>"

  on_macos do
    on_arm do
      url "https://github.com/yourorg/webscan/releases/download/v#{version}/webscan_darwin_arm64"
      sha256 "<no value>"
    end

    on_intel do
      url "https://github.com/yourorg/webscan/releases/download/v#{version}/webscan_darwin_amd64"
      sha256 "<no value>"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/yourorg/webscan/releases/download/v#{version}/webscan_linux_arm64"
      sha256 "<no value>"
    end

    on_intel do
      url "https://github.com/yourorg/webscan/releases/download/v#{version}/webscan_linux_amd64"
      sha256 "<no value>"
    end
  end

  def install
    bin.install "webscan"
  end

  test do
    assert_match "#{version}", shell_output("#{bin}/webscan --version")
  end
end
