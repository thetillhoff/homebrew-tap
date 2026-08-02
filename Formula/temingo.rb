class Temingo < Formula
  desc "Minimal golang templater for websites"
  homepage "https://github.com/thetillhoff/temingo"
  license "MIT"
  version "v3.0.12"

  on_macos do
    on_arm do
      url "#{homepage}/releases/download/#{version}/temingo_darwin_arm64"
      sha256 "4520750a7a113ee2cff93398a58e0228ec0c28501d5e8069f409fcef252008b0"
    end

    on_intel do
      url "#{homepage}/releases/download/#{version}/temingo_darwin_amd64"
      sha256 "a9448743ceb2ea3a22ca1ad299564b8815246762a535592f2fc34bb07df511ba"
    end
  end

  on_linux do
    on_arm do
      url "#{homepage}/releases/download/#{version}/temingo_linux_arm64"
      sha256 "5957c94cc2ecce97c235b11159ded27d46bfa309440fe9f390837a70598ebf3d"
    end

    on_intel do
      url "#{homepage}/releases/download/#{version}/temingo_linux_amd64"
      sha256 "675312099c1db3f2c1d2e42a522fc488902dc3bdf7bff07db9ac130bc1ea61d6"
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
