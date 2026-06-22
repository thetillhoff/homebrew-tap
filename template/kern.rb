class Kern < Formula
  desc "Pi coding agent harness with model routing, bash safety, and subagent delegation"
  homepage "https://github.com/thetillhoff/kern"
  license "MIT"
  version "${LATEST_VERSION}"

  on_macos do
    on_arm do
      url "#{homepage}/releases/download/#{version}/kern_darwin_arm64"
      sha256 "${MACOS_ARM_SHA}"
    end

    on_intel do
      url "#{homepage}/releases/download/#{version}/kern_darwin_amd64"
      sha256 "${MACOS_INTEL_SHA}"
    end
  end

  on_linux do
    on_arm do
      url "#{homepage}/releases/download/#{version}/kern_linux_arm64"
      sha256 "${LINUX_ARM_SHA}"
    end

    on_intel do
      url "#{homepage}/releases/download/#{version}/kern_linux_amd64"
      sha256 "${LINUX_INTEL_SHA}"
    end
  end

  def install
    bin.install Dir["kern_*"].first => "kern"
  end

  test do
    assert_match "#{version}", shell_output("#{bin}/kern --version")
  end
end
