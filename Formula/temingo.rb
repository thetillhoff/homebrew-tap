class Temingo < Formula
  desc "Minimal golang templater for websites"
  homepage "https://github.com/thetillhoff/temingo"
  license "MIT"
  version "v3.0.28"

  on_macos do
    on_arm do
      url "#{homepage}/releases/download/#{version}/temingo_darwin_arm64"
      sha256 "0961ee9d84c8b330cae123602f157c232ab0cc169e8891bc2c769d225c6b46b0"
    end

    on_intel do
      url "#{homepage}/releases/download/#{version}/temingo_darwin_amd64"
      sha256 "a8aa2cba8ea5a550c5426c7326dfbe95eb7c5bd1dd449fcc945d928b69f20023"
    end
  end

  on_linux do
    on_arm do
      url "#{homepage}/releases/download/#{version}/temingo_linux_arm64"
      sha256 "c79432cd881535fb341c6449a92e95c04af3a56654fb7abd4061c11641c1cb22"
    end

    on_intel do
      url "#{homepage}/releases/download/#{version}/temingo_linux_amd64"
      sha256 "6339af5fbd217bbfa43fa37608a4e196ad097f7e0d11041c3cf191fe67aa3ce3"
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
