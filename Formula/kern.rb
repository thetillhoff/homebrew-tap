class Kern < Formula
  desc "Pi coding agent harness with model routing, bash safety, and subagent delegation"
  homepage "https://github.com/thetillhoff/kern"
  license "MIT"
  version "v0.1.21"

  on_macos do
    on_arm do
      url "#{homepage}/releases/download/#{version}/kern_darwin_arm64.tar.gz"
      sha256 "82ba276d4017fd82a39b687874e0342c4ed3c3e7e4f91767af3c4f9fdc3376ec"
    end

    on_intel do
      url "#{homepage}/releases/download/#{version}/kern_darwin_amd64.tar.gz"
      sha256 "54eb6a18b66c95f682836d6bdccd0f027209a8dd16640cd756423e081e73228c"
    end
  end

  on_linux do
    on_arm do
      url "#{homepage}/releases/download/#{version}/kern_linux_arm64.tar.gz"
      sha256 "01db8aca69181e047564b7ce89c8e0bfb5574b94562e56d8bdb237e2731214a3"
    end

    on_intel do
      url "#{homepage}/releases/download/#{version}/kern_linux_amd64.tar.gz"
      sha256 "b4f3ff626c5f62b6658fa69a0d16ae8ef82bfc0e27791f7be4bcb5bfbb98c206"
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
