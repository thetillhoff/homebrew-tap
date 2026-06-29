class Kern < Formula
  desc "Pi coding agent harness with model routing, bash safety, and subagent delegation"
  homepage "https://github.com/thetillhoff/kern"
  license "MIT"
  version "v0.1.0"

  on_macos do
    on_arm do
      url "#{homepage}/releases/download/#{version}/kern_darwin_arm64"
      sha256 "c679cbadd8473f7cdbcb0c16a45785710790e51668fefbd34f994457ecddb5ff"
    end

    on_intel do
      url "#{homepage}/releases/download/#{version}/kern_darwin_amd64"
      sha256 "5180c629b549c0994addeb1b864e7de2d197518abfded2091b936ae413e766bd"
    end
  end

  on_linux do
    on_arm do
      url "#{homepage}/releases/download/#{version}/kern_linux_arm64"
      sha256 "0bc26ac0cb13be1068d1f19f1da136d5d394fe2868bcbd11758bc5f14eb81632"
    end

    on_intel do
      url "#{homepage}/releases/download/#{version}/kern_linux_amd64"
      sha256 "f88f304f1b6417983000e43c7aab51a973f9485a70dfd6ff562e4e3b64306d19"
    end
  end

  def install
    bin.install Dir["kern_*"].first => "kern"
  end

  test do
    assert_match "#{version}", shell_output("#{bin}/kern --version")
  end
end
