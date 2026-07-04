class Kern < Formula
  desc "Pi coding agent harness with model routing, bash safety, and subagent delegation"
  homepage "https://github.com/thetillhoff/kern"
  license "MIT"
  version "v0.1.19"

  on_macos do
    on_arm do
      url "#{homepage}/releases/download/#{version}/kern_darwin_arm64.tar.gz"
      sha256 "978c606cbaf3414db131862d1a526d61234fa97043f81c867301c36b881bdf9e"
    end

    on_intel do
      url "#{homepage}/releases/download/#{version}/kern_darwin_amd64.tar.gz"
      sha256 "fb367dc6efc82d350eb0f521aae5a97087457619e8da3eaacb61e30b46b83549"
    end
  end

  on_linux do
    on_arm do
      url "#{homepage}/releases/download/#{version}/kern_linux_arm64.tar.gz"
      sha256 "ba340996aeb9c8a22127e67470d8dedbac3572c3809a9c4952f740e4705a064f"
    end

    on_intel do
      url "#{homepage}/releases/download/#{version}/kern_linux_amd64.tar.gz"
      sha256 "f4414a74706ee3901928fcd259c9b52855ea38887c11ac97cf80341d4de1ea39"
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
