class Webscan < Formula
  desc "Verifies web things"
  homepage "https://github.com/thetillhoff/webscan"
  license "MIT"
  version "v5.4.44"

  on_macos do
    on_arm do
      url "#{homepage}/releases/download/#{version}/webscan_darwin_arm64"
      sha256 "2ce17410c9623a4b9be94e4b1166f2858454f76b4289469efefb772c2acea57c"
    end

    on_intel do
      url "#{homepage}/releases/download/#{version}/webscan_darwin_amd64"
      sha256 "4a4bbce64b638d19f6766796a181980c7f3590de9f47e5900d3e22c48bb5902b"
    end
  end

  on_linux do
    on_arm do
      url "#{homepage}/releases/download/#{version}/webscan_linux_arm64"
      sha256 "1e50f4e99ecc4103d8d024da50b00ade56eb8bfc79c2cc84a1cb7ec293e2682c"
    end

    on_intel do
      url "#{homepage}/releases/download/#{version}/webscan_linux_amd64"
      sha256 "d364f05b7674a02d7eec8f346287e2c7b024f2ceb13be9ee10d3249e2786899e"
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
