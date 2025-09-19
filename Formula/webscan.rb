class Webscan < Formula
  desc "Verifies web things"
  homepage "https://github.com/thetillhoff/webscan"
  license "MIT"
  version "v4.0.1"

  on_macos do
    on_arm do
      url "https://github.com/yourorg/webscan/releases/download/#{version}/webscan_darwin_arm64"
      sha256 "c622300fbc6a5d3661cfa67b7564ca0018544212a66d075f849709a16dcf8db8"
    end

    on_intel do
      url "https://github.com/yourorg/webscan/releases/download/#{version}/webscan_darwin_amd64"
      sha256 "d597467ce56af60ab8f424caf819c0092aac6e86d2e0f73a7bcaa5b764ed59fb"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/yourorg/webscan/releases/download/#{version}/webscan_linux_arm64"
      sha256 "64aa9393c56f517140c5e8aeda39b6a66b646d82a89f0e87d88d1cc4337921f0"
    end

    on_intel do
      url "https://github.com/yourorg/webscan/releases/download/#{version}/webscan_linux_amd64"
      sha256 "dbd910d87655cef2e0aec8e5e99abe016f00523e94a94ced8342eb4278afcc0d"
    end
  end

  def install
    bin.install "webscan"
  end

  test do
    assert_match "#{version}", shell_output("#{bin}/webscan --version")
  end
end
