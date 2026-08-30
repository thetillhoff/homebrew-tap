class Webscan < Formula
  desc "Verifies web things"
  homepage "https://github.com/thetillhoff/webscan"
  license "MIT"
  version "v5.4.17"

  on_macos do
    on_arm do
      url "#{homepage}/releases/download/#{version}/webscan_darwin_arm64"
      sha256 "59da76c49ffa434f1eecc3a245f553ef319583bb583368cc8aac6b8c3c96a287"
    end

    on_intel do
      url "#{homepage}/releases/download/#{version}/webscan_darwin_amd64"
      sha256 "57075905c3f9d2f713395a54e80fab22a46e477063b9836e08d78d1a53616554"
    end
  end

  on_linux do
    on_arm do
      url "#{homepage}/releases/download/#{version}/webscan_linux_arm64"
      sha256 "7d063c84dbc542a0f4e253b6d8ee53a79b2f8f43d5ee09dc2e3690e42e9ca0c1"
    end

    on_intel do
      url "#{homepage}/releases/download/#{version}/webscan_linux_amd64"
      sha256 "a006a45e52330db3c76846f5d529cf97caaba3180e6127da1c3851f630c34f32"
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
