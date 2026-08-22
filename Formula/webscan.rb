class Webscan < Formula
  desc "Verifies web things"
  homepage "https://github.com/thetillhoff/webscan"
  license "MIT"
  version "v5.4.14"

  on_macos do
    on_arm do
      url "#{homepage}/releases/download/#{version}/webscan_darwin_arm64"
      sha256 "b9ff4006d22f015a159333bbb50071b70f5461e19d6f14ffe4569e35e7259a94"
    end

    on_intel do
      url "#{homepage}/releases/download/#{version}/webscan_darwin_amd64"
      sha256 "218f700c04fc5300ae6a7fb1793a09aa2eafd535f65f1112f6521109a20712a7"
    end
  end

  on_linux do
    on_arm do
      url "#{homepage}/releases/download/#{version}/webscan_linux_arm64"
      sha256 "f8fbef61e01e5c6fbb6e7d8f1956304da275533937e94e4386a962ac77c59788"
    end

    on_intel do
      url "#{homepage}/releases/download/#{version}/webscan_linux_amd64"
      sha256 "21a3dfd05270db8d187d7ffeeaffa7a870fb08cc434afa2e51e06d37d50a0588"
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
