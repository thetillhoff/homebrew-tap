class Temingo < Formula
  desc "Minimal golang templater for websites"
  homepage "https://github.com/thetillhoff/temingo"
  license "MIT"
  version "v3.0.27"

  on_macos do
    on_arm do
      url "#{homepage}/releases/download/#{version}/temingo_darwin_arm64"
      sha256 "7ffae81814a8a6d61a2fc052833ba2f1d88eb0152bf2c7efccf9c44b86dc1658"
    end

    on_intel do
      url "#{homepage}/releases/download/#{version}/temingo_darwin_amd64"
      sha256 "afd24ff642a5723c8058eb95eafce31f3f32856f36d410e519b56f72ae4ec15e"
    end
  end

  on_linux do
    on_arm do
      url "#{homepage}/releases/download/#{version}/temingo_linux_arm64"
      sha256 "033d98437e9a49accd88621beee80d9bf2b85985e248e76fe5d7d296932c82eb"
    end

    on_intel do
      url "#{homepage}/releases/download/#{version}/temingo_linux_amd64"
      sha256 "df29c7454b73fc9b2d386a04a0b65bdf0b46d44f5941d2618a662901c8dad4df"
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
