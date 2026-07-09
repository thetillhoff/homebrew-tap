class Webscan < Formula
  desc "Verifies web things"
  homepage "https://github.com/thetillhoff/webscan"
  license "MIT"
  version "v5.4.1"

  on_macos do
    on_arm do
      url "#{homepage}/releases/download/#{version}/webscan_darwin_arm64"
      sha256 "cd494bbf7de8bf10e73dec7de9fe3f7665b89feed4a273cf6c7b0ac6e46db66a"
    end

    on_intel do
      url "#{homepage}/releases/download/#{version}/webscan_darwin_amd64"
      sha256 "02f2b863bcb3fb563ec6cdeca1c98980940856c3b46beb6d2b8a65743ec6d259"
    end
  end

  on_linux do
    on_arm do
      url "#{homepage}/releases/download/#{version}/webscan_linux_arm64"
      sha256 "0d8511ba5d1601193fa14138a9a0e44d0f4b5ef34f1b833bd7e75351953e0a5d"
    end

    on_intel do
      url "#{homepage}/releases/download/#{version}/webscan_linux_amd64"
      sha256 "8edebc80e5caed30fee97bd2f952d583091351129819a50483f49d72360aae82"
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
