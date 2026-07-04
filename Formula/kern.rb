class Kern < Formula
  desc "Pi coding agent harness with model routing, bash safety, and subagent delegation"
  homepage "https://github.com/thetillhoff/kern"
  license "MIT"
  version "v0.1.18"

  on_macos do
    on_arm do
      url "#{homepage}/releases/download/#{version}/kern_darwin_arm64.tar.gz"
      sha256 "0081b00926ddf765e4117925a38f8651ad81ed50fffff275840d0b403aea62b5"
    end

    on_intel do
      url "#{homepage}/releases/download/#{version}/kern_darwin_amd64.tar.gz"
      sha256 "29ba2aefba89430f51ab95b5df1fac25090859ae7b8a229430a06ea97761eaa7"
    end
  end

  on_linux do
    on_arm do
      url "#{homepage}/releases/download/#{version}/kern_linux_arm64.tar.gz"
      sha256 "fc4e93f7b8b85714b07577a991c4d5c5f069f4b394048ad1c566ca792e11a4be"
    end

    on_intel do
      url "#{homepage}/releases/download/#{version}/kern_linux_amd64.tar.gz"
      sha256 "0deb3255744a425c49a52d540abb0c51dd149683b676cb636349e299d4327fcc"
    end
  end

  def install
    libexec.install "kern", "package.json", "theme", "assets", "export-html"
    (bin/"kern").write <<~SHELL
      #!/bin/sh
      export PI_PACKAGE_DIR="#{libexec}"
      export PI_SKIP_VERSION_CHECK=1
      exec "#{libexec}/kern" "$@"
    SHELL
  end

  test do
    assert_match "#{version}", shell_output("#{bin}/kern --version")
  end
end
