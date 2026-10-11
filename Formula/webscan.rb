class Webscan < Formula
  desc "Verifies web things"
  homepage "https://github.com/thetillhoff/webscan"
  license "MIT"
  version "v5.4.40"

  on_macos do
    on_arm do
      url "#{homepage}/releases/download/#{version}/webscan_darwin_arm64"
      sha256 "3d9eaf225a7d94f31ed272f3fe1234ce7aa46de01af9e42b740038f042929189"
    end

    on_intel do
      url "#{homepage}/releases/download/#{version}/webscan_darwin_amd64"
      sha256 "fc9dc1255a53b373192a7cc0ce3f7d3761e6a6f0f6c497d39f84bbd1a60d7cc3"
    end
  end

  on_linux do
    on_arm do
      url "#{homepage}/releases/download/#{version}/webscan_linux_arm64"
      sha256 "9d37d97c4cb80cb8ed5adec60c8a723faa9952c6f4fe9c1c9e926802c68b973a"
    end

    on_intel do
      url "#{homepage}/releases/download/#{version}/webscan_linux_amd64"
      sha256 "2bd5315fb59e101180c6e6285a86f100d42073ad3be58708750fa4f59fba6406"
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
