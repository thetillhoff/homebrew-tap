class Temingo < Formula
  desc "Minimal golang templater for websites"
  homepage "https://github.com/thetillhoff/temingo"
  license "MIT"
  version "v2.1.3"

  on_macos do
    on_arm do
      url "#{homepage}/releases/download/#{version}/temingo_darwin_arm64"
      sha256 "1f06b5d5262b4c1ebcd4faf4efe6e5524cfd13daa9720f10e9df5cb4d0302777"
    end

    on_intel do
      url "#{homepage}/releases/download/#{version}/temingo_darwin_amd64"
      sha256 "4c11691585f7a3a7f0c035ce49a625217d76e6801bb033ff608d549a1e139a23"
    end
  end

  on_linux do
    on_arm do
      url "#{homepage}/releases/download/#{version}/temingo_linux_arm64"
      sha256 "a7d756db7a5eeae1d2bef40849c00d981cf147fd523c02d2a1ad61b5b3132620"
    end

    on_intel do
      url "#{homepage}/releases/download/#{version}/temingo_linux_amd64"
      sha256 "6dae6d0db39ab3e03001b44eb134c3ec4f786f83856c7ce97a36b5d0c473ae99"
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
