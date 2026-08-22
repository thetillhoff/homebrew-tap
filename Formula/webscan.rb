class Webscan < Formula
  desc "Verifies web things"
  homepage "https://github.com/thetillhoff/webscan"
  license "MIT"
  version "v5.4.10"

  on_macos do
    on_arm do
      url "#{homepage}/releases/download/#{version}/webscan_darwin_arm64"
      sha256 "d513830fc30af330209ed17fe905e9bb8bbddd929cf45ef20d1970346c7039a5"
    end

    on_intel do
      url "#{homepage}/releases/download/#{version}/webscan_darwin_amd64"
      sha256 "ff2dbff18f305db8a55b3b0cba815f5e4f5ea20677b8f7de0421fd049b886e78"
    end
  end

  on_linux do
    on_arm do
      url "#{homepage}/releases/download/#{version}/webscan_linux_arm64"
      sha256 "91ca65fc095cceb624ec77a7f66d511fb8c1b9ab2859465b71ee6634a35df83e"
    end

    on_intel do
      url "#{homepage}/releases/download/#{version}/webscan_linux_amd64"
      sha256 "9b636f90219e3db314d800a0014a42747b41fd52d6154b975def7fca651c31af"
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
