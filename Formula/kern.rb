class Kern < Formula
  desc "Pi coding agent harness with model routing, bash safety, and subagent delegation"
  homepage "https://github.com/thetillhoff/kern"
  license "MIT"
  version "v0.1.6"

  on_macos do
    on_arm do
      url "#{homepage}/releases/download/#{version}/kern_darwin_arm64.tar.gz"
      sha256 "733185c3e1024e7fa59501be3f4e099b91ffb17498db86d91aaf7c633b301446"
    end

    on_intel do
      url "#{homepage}/releases/download/#{version}/kern_darwin_amd64.tar.gz"
      sha256 "d744688b9e57db581fe0f808af288c0806160010f6debbf4194c3107d09616bf"
    end
  end

  on_linux do
    on_arm do
      url "#{homepage}/releases/download/#{version}/kern_linux_arm64.tar.gz"
      sha256 "4ea37ee29f1b9bebf3de301dd438680634f06462243f909a2753f371c44a4067"
    end

    on_intel do
      url "#{homepage}/releases/download/#{version}/kern_linux_amd64.tar.gz"
      sha256 "8f84fa448ad85facb9d7fa3e80afa8fc77742f4fd91c50b460c00d2ef479d048"
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
