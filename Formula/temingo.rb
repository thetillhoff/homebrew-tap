class Temingo < Formula
  desc "Minimal golang templater for websites"
  homepage "https://github.com/thetillhoff/temingo"
  license "MIT"
  version "v2.1.1"

  on_macos do
    on_arm do
      url "#{homepage}/releases/download/#{version}/temingo_darwin_arm64"
      sha256 "ff7add46c8fa12edd234d31378f4e7b0af3f976a84627b256d112e18e0fc1dc3"
    end

    on_intel do
      url "#{homepage}/releases/download/#{version}/temingo_darwin_amd64"
      sha256 "90b297c4e7eb0d603da4a17bb925e87bf5517d198d7a908d6bde023538f774fe"
    end
  end

  on_linux do
    on_arm do
      url "#{homepage}/releases/download/#{version}/temingo_linux_arm64"
      sha256 "efd98c8cafb2b1b4184fa32869ea6bb20e53413b2b85297a5d9019d8495450fe"
    end

    on_intel do
      url "#{homepage}/releases/download/#{version}/temingo_linux_amd64"
      sha256 "d914d72ab0eb6bff2b8df7967c4b0b8d31585b9bf9f7133e97a682a890900d91"
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
