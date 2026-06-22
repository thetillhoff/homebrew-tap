class Kern < Formula
  desc "Pi coding agent harness with model routing, bash safety, and subagent delegation"
  homepage "https://github.com/thetillhoff/kern"
  license "MIT"
  version "v0.1.0"

  on_macos do
    on_arm do
      url "#{homepage}/releases/download/#{version}/kern_darwin_arm64"
      sha256 "c3b12572084dad387773b99441acca74590194f48c71abd087f41036e907d66a"
    end

    on_intel do
      url "#{homepage}/releases/download/#{version}/kern_darwin_amd64"
      sha256 "9eacbefa1152f5b266bbbc68f3a9760c747c41988830b201ec8b6ec4249f02af"
    end
  end

  on_linux do
    on_arm do
      url "#{homepage}/releases/download/#{version}/kern_linux_arm64"
      sha256 "c8cfe8e55fb8fa4b236dc3b3d05ce563980ceabedcfb26c0e5d273927c82885b"
    end

    on_intel do
      url "#{homepage}/releases/download/#{version}/kern_linux_amd64"
      sha256 "068e94c8d521134881112e70a7b0c38e1ded80a062e0deeef393407c4f5afe60"
    end
  end

  def install
    bin.install Dir["kern_*"].first => "kern"
  end

  test do
    assert_match "#{version}", shell_output("#{bin}/kern --version")
  end
end
