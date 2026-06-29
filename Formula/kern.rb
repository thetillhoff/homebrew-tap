class Kern < Formula
  desc "Pi coding agent harness with model routing, bash safety, and subagent delegation"
  homepage "https://github.com/thetillhoff/kern"
  license "MIT"
  version "v0.1.2"

  on_macos do
    on_arm do
      url "#{homepage}/releases/download/#{version}/kern_darwin_arm64.tar.gz"
      sha256 "29d92c155de5279f6a87f75397a17abc37be7454d68136f3e2060bb89645e457"
    end

    on_intel do
      url "#{homepage}/releases/download/#{version}/kern_darwin_amd64.tar.gz"
      sha256 "34733cb4885c089545b43255ff622234156c9f662401d6c503869fd7c13e5aa7"
    end
  end

  on_linux do
    on_arm do
      url "#{homepage}/releases/download/#{version}/kern_linux_arm64.tar.gz"
      sha256 "fb8030768bad14576c12969af3d417e90a16b12d6fdd0963b308c7faf5a5c249"
    end

    on_intel do
      url "#{homepage}/releases/download/#{version}/kern_linux_amd64.tar.gz"
      sha256 "178cae3084a17e983bb24f163c997742329f15823a6fb0c54ceb92bd4fe125ec"
    end
  end

  def install
    libexec.install "kern", "package.json", "theme", "assets", "export-html"
    (bin/"kern").write <<~SHELL
      #!/bin/sh
      export PI_PACKAGE_DIR="#{libexec}"
      exec "#{libexec}/kern" "$@"
    SHELL
  end

  test do
    assert_match "#{version}", shell_output("#{bin}/kern --version")
  end
end
