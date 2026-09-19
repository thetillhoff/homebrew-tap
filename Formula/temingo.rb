class Temingo < Formula
  desc "Minimal golang templater for websites"
  homepage "https://github.com/thetillhoff/temingo"
  license "MIT"
  version "v3.0.22"

  on_macos do
    on_arm do
      url "#{homepage}/releases/download/#{version}/temingo_darwin_arm64"
      sha256 "ab3406fdaf825d9a5f97658dd251233ef7d8afed7aecb9bc0f8ea95e7088ae45"
    end

    on_intel do
      url "#{homepage}/releases/download/#{version}/temingo_darwin_amd64"
      sha256 "f5eb970e9159e7ebf5a7edeeb04727e69d56bd673997f0db6aaac002b4facc60"
    end
  end

  on_linux do
    on_arm do
      url "#{homepage}/releases/download/#{version}/temingo_linux_arm64"
      sha256 "7ce1e664cadbae5385322cc8b4ef37c6e2427e3b195f5250cbae676794f9cfe9"
    end

    on_intel do
      url "#{homepage}/releases/download/#{version}/temingo_linux_amd64"
      sha256 "199e7c71487d9844cbd673759a754b012f5373bb13055fd2e57950465ece1df3"
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
