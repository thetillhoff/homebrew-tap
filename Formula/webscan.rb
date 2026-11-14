class Webscan < Formula
  desc "Verifies web things"
  homepage "https://github.com/thetillhoff/webscan"
  license "MIT"
  version "v5.4.58"

  on_macos do
    on_arm do
      url "#{homepage}/releases/download/#{version}/webscan_darwin_arm64"
      sha256 "b31e0de44f3e27505e78655a365ca59c12e22e4d412ea2bc9a472f6b6f70bb26"
    end

    on_intel do
      url "#{homepage}/releases/download/#{version}/webscan_darwin_amd64"
      sha256 "32fd862cf1378fe4862b54ee3fda9911000149c3bd11eba709650b2d51182ca0"
    end
  end

  on_linux do
    on_arm do
      url "#{homepage}/releases/download/#{version}/webscan_linux_arm64"
      sha256 "94d19528985ab541cec08a6328ae1f8fdbb608cf5e0a19abc8be31b2762b2244"
    end

    on_intel do
      url "#{homepage}/releases/download/#{version}/webscan_linux_amd64"
      sha256 "cb12a429da44aeab584efac938d2ab31b08ea9dfd6e69eb37060fbc62ede9dbe"
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
