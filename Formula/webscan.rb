# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://rubydoc.brew.sh/Formula

class Webscan < Formula
  desc "Verifies web things"
  homepage "https://github.com/thetillhoff/webscan"
  license "MIT"

  depends_on "go" => :build
  
  url "https://github.com/thetillhoff/webscan/archive/refs/tags/v2.0.3.tar.gz"
  sha256 "9a9e5a6967dc5cfb58b167fa99762222ffc90089a92fdc3d23c04b4eee6301fd"

  # on_macos do
  #   if Hardware::CPU.intel?
  #     # macos x86_64
  #     url "https://github.com/thetillhoff/webscan/releases/download/v2.0.2/webscan_darwin_arm64", using:CurlDownloadStrategy
  #     sha256 "9a9e5a6967dc5cfb58b167fa99762222ffc90089a92fdc3d23c04b4eee6301fd"
      
  #     def install
  #       bin.install "webscan"
  #     end
  #   end

  #   if Hardware::CPU.arm?
  #     # darwin arm64
  #     url "https://github.com/thetillhoff/webscan/releases/download/v2.0.2/webscan_darwin_arm64", using:CurlDownloadStrategy
  #     sha256 ""
     
  #     def install
  #       bin.install "webscan"
  #     end
  #   end

  # on_linux do
  #   if Hardware::CPU.intel?
  #     # linux x86_64
  #     url "https://github.com/thetillhoff/webscan/releases/download/v2.0.2/webscan_darwin_arm64", using:CurlDownloadStrategy
  #     sha256 ""
      
  #     def install
  #       bin.install "webscan"
  #     end
  #   end

  #   if Hardware::CPU.arm?
  #     if Hardware::CPU.is_64_bit?
  #       # linux arm64
  #       url "https://github.com/thetillhoff/webscan/releases/download/v2.0.2/webscan_darwin_arm64", using:CurlDownloadStrategy
  #       sha256 ""
      
  #       def install
  #         bin.install "webscan"
  #       end
  #     end

  #     # if !Hardware::CPU.is_64_bit?
  #     #   # linux armv7
  #     #   url "https://github.com/thetillhoff/webscan/releases/download/v2.0.2/webscan_darwin_arm64", using:CurlDownloadStrategy
  #     #   sha256 ""
      
  #     #   def install
  #     #     bin.install "webscan"
  #     #   end
  #     # end
  #   end

  def install
    system "make", "build"
    bin.install "webscan"
    
    generate_completions_from_executable(bin/"webscan", "completion")
  end

  # `test do` will create, run in and delete a temporary directory.
  test do
    system "#{bin}/webscan", "version"
  end
end
