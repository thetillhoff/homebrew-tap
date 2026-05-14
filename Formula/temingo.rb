class Temingo < Formula
  desc "Minimal golang templater for websites"
  homepage "https://github.com/thetillhoff/temingo"
  license "MIT"
  version "v2.4.0"

  on_macos do
    on_arm do
      url "#{homepage}/releases/download/#{version}/temingo_darwin_arm64"
      sha256 "277aac13acbcdaf1108878048499bb256868fdbcbcfc2b178cedcce615d831c4"
    end

    on_intel do
      url "#{homepage}/releases/download/#{version}/temingo_darwin_amd64"
      sha256 "d826448a7ac024cbf895e0e04f0cbdb93db76e6e695ddb905d93c0fe42be1301"
    end
  end

  on_linux do
    on_arm do
      url "#{homepage}/releases/download/#{version}/temingo_linux_arm64"
      sha256 "76be0750bf38cc324a0469bdb1fd3d247e2fd7557844f4657521a43e331991a9"
    end

    on_intel do
      url "#{homepage}/releases/download/#{version}/temingo_linux_amd64"
      sha256 "569122c7715f6838764572763512237380bef1bad56362b3d012314ee8397d80"
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
