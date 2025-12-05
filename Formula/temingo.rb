class Temingo < Formula
  desc "Minimal golang templater for websites"
  homepage "https://github.com/thetillhoff/temingo"
  license "MIT"
  version "v2.1.4"

  on_macos do
    on_arm do
      url "#{homepage}/releases/download/#{version}/temingo_darwin_arm64"
      sha256 "3be858b3c2d5878e224779907b0a37259e67effacefc9e8bab9695fd0c60b5b9"
    end

    on_intel do
      url "#{homepage}/releases/download/#{version}/temingo_darwin_amd64"
      sha256 "d62ac97ab7bb5aec1b671cb55763d8264e4916a33f55219d38eada998068300b"
    end
  end

  on_linux do
    on_arm do
      url "#{homepage}/releases/download/#{version}/temingo_linux_arm64"
      sha256 "e5a27161bf84f9e5b4f2ca356579dcb201c1eec2e61df7e0ff2b53695a072f41"
    end

    on_intel do
      url "#{homepage}/releases/download/#{version}/temingo_linux_amd64"
      sha256 "40a4f1f6f774800cc001a8568ccccb4637c2dfeac17e362942efe9eda54841c4"
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
