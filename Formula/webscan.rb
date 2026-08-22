class Webscan < Formula
  desc "Verifies web things"
  homepage "https://github.com/thetillhoff/webscan"
  license "MIT"
  version "v5.4.13"

  on_macos do
    on_arm do
      url "#{homepage}/releases/download/#{version}/webscan_darwin_arm64"
      sha256 "f5ec94cf520c68c3266c0edbc993b536e30ad48e437573446137a0d1ec901e4c"
    end

    on_intel do
      url "#{homepage}/releases/download/#{version}/webscan_darwin_amd64"
      sha256 "e807d44bfa3384292a9e97b33c5b3e5344a97c44b150e6d27363fc2fa16d7e9c"
    end
  end

  on_linux do
    on_arm do
      url "#{homepage}/releases/download/#{version}/webscan_linux_arm64"
      sha256 "94eb1f1fcc40d0c3ca40f4c2fc60b97c3af75eead3a3f91b8aa9e8c55db1a564"
    end

    on_intel do
      url "#{homepage}/releases/download/#{version}/webscan_linux_amd64"
      sha256 "b44237a5183d71cd4d82e409b752d57a49321736cff6fc96360b46ee2ff84c67"
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
